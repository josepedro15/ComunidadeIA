# 📦 Plano de Migração de Conteúdo para a Plataforma

**Data:** Janeiro 2025  
**Objetivo:** Migrar todo o conteúdo da pasta `conteudo/` para o banco de dados Supabase

---

## 📊 INVENTÁRIO DE CONTEÚDO

### ✅ Conteúdo Disponível

1. **100 Prompts** (`.txt`)
   - 20 Vendas
   - 20 Marketing
   - 20 Atendimento
   - 20 Operacional
   - 20 Estratégico

2. **Listas de Ferramentas** (`.md`)
   - `FERRAMENTAS-RECOMENDADAS.md`
   - `LISTA-COMPLETA-FERRAMENTAS-IA-2025.md`

3. **Documentação** (`.md`)
   - `ANALISE-MATERIAL.md`
   - `ROADMAP-CRIACAO.md`
   - `MATERIAL-COMUNIDADE.md`
   - `INDICE-PROMPTS.md`

---

## 🎯 ESTRATÉGIA DE MIGRAÇÃO

### Fase 1: Prompts (Prioridade Alta) ✅

**Objetivo:** Migrar os 100 prompts para a tabela `prompts`

**Estrutura de Dados:**
```sql
prompts (
  id UUID,
  titulo TEXT,
  categoria TEXT,        -- 'Vendas', 'Marketing', 'Atendimento', 'Operacional', 'Estratégico'
  subcategoria TEXT,      -- 'Prospecção', 'Copy', 'Respostas Padrão', etc.
  conteudo TEXT,         -- Conteúdo completo do prompt
  ordem INTEGER,         -- Ordem dentro da categoria
  ativo BOOLEAN,         -- true por padrão
  created_at TIMESTAMP,
  updated_at TIMESTAMP
)
```

**Mapeamento de Categorias:**
- `Vendas/` → `categoria: 'Vendas'`
- `Marketing/` → `categoria: 'Marketing'`
- `Atendimento/` → `categoria: 'Atendimento'`
- `Operacional/` → `categoria: 'Operacional'`
- `Estrategico/` → `categoria: 'Estratégico'`

**Mapeamento de Subcategorias:**
- Extrair do nome do arquivo ou estrutura de pastas
- Exemplo: `01-prospeccao-mensagem-linkedin.txt` → `subcategoria: 'Prospecção'`

**Ordem:**
- Extrair do número no início do arquivo
- Exemplo: `01-...` → `ordem: 1`, `02-...` → `ordem: 2`

**Título:**
- Extrair do nome do arquivo, formatando adequadamente
- Exemplo: `01-prospeccao-mensagem-linkedin.txt` → `titulo: 'Mensagem de Prospecção no LinkedIn'`

---

### Fase 2: Ferramentas (Prioridade Média) ⚠️

**Objetivo:** Migrar ferramentas das listas markdown para a tabela `ferramentas`

**Desafio:** 
- Arquivos são markdown, não estruturados
- Precisa parsear o markdown para extrair dados
- Pode precisar de processamento manual ou script inteligente

**Estrutura de Dados:**
```sql
ferramentas (
  id UUID,
  nome TEXT,
  descricao TEXT,
  categoria TEXT,        -- Extrair do markdown
  preco TEXT,            -- 'Gratuito', 'Freemium', 'Pago', etc.
  link TEXT,
  logo_url TEXT,         -- Opcional
  casos_uso TEXT[],      -- Array de casos de uso
  ordem INTEGER,
  ativo BOOLEAN,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
)
```

**Estratégia:**
1. Ler arquivos markdown
2. Identificar seções de ferramentas
3. Extrair informações (nome, descrição, link, preço)
4. Criar registros no banco

---

### Fase 3: Módulos e Aulas (Prioridade Baixa) 📝

**Status:** Não há conteúdo de vídeo/módulos na pasta `conteudo/`

