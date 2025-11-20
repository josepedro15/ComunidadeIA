# 📋 Resumo: Como Subir Conteúdo para a Plataforma

## ✅ O que foi criado

1. **Plano de Migração** (`PLANO-MIGRACAO-CONTEUDO.md`)
   - Análise completa do conteúdo disponível
   - Estratégia de migração por fases
   - Checklist e validações

2. **Script de Migração** (`scripts/migrate-prompts.ts`)
   - Script TypeScript para migrar os 100 prompts
   - Processamento automático de arquivos
   - Inserção/atualização no Supabase

3. **Documentação** (`scripts/README.md`)
   - Instruções de uso
   - Troubleshooting
   - Estrutura esperada

---

## 🚀 Como Usar (Passo a Passo)

### 1. Instalar Dependências

```bash
npm install
```

Isso instalará:
- `tsx` - Para executar TypeScript
- `dotenv` - Para carregar variáveis de ambiente

### 2. Verificar Variáveis de Ambiente

Certifique-se de que o arquivo `.env` existe e contém:

```env
VITE_SUPABASE_URL=https://seu-projeto.supabase.co
VITE_SUPABASE_ANON_KEY=sua-chave-anon
```

### 3. Executar Migração

```bash
npm run migrate:prompts
```

O script irá:
1. ✅ Ler todos os arquivos `.txt` de `conteudo/prompts/`
2. ✅ Extrair metadados (título, categoria, ordem)
3. ✅ Inserir/atualizar no banco de dados
4. ✅ Gerar relatório final

### 4. Verificar Resultado

- Verifique os logs no terminal
- Confirme no Supabase que os prompts foram inseridos
- Teste a interface da plataforma

---

## 📊 O que será migrado

### Fase 1: Prompts (100 arquivos) ✅

- **20 Vendas**
- **20 Marketing**
- **20 Atendimento**
- **20 Operacional**
- **20 Estratégico**

**Estrutura no banco:**
- `titulo` - Extraído do nome do arquivo
- `categoria` - Baseado na pasta
- `subcategoria` - Extraído do nome do arquivo
- `conteudo` - Conteúdo completo do arquivo
- `ordem` - Número do arquivo (01, 02, etc.)

### Fase 2: Ferramentas (Futuro) ⏳

- Migrar de `FERRAMENTAS-RECOMENDADAS.md`
- Requer script adicional (não implementado ainda)

### Fase 3: Módulos e Aulas (Futuro) ⏳

- Aguardar conteúdo de vídeo
- Criar estrutura quando houver material

---

## ⚠️ Importante

### Antes de Executar

1. ✅ Backup do banco de dados (recomendado)
2. ✅ Verificar se tabela `prompts` existe
3. ✅ Testar com 1-2 prompts primeiro (opcional)

### Durante a Execução

- O script é **idempotente** (pode executar múltiplas vezes)
- Prompts existentes serão **atualizados**
- Erros em um arquivo **não param** o processo

### Após a Execução

- ✅ Verificar relatório de erros
- ✅ Confirmar no Supabase
- ✅ Testar na interface

---

## 🔍 Validações

O script valida:
- ✅ Formato do nome do arquivo
- ✅ Conteúdo não vazio
- ✅ Categoria válida
- ✅ Estrutura do banco

---

## 📝 Exemplo de Saída

```
🚀 Iniciando migração de prompts...

📁 Processando categoria: Vendas
  ✅ 01-prospeccao-mensagem-linkedin.txt - Mensagem de Prospecção no LinkedIn
  ✅ 02-prospeccao-email-frio.txt - Email de Prospecção Fria
  ...

📊 Total de prompts processados: 100

💾 Inserindo no banco de dados...
  ➕ Inserido: Mensagem de Prospecção no LinkedIn
  ➕ Inserido: Email de Prospecção Fria
  ...

==================================================
📋 RELATÓRIO FINAL
==================================================
✅ Sucesso: 100
❌ Erros: 0
📦 Total: 100
==================================================

🎉 Migração concluída com sucesso!
```

---

## 🐛 Problemas Comuns

### "Variáveis de ambiente não configuradas"
→ Verifique o arquivo `.env`

### "Tabela prompts não existe"
→ Execute a migração do schema primeiro

### "Formato de nome inválido"
→ Verifique se os arquivos seguem o padrão `NN-descricao.txt`

---

## 📚 Documentação Completa

- **Plano detalhado:** `PLANO-MIGRACAO-CONTEUDO.md`
- **Instruções do script:** `scripts/README.md`
- **Código do script:** `scripts/migrate-prompts.ts`

---

**Pronto para migrar!** 🚀

Execute `npm run migrate:prompts` quando estiver pronto.

