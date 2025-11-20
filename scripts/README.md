# 📦 Scripts de Migração de Conteúdo

Scripts para migrar conteúdo da pasta `conteudo/` para o banco de dados Supabase.

---

## 🚀 Scripts Disponíveis

### `migrate-prompts.ts`

Migra todos os 100 prompts da pasta `conteudo/prompts/` para a tabela `prompts` do Supabase.

**Uso:**
```bash
npm run migrate:prompts
```

**O que faz:**
1. Lê todos os arquivos `.txt` da pasta `conteudo/prompts/`
2. Extrai metadados do nome do arquivo (título, categoria, subcategoria, ordem)
3. Lê o conteúdo de cada arquivo
4. Insere ou atualiza no banco de dados Supabase
5. Gera relatório de migração

**Requisitos:**
- Variáveis de ambiente configuradas (`.env`)
  - `VITE_SUPABASE_URL`
  - `VITE_SUPABASE_ANON_KEY`
- Tabela `prompts` criada no Supabase
- Estrutura de pastas mantida (`conteudo/prompts/[Categoria]/`)

**Características:**
- ✅ Idempotente (pode ser executado múltiplas vezes)
- ✅ Atualiza prompts existentes (baseado em `titulo + categoria`)
- ✅ Valida dados antes de inserir
- ✅ Relatório detalhado de erros

---

## 📋 Pré-requisitos

### 1. Instalar Dependências

```bash
npm install
```

### 2. Configurar Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
VITE_SUPABASE_URL=https://seu-projeto.supabase.co
VITE_SUPABASE_ANON_KEY=sua-chave-anon
```

### 3. Verificar Estrutura do Banco

Certifique-se de que a tabela `prompts` existe:

```sql
CREATE TABLE IF NOT EXISTS public.prompts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo TEXT NOT NULL,
  categoria TEXT NOT NULL,
  subcategoria TEXT,
  conteudo TEXT NOT NULL,
  ordem INTEGER NOT NULL DEFAULT 0,
  ativo BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);
```

---

## 🎯 Como Usar

### Migração de Prompts

1. **Verificar estrutura de pastas:**
   ```
   conteudo/prompts/
   ├── Vendas/
   ├── Marketing/
   ├── Atendimento/
   ├── Operacional/
   └── Estrategico/
   ```

2. **Executar migração:**
   ```bash
   npm run migrate:prompts
   ```

3. **Verificar resultado:**
   - O script mostrará um relatório no final
   - Verifique os logs para erros
   - Confirme no Supabase que os dados foram inseridos

---

## 🔍 Estrutura Esperada dos Arquivos

### Nomenclatura de Arquivos

Os arquivos devem seguir o padrão:
```
NN-descricao-do-prompt.txt
```

Exemplo:
- `01-prospeccao-mensagem-linkedin.txt`
- `02-prospeccao-email-frio.txt`

### Estrutura do Conteúdo

O conteúdo do arquivo será inserido diretamente no campo `conteudo` da tabela.

---

## 📊 Mapeamento de Categorias

| Pasta | Categoria no Banco |
|-------|-------------------|
| `Vendas/` | `Vendas` |
| `Marketing/` | `Marketing` |
| `Atendimento/` | `Atendimento` |
| `Operacional/` | `Operacional` |
| `Estrategico/` | `Estratégico` |

---

## 🐛 Troubleshooting

### Erro: "Variáveis de ambiente não configuradas"

**Solução:** Verifique se o arquivo `.env` existe e contém as variáveis corretas.

### Erro: "Tabela prompts não existe"

**Solução:** Execute a migração do schema do banco de dados primeiro.

### Erro: "Formato de nome inválido"

**Solução:** Verifique se os arquivos seguem o padrão `NN-descricao.txt`.

### Erro: "Arquivo vazio"

**Solução:** Verifique se o arquivo tem conteúdo válido.

---

## 📝 Notas

- O script é **idempotente**: pode ser executado múltiplas vezes sem duplicar dados
- Prompts existentes serão **atualizados** (baseado em `titulo + categoria`)
- O script **não deleta** prompts que não estão mais nos arquivos
- Erros em um arquivo **não interrompem** o processamento dos demais

---

## 🔄 Próximos Scripts

- [ ] `migrate-tools.ts` - Migrar ferramentas de markdown
- [ ] `migrate-modules.ts` - Migrar módulos e aulas
- [ ] `validate-content.ts` - Validar integridade do conteúdo

---

**Última atualização:** Janeiro 2025

