/**
 * Script de Migração de Prompts
 * 
 * Migra todos os prompts da pasta conteudo/prompts/ para o banco de dados Supabase
 * 
 * Uso:
 *   npx tsx scripts/migrate-prompts.ts
 * 
 * Requisitos:
 *   - Variáveis de ambiente configuradas (.env)
 *   - Supabase client configurado
 */

import { readdir, readFile } from 'fs/promises';
import { join } from 'path';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

// Carregar variáveis de ambiente
dotenv.config();

// Configuração do Supabase
const supabaseUrl = process.env.VITE_SUPABASE_URL;
// Tenta usar service_role_key primeiro (para bypass RLS), senão usa anon_key
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Erro: Variáveis de ambiente não configuradas');
  console.error('   Necessário: VITE_SUPABASE_URL');
  console.error('   E um dos: SUPABASE_SERVICE_ROLE_KEY (recomendado) ou VITE_SUPABASE_ANON_KEY');
  console.error('\n   Para migração, recomenda-se usar SUPABASE_SERVICE_ROLE_KEY');
  console.error('   (encontre em: Supabase Dashboard > Settings > API > service_role key)');
  process.exit(1);
}

// Se usar service_role_key, bypassa RLS automaticamente
const usingServiceRole = !!process.env.SUPABASE_SERVICE_ROLE_KEY;
if (usingServiceRole) {
  console.log('✅ Usando service_role_key (bypass RLS)');
} else {
  console.log('⚠️  Usando anon_key - certifique-se de estar autenticado como admin');
}

const supabase = createClient(supabaseUrl, supabaseKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false
  }
});

// Mapeamento de categorias
const CATEGORIA_MAP: Record<string, string> = {
  'Vendas': 'Vendas',
  'Marketing': 'Marketing',
  'Atendimento': 'Atendimento',
  'Operacional': 'Operacional',
  'Estrategico': 'Estratégico',
};

// Mapeamento de subcategorias (extraído do nome do arquivo)
const SUBCATEGORIA_PATTERNS: Record<string, string> = {
  'prospeccao': 'Prospecção',
  'argumentos': 'Argumentos de Venda',
  'followup': 'Follow-up',
  'objecoes': 'Objeções',
  'fechamento': 'Fechamento',
  'propostas': 'Propostas',
  'copy': 'Copy',
  'campanhas': 'Campanhas',
  'redes-sociais': 'Redes Sociais',
  'landing-pages': 'Landing Pages',
  'seo': 'SEO',
  'analise': 'Análise',
  'conteudo': 'Conteúdo',
  'respostas-padrao': 'Respostas Padrão',
  'escalacao': 'Escalação',
  'faq-automatizado': 'FAQ Automatizado',
  'pos-venda': 'Pós-Venda',
  'suporte-tecnico': 'Suporte Técnico',
  'treinamento': 'Treinamento',
  'analise-dados': 'Análise de Dados',
  'processos': 'Processos',
  'gestao': 'Gestão',
  'produtividade': 'Produtividade',
  'comunicacao': 'Comunicação',
  'riscos': 'Riscos',
  'compliance': 'Compliance',
  'metricas': 'Métricas',
  'planejamento': 'Planejamento',
  'decisoes': 'Decisões',
  'inovacao': 'Inovação',
  'crescimento': 'Crescimento',
  'parcerias': 'Parcerias',
  'expansao': 'Expansão',
  'posicionamento': 'Posicionamento',
  'transformacao': 'Transformação',
  'sustentabilidade': 'Sustentabilidade',
  'cultura': 'Cultura',
  'lideranca': 'Liderança',
  'crises': 'Gestão de Crises',
  'fusao': 'Fusão e Aquisição',
  'revisao': 'Revisão Estratégica',
};

interface PromptData {
  titulo: string;
  categoria: string;
  subcategoria: string | null;
  conteudo: string;
  ordem: number;
}

/**
 * Extrai metadados do nome do arquivo
 */
function parseFileName(filename: string, categoria: string): Partial<PromptData> {
  // Remove extensão
  const nameWithoutExt = filename.replace('.txt', '');
  
  // Extrai número e descrição
  const match = nameWithoutExt.match(/^(\d+)-(.+)$/);
  if (!match) {
    throw new Error(`Formato de nome inválido: ${filename}`);
  }
  
  const [, numeroStr, descricao] = match;
  const ordem = parseInt(numeroStr, 10);
  
  // Extrai subcategoria da descrição
  let subcategoria: string | null = null;
  for (const [pattern, subcat] of Object.entries(SUBCATEGORIA_PATTERNS)) {
    if (descricao.includes(pattern)) {
      subcategoria = subcat;
      break;
    }
  }
  
  // Formata título
  const titulo = descricao
    .split('-')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
  
  return {
    titulo,
    categoria,
    subcategoria,
    ordem,
  };
}