**Ação:** Criar estrutura vazia ou aguardar conteúdo

---

## 🛠️ IMPLEMENTAÇÃO

### Opção 1: Script Node.js (Recomendado)

**Vantagens:**
- ✅ Processa todos os arquivos automaticamente
- ✅ Valida dados antes de inserir
- ✅ Pode ser executado múltiplas vezes (idempotente)
- ✅ Logs detalhados

**Arquivo:** `scripts/migrate-content.js` ou `scripts/migrate-content.ts`

**Funcionalidades:**
1. Ler todos os arquivos `.txt` da pasta `conteudo/prompts/`
2. Extrair metadados do nome do arquivo
3. Ler conteúdo do arquivo
4. Mapear para estrutura do banco
5. Inserir no Supabase via API
6. Gerar relatório de migração

### Opção 2: SQL Script

**Vantagens:**
- ✅ Simples e direto
- ✅ Pode ser executado no Supabase SQL Editor
- ✅ Não requer Node.js

**Desvantagens:**
- ⚠️ Precisa processar arquivos manualmente
- ⚠️ Pode ser muito grande (100 prompts)
- ⚠️ Difícil de manter

### Opção 3: Interface Admin

**Vantagens:**
- ✅ Upload via interface web
- ✅ Validação visual
- ✅ Pode editar antes de salvar

**Desvantagens:**
- ⚠️ Requer desenvolvimento
- ⚠️ Mais lento para 100 prompts

---

## 📋 CHECKLIST DE MIGRAÇÃO

### Preparação
- [ ] Verificar estrutura do banco de dados
- [ ] Criar script de migração
- [ ] Testar com 1-2 prompts
- [ ] Validar formato dos dados

### Execução
- [ ] Migrar todos os 100 prompts
- [ ] Verificar integridade dos dados
- [ ] Testar busca e filtros na plataforma
- [ ] Validar categorias e subcategorias

### Pós-Migração
- [ ] Verificar se todos os prompts aparecem na interface
- [ ] Testar funcionalidade de favoritos
- [ ] Validar ordenação por categoria
- [ ] Documentar processo

---

## 🔍 VALIDAÇÕES NECESSÁRIAS

### Antes de Migrar
1. **Formato dos Arquivos:**
   - ✅ Todos são `.txt`?
   - ✅ Nomenclatura consistente?
   - ✅ Conteúdo não está vazio?

2. **Estrutura do Banco:**
   - ✅ Tabela `prompts` existe?
   - ✅ Campos corretos?
   - ✅ Índices criados?

3. **Categorias:**
   - ✅ Categorias mapeadas corretamente?
   - ✅ Subcategorias identificadas?
   - ✅ Ordem definida?

### Após Migrar
1. **Integridade:**
   - ✅ Todos os 100 prompts foram inseridos?
   - ✅ Nenhum duplicado?
   - ✅ Campos obrigatórios preenchidos?

2. **Funcionalidade:**
   - ✅ Busca funciona?
   - ✅ Filtros por categoria funcionam?
   - ✅ Ordenação funciona?

---

## 🚀 PRÓXIMOS PASSOS

1. **Criar Script de Migração** (Opção 1 recomendada)
2. **Testar com Subset** (5-10 prompts)
3. **Executar Migração Completa**
4. **Validar Resultados**
5. **Documentar Processo**

---

## 📝 NOTAS IMPORTANTES

### Tratamento de Erros
- Se um arquivo não puder ser processado, registrar erro mas continuar
- Gerar relatório de erros ao final
- Permitir re-executar apenas arquivos com erro

### Idempotência
- Verificar se prompt já existe antes de inserir
- Usar `titulo + categoria` como chave única
- Permitir atualização se já existir

### Performance
- Inserir em lotes (batch) se possível
- Não fazer 100 requisições individuais
- Usar transações quando apropriado

---

**Criado em:** Janeiro 2025  
**Próxima revisão:** Após implementação do script

