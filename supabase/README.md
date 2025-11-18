# 🗄️ Estrutura do Banco de Dados - Supabase

Este diretório contém os scripts SQL para configurar toda a estrutura do banco de dados da plataforma.

## 📋 Arquivos

1. **`000_complete_schema.sql`** - Script completo com toda a estrutura do banco
2. **`001_storage_policies.sql`** - Políticas RLS para os Storage Buckets
3. **`STORAGE_BUCKETS.md`** - Instruções para criar os Storage Buckets

## 🚀 Como Usar

### Opção 1: Via Supabase Dashboard (Recomendado)

1. Acesse o [Supabase Dashboard](https://app.supabase.com)
2. Selecione seu projeto
3. Vá em **SQL Editor** no menu lateral
4. Abra o arquivo `000_complete_schema.sql`
5. Cole todo o conteúdo no editor
6. Clique em **Run** para executar
7. Repita o processo com `001_storage_policies.sql` (após criar os buckets)

### Opção 2: Via CLI do Supabase

```bash
# Certifique-se de estar logado
supabase login

# Link seu projeto local ao remoto
supabase link --project-ref seu-project-ref

# Aplique as migrações
supabase db push
```

### Opção 3: Via Migração Existente

Se você já tem o sistema de migrações configurado, os arquivos na pasta `migrations/` serão aplicados automaticamente.

## 📦 O que o Script Cria

### Tabelas
- ✅ `user_profiles` - Perfis dos usuários
- ✅ `user_roles` - Roles adicionais (opcional)
- ✅ `modulos` - Módulos de aprendizado
- ✅ `aulas` - Aulas dos módulos
- ✅ `progresso_aulas` - Progresso dos usuários
- ✅ `ferramentas` - Ferramentas recomendadas
- ✅ `prompts` - Biblioteca de prompts
- ✅ `lives` - Lives e eventos
- ✅ `favorites` - Itens favoritados

### Tipos ENUM
- ✅ `plan_type` - Tipos de plano (essencial, completo, premium)
- ✅ `live_status` - Status de lives (agendada, ao_vivo, concluida, cancelada)
- ✅ `app_role` - Roles do sistema (admin, moderator, user)

### Funções
- ✅ `is_admin()` - Verifica se usuário é admin
- ✅ `has_role()` - Verifica role do usuário
- ✅ `update_updated_at_column()` - Atualiza updated_at automaticamente
- ✅ `handle_new_user()` - Cria perfil ao cadastrar usuário

### Triggers
- ✅ Criação automática de perfil ao cadastrar usuário
- ✅ Atualização automática de `updated_at` em todas as tabelas

### Políticas RLS
- ✅ Políticas para todas as tabelas
- ✅ Acesso baseado em plano do usuário
- ✅ Permissões de admin
- ✅ Políticas de Storage (após criar buckets)

### Índices
- ✅ Índices para performance em todas as tabelas principais

## 🔐 Segurança (RLS)

Todas as tabelas têm Row Level Security (RLS) habilitado com políticas que:

- ✅ Usuários só veem seus próprios dados quando aplicável
- ✅ Acesso a módulos/aulas baseado no plano do usuário
- ✅ Admins têm acesso total
- ✅ Usuários autenticados podem ver conteúdo público (prompts, ferramentas, lives)

## 📦 Storage Buckets

Os Storage Buckets precisam ser criados manualmente. Veja `STORAGE_BUCKETS.md` para instruções detalhadas.

Buckets necessários:
- `videos` - Vídeos de aulas (privado)
- `materiais` - PDFs e documentos (privado)
- `logos` - Logos de ferramentas (público)
- `avatars` - Fotos de perfil (privado)

## ✅ Verificação

Após executar os scripts, verifique:

1. **Tabelas criadas:**
   ```sql
   SELECT table_name 
   FROM information_schema.tables 
   WHERE table_schema = 'public';
   ```

2. **RLS habilitado:**
   ```sql
   SELECT tablename, rowsecurity 
   FROM pg_tables 
   WHERE schemaname = 'public';
   ```

3. **Funções criadas:**
   ```sql
   SELECT routine_name 
   FROM information_schema.routines 
   WHERE routine_schema = 'public';
   ```

4. **Teste de criação de perfil:**
   - Crie um usuário via Auth
   - Verifique se o perfil foi criado automaticamente:
   ```sql
   SELECT * FROM user_profiles WHERE user_id = 'seu-user-id';
   ```

## 🔧 Troubleshooting

### Erro: "relation already exists"
- Algumas tabelas já existem. O script usa `CREATE TABLE IF NOT EXISTS`, então é seguro executar novamente.

### Erro: "type already exists"
- Os ENUMs já existem. O script verifica antes de criar, então é seguro.

### Erro: "policy already exists"
- O script remove políticas existentes antes de criar novas. Se ainda der erro, remova manualmente:
  ```sql
  DROP POLICY IF EXISTS "nome_da_policy" ON public.nome_da_tabela;
  ```

### RLS não está funcionando
- Verifique se o RLS está habilitado:
  ```sql
  ALTER TABLE public.nome_da_tabela ENABLE ROW LEVEL SECURITY;
  ```

## 📝 Notas

- O script é **idempotente** - pode ser executado múltiplas vezes sem problemas
- Todas as políticas antigas são removidas antes de criar novas
- Os triggers são recriados a cada execução
- Os índices usam `IF NOT EXISTS` para evitar erros

## 🆘 Suporte

Se encontrar problemas:
1. Verifique os logs no Supabase Dashboard
2. Confira se todas as dependências estão criadas (ENUMs, funções)
3. Execute os scripts na ordem correta

---

**Última atualização:** Janeiro 2025