/**
 * Lê e processa um arquivo de prompt
 */
async function processPromptFile(filePath: string, categoria: string): Promise<PromptData> {
  const filename = filePath.split('/').pop() || filePath.split('\\').pop() || '';
  const metadata = parseFileName(filename, categoria);
  
  // Lê conteúdo do arquivo
  const conteudo = await readFile(filePath, 'utf-8');
  
  if (!conteudo.trim()) {
    throw new Error(`Arquivo vazio: ${filename}`);
  }
  
  return {
    titulo: metadata.titulo!,
    categoria: metadata.categoria!,
    subcategoria: metadata.subcategoria || null,
    conteudo: conteudo.trim(),
    ordem: metadata.ordem!,
  };
}

/**
 * Processa todos os prompts de uma categoria
 */
async function processCategory(categoriaPath: string, categoria: string): Promise<PromptData[]> {
  const files = await readdir(categoriaPath);
  const txtFiles = files.filter(f => f.endsWith('.txt')).sort();
  
  const prompts: PromptData[] = [];
  
  for (const file of txtFiles) {
    const filePath = join(categoriaPath, file);
    try {
      const prompt = await processPromptFile(filePath, categoria);
      prompts.push(prompt);
      console.log(`  ✅ ${file} - ${prompt.titulo}`);
    } catch (error: any) {
      console.error(`  ❌ Erro ao processar ${file}:`, error.message);
    }
  }
  
  return prompts;
}

/**
 * Insere prompts no banco de dados
 */
async function insertPrompts(prompts: PromptData[]): Promise<{ success: number; errors: number }> {
  let success = 0;
  let errors = 0;
  
  for (const prompt of prompts) {
    try {
      // Verifica se já existe
      const { data: existing } = await supabase
        .from('prompts')
        .select('id')
        .eq('titulo', prompt.titulo)
        .eq('categoria', prompt.categoria)
        .maybeSingle();
      
      if (existing) {
        // Atualiza se já existe
        const { error } = await supabase
          .from('prompts')
          .update({
            subcategoria: prompt.subcategoria,
            conteudo: prompt.conteudo,
            ordem: prompt.ordem,
            updated_at: new Date().toISOString(),
          })
          .eq('id', existing.id);
        
        if (error) throw error;
        console.log(`  🔄 Atualizado: ${prompt.titulo}`);
      } else {
        // Insere novo
        const { error } = await supabase
          .from('prompts')
          .insert({
            titulo: prompt.titulo,
            categoria: prompt.categoria,
            subcategoria: prompt.subcategoria,
            conteudo: prompt.conteudo,
            ordem: prompt.ordem,
            ativo: true,
          });
        
        if (error) throw error;
        console.log(`  ➕ Inserido: ${prompt.titulo}`);
      }
      
      success++;
    } catch (error: any) {
      console.error(`  ❌ Erro ao inserir "${prompt.titulo}":`, error.message);
      errors++;
    }
  }
  
  return { success, errors };
}

/**
 * Função principal
 */
async function main() {
  console.log('🚀 Iniciando migração de prompts...\n');
  
  const conteudoPath = join(process.cwd(), 'conteudo', 'prompts');
  const categorias = Object.keys(CATEGORIA_MAP);
  
  const allPrompts: PromptData[] = [];
  
  // Processa cada categoria
  for (const categoriaFolder of categorias) {
    const categoriaPath = join(conteudoPath, categoriaFolder);
    
    try {
      console.log(`\n📁 Processando categoria: ${CATEGORIA_MAP[categoriaFolder]}`);
      const prompts = await processCategory(categoriaPath, CATEGORIA_MAP[categoriaFolder]);
      allPrompts.push(...prompts);
    } catch (error: any) {
      console.error(`❌ Erro ao processar categoria ${categoriaFolder}:`, error.message);
    }
  }
  
  console.log(`\n\n📊 Total de prompts processados: ${allPrompts.length}`);
  
  // Insere no banco
  console.log('\n💾 Inserindo no banco de dados...\n');
  const result = await insertPrompts(allPrompts);
  
  // Relatório final
  console.log('\n' + '='.repeat(50));
  console.log('📋 RELATÓRIO FINAL');
  console.log('='.repeat(50));
  console.log(`✅ Sucesso: ${result.success}`);
  console.log(`❌ Erros: ${result.errors}`);
  console.log(`📦 Total: ${allPrompts.length}`);
  console.log('='.repeat(50));
  
  if (result.errors === 0) {
    console.log('\n🎉 Migração concluída com sucesso!');
  } else {
    console.log('\n⚠️  Migração concluída com erros. Revise os logs acima.');
    process.exit(1);
  }
}

// Executa
main().catch(error => {
  console.error('❌ Erro fatal:', error);
  process.exit(1);
});

