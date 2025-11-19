# 👑 Como Tornar um Usuário em Admin

Este guia mostra diferentes formas de transformar um usuário em administrador na plataforma.

## 📋 Estrutura do Sistema

O sistema verifica se um usuário é admin através do campo `is_admin` na tabela `user_profiles`:

- **Tabela:** `user_profiles`
- **Campo:** `is_admin` (BOOLEAN)
- **Valor padrão:** `false`

## 🚀 Método 1: Via SQL Editor do Supabase (Recomendado)

Este é o método mais rápido e direto.

### Passo 1: Acessar o Supabase Dashboard

1. Vá para [Supabase Dashboard](https://app.supabase.com)
2. Selecione seu projeto
3. Vá em **SQL Editor** (no menu lateral)

### Passo 2: Executar o SQL

Execute uma das queries abaixo:

#### Opção A: Por Email (Mais Fácil)

```sql
-- Tornar admin por email
UPDATE public.user_profiles
SET is_admin = true
WHERE user_id = (
  SELECT id 
  FROM auth.users 
  WHERE email = 'jopedromkt@gmail.com'
);
```

**Substitua `'jopedromkt@gmail.com'` pelo email do usuário que deseja tornar admin.**

#### Opção B: Por User ID (Mais Preciso)

```sql
-- Primeiro, encontre o user_id do usuário
SELECT 
  u.id as user_id,
  u.email,
  up.nome,
  up.is_admin
FROM auth.users u
LEFT JOIN public.user_profiles up ON up.user_id = u.id
WHERE u.email = 'jopedromkt@gmail.com';

-- Depois, use o user_id retornado para tornar admin
UPDATE public.user_profiles
SET is_admin = true
WHERE user_id = 'COLE_O_USER_ID_AQUI';
```

#### Opção C: Verificar Todos os Admins

```sql
-- Ver todos os usuários admin
SELECT 
  u.email,
  up.nome,
  up.plano,
  up.is_admin,
  up.data_adesao
FROM auth.users u
JOIN public.user_profiles up ON up.user_id = u.id
WHERE up.is_admin = true;
```

### Passo 3: Verificar

Após executar, verifique se funcionou:

```sql
-- Verificar se o usuário agora é admin
SELECT 
  u.email,
  up.nome,
  up.is_admin
FROM auth.users u
JOIN public.user_profiles up ON up.user_id = u.id
WHERE u.email = 'jopedromkt@gmail.com';
```

O campo `is_admin` deve estar como `true`.

---

## 🔧 Método 2: Via Supabase Dashboard (Interface)

### Passo 1: Acessar Table Editor

1. Vá para [Supabase Dashboard](https://app.supabase.com)
2. Selecione seu projeto
3. Vá em **Table Editor** (no menu lateral)
4. Selecione a tabela `user_profiles`

### Passo 2: Encontrar o Usuário

1. Use a busca/filtro para encontrar o usuário pelo `user_id` ou `nome`
2. Clique na linha do usuário

### Passo 3: Editar

1. Localize o campo `is_admin`
2. Altere de `false` para `true`
3. Clique em **Save** (ou pressione Enter)

---

## 💻 Método 3: Via Código (Para Implementar)

Se você quiser criar uma interface admin para gerenciar isso, aqui está um exemplo:

### Função para Tornar Admin (Backend/Edge Function)

```typescript
// Exemplo: Edge Function do Supabase
import { createClient } from '@supabase/supabase-js'

export default async function handler(req: Request) {
  const supabaseAdmin = createClient(
    process.env.SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY! // Use service_role key aqui
  )

  const { userId } = await req.json()

  // Verificar se quem está fazendo a requisição é admin
  // (implementar verificação de autenticação)

  const { error } = await supabaseAdmin
    .from('user_profiles')
    .update({ is_admin: true })
    .eq('user_id', userId)

  if (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      status: 400
    })
  }

  return new Response(JSON.stringify({ success: true }))
}
```

### Hook React para Tornar Admin (Frontend)

```typescript
// hooks/useAdminActions.ts
import { supabase } from '@/integrations/supabase/client'
import { useAuth } from './useAuth'

export function useAdminActions() {
  const { isAdmin } = useAuth()

  const makeUserAdmin = async (userId: string) => {
    if (!isAdmin) {
      throw new Error('Apenas admins podem executar esta ação')
    }

    const { error } = await supabase
      .from('user_profiles')
      .update({ is_admin: true })
      .eq('user_id', userId)

    if (error) throw error
    return { success: true }
  }

  const removeAdmin = async (userId: string) => {
    if (!isAdmin) {
      throw new Error('Apenas admins podem executar esta ação')
    }

    const { error } = await supabase
      .from('user_profiles')
      .update({ is_admin: false })
      .eq('user_id', userId)

    if (error) throw error
    return { success: true }
  }

  return { makeUserAdmin, removeAdmin }
}
```

---

## 🔍 Verificação no Frontend

Após tornar um usuário admin, ele precisa:

1. **Fazer logout e login novamente** (ou aguardar alguns segundos)
2. O hook `useAuth` recarrega o perfil automaticamente
3. A propriedade `isAdmin` será `true`

### Teste Rápido

No console do navegador (F12), após fazer login:

```javascript
// Verificar se é admin
// O hook useAuth já faz isso automaticamente
// Mas você pode verificar diretamente:

const { data } = await supabase
  .from('user_profiles')
  .select('is_admin')
  .eq('user_id', 'SEU_USER_ID')
  .single()

console.log('É admin?', data?.is_admin)
```

---

## ⚠️ Importante

### Segurança

- ✅ Apenas admins podem modificar o campo `is_admin` (via RLS policies)
- ✅ Use a **service_role key** apenas em backends seguros (nunca no frontend)
- ✅ Sempre verifique permissões antes de permitir alterações

### Políticas RLS

As políticas de Row Level Security (RLS) permitem que:
- Admins vejam e atualizem todos os perfis
- Usuários vejam e atualizem apenas seu próprio perfil
- Admins podem inserir novos perfis

### Primeiro Admin

**Problema:** Como criar o primeiro admin se ninguém é admin ainda?

**Solução:** Use o SQL Editor do Supabase com a **service_role key** ou desabilite temporariamente o RLS:

```sql
-- ATENÇÃO: Use apenas para criar o primeiro admin!
-- Depois, reative o RLS

-- Desabilitar RLS temporariamente
ALTER TABLE public.user_profiles DISABLE ROW LEVEL SECURITY;

-- Criar primeiro admin
UPDATE public.user_profiles
SET is_admin = true
WHERE user_id = (
  SELECT id FROM auth.users WHERE email = 'seu-email@exemplo.com'
);

-- Reativar RLS
ALTER TABLE public.user_profiles ENABLE ROW LEVEL SECURITY;
```

---

## 📝 Checklist

- [ ] Identificou o email ou user_id do usuário
- [ ] Executou o SQL ou editou via interface
- [ ] Verificou que `is_admin = true`
- [ ] Usuário fez logout e login novamente
- [ ] Testou acesso às rotas admin (se existirem)

---

## 🔗 Links Úteis

- [Supabase Dashboard](https://app.supabase.com)
- [SQL Editor](https://app.supabase.com/project/_/sql)
- [Table Editor](https://app.supabase.com/project/_/editor)

---

**💡 Dica:** Para desenvolvimento, você pode criar um script SQL que torna vários usuários admin de uma vez:

```sql
-- Tornar múltiplos usuários admin
UPDATE public.user_profiles
SET is_admin = true
WHERE user_id IN (
  SELECT id FROM auth.users 
  WHERE email IN (
    'admin1@exemplo.com',
    'admin2@exemplo.com',
    'admin3@exemplo.com'
  )
);
```

