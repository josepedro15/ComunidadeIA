# 🔗 Integração com n8n - Criação Automática de Usuários

Este documento explica como configurar o n8n para criar usuários automaticamente após uma compra.

## 📋 Fluxo

1. **Cliente compra** → Plataforma de pagamento (Stripe, PagSeguro, etc)
2. **Webhook do pagamento** → n8n recebe notificação
3. **n8n insere dados** → Tabela `pending_users` no Supabase
4. **n8n cria usuário** → Via API Admin do Supabase
5. **Trigger automático** → Cria perfil em `user_profiles`

## 🛠️ Configuração no n8n

### Opção 1: Usando API Admin do Supabase (Recomendado)

#### Passo 1: Inserir em pending_users

Use o nó **Supabase** ou **HTTP Request**:

```json
POST https://[seu-projeto].supabase.co/rest/v1/pending_users
Headers:
  apikey: [service_role_key]
  Authorization: Bearer [service_role_key]
  Content-Type: application/json
  Prefer: return=representation

Body:
{
  "email": "{{ $json.email }}",
  "nome": "{{ $json.nome }}",
  "plano": "{{ $json.plano }}", // 'essencial', 'completo' ou 'premium'
  "dados_pagamento": {
    "transaction_id": "{{ $json.transaction_id }}",
    "gateway": "{{ $json.gateway }}",
    "valor": "{{ $json.valor }}",
    "data_compra": "{{ $json.data_compra }}"
  }
}
```

#### Passo 2: Criar usuário no Auth

Use o nó **HTTP Request**:

```json
POST https://[seu-projeto].supabase.co/auth/v1/admin/users
Headers:
  Authorization: Bearer [service_role_key]
  Content-Type: application/json

Body:
{
  "email": "{{ $json.email }}",
  "password": "{{ $json.senha_temporaria }}", // Gere uma senha aleatória
  "email_confirm": true,
  "user_metadata": {
    "nome": "{{ $json.nome }}",
    "plano": "{{ $json.plano }}"
  }
}
```

#### Passo 3: Atualizar pending_users

Após criar o usuário, atualize o registro:

```json
PATCH https://[seu-projeto].supabase.co/rest/v1/pending_users?email=eq.{{ $json.email }}
Headers:
  apikey: [service_role_key]
  Authorization: Bearer [service_role_key]
  Content-Type: application/json
  Prefer: return=representation

Body:
{
  "user_id": "{{ $json.id }}", // ID retornado na criação do usuário
  "processado": true
}
```

### Opção 2: Usando Edge Function (Alternativa)

Crie uma Edge Function no Supabase que será chamada pelo n8n:

```typescript
// supabase/functions/create-user-from-pending/index.ts
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

serve(async (req) => {
  const { email, nome, plano, dados_pagamento } = await req.json()

  const supabaseAdmin = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
  )

  // 1. Insere em pending_users
  const { data: pendingUser, error: pendingError } = await supabaseAdmin
    .from('pending_users')
    .insert({
      email,
      nome,
      plano,
      dados_pagamento
    })
    .select()
    .single()

  if (pendingError) {
    return new Response(JSON.stringify({ error: pendingError.message }), {
      status: 400,
      headers: { 'Content-Type': 'application/json' }
    })
  }

  // 2. Gera senha temporária
  const senhaTemporaria = crypto.randomUUID().slice(0, 12)

  // 3. Cria usuário no auth
  const { data: authUser, error: authError } = await supabaseAdmin.auth.admin.createUser({
    email,
    password: senhaTemporaria,
    email_confirm: true,
    user_metadata: {
      nome,
      plano
    }
  })

  if (authError) {
    // Atualiza pending_user com erro
    await supabaseAdmin
      .from('pending_users')
      .update({
        erro_processamento: authError.message,
        processado: true
      })
      .eq('id', pendingUser.id)

    return new Response(JSON.stringify({ error: authError.message }), {
      status: 400,
      headers: { 'Content-Type': 'application/json' }
    })
  }

  // 4. Atualiza pending_user
  await supabaseAdmin
    .from('pending_users')
    .update({
      user_id: authUser.user.id,
      processado: true
    })
    .eq('id', pendingUser.id)

  // 5. Envia email com senha temporária (opcional)
  // Use o serviço de email do Supabase ou outro serviço

  return new Response(JSON.stringify({ 
    success: true,
    user_id: authUser.user.id,
    senha_temporaria: senhaTemporaria // Envie por email, não retorne na API
  }), {
    status: 200,
    headers: { 'Content-Type': 'application/json' }
  })
})
```

## 📧 Envio de Email com Credenciais

Após criar o usuário, envie um email com as credenciais:

### Exemplo de Email

```
Assunto: Bem-vindo à Comunidade IA! Suas credenciais de acesso

Olá {{ nome }}!

Sua compra foi confirmada e sua conta foi criada com sucesso!

Credenciais de acesso:
Email: {{ email }}
Senha temporária: {{ senha_temporaria }}

IMPORTANTE: Por favor, altere sua senha após o primeiro login.

Acesse: https://suaplataforma.com/login

Atenciosamente,
Equipe Comunidade IA
```

## 🔐 Variáveis Necessárias no n8n

Configure as seguintes variáveis de ambiente no n8n:

- `SUPABASE_URL` - URL do seu projeto Supabase
- `SUPABASE_SERVICE_ROLE_KEY` - Service Role Key (NUNCA use a anon key!)
- `SUPABASE_ANON_KEY` - Anon key (opcional, para leitura)

## ⚠️ Segurança

1. **NUNCA** exponha a `service_role_key` no frontend
2. Use apenas no n8n ou em Edge Functions
3. Sempre valide os dados antes de criar usuários
4. Implemente rate limiting no n8n
5. Use HTTPS para todas as requisições

## 🔄 Fluxo Completo no n8n

```
1. Webhook Trigger (recebe notificação de pagamento)
   ↓
2. Validar dados do pagamento
   ↓
3. Inserir em pending_users
   ↓
4. Criar usuário via API Admin
   ↓
5. Atualizar pending_users
   ↓
6. Enviar email com credenciais
   ↓
7. (Opcional) Notificar admin sobre novo usuário
```

## 📊 Monitoramento

Monitore a tabela `pending_users` para verificar:

- Usuários pendentes: `SELECT * FROM pending_users WHERE processado = false`
- Erros: `SELECT * FROM pending_users WHERE erro_processamento IS NOT NULL`
- Processados com sucesso: `SELECT * FROM pending_users WHERE processado = true AND user_id IS NOT NULL`

## 🐛 Troubleshooting

### Erro: "Email já existe"
- Verifique se o email já está cadastrado
- Considere enviar email de recuperação de senha ao invés de criar novo usuário

### Erro: "Invalid password"
- A senha deve ter pelo menos 6 caracteres
- Use caracteres alfanuméricos

### Usuário criado mas perfil não
- Verifique se o trigger `on_auth_user_created` está ativo
- Verifique os logs do Supabase

### RLS bloqueando inserção
- Certifique-se de usar `service_role_key` (bypassa RLS)
- Verifique as políticas RLS da tabela `pending_users`

---

**Última atualização:** Janeiro 2025

