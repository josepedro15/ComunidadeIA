# 🔧 Configurar Variáveis de Ambiente na Vercel

O erro "supabaseUrl is required" indica que as variáveis de ambiente não estão configuradas na Vercel.

## 📋 Passo a Passo

### 1. Acesse o Dashboard da Vercel
1. Vá para [vercel.com](https://vercel.com)
2. Faça login na sua conta
3. Selecione o projeto `ComunidadeIA`

### 2. Configure as Variáveis de Ambiente
1. Vá em **Settings** (Configurações)
2. Clique em **Environment Variables** (Variáveis de Ambiente)
3. Adicione as seguintes variáveis:

#### Variável 1:
- **Name:** `VITE_SUPABASE_URL`
- **Value:** `https://seu-projeto.supabase.co`
- **Environment:** Production, Preview, Development (marque todos)

#### Variável 2:
- **Name:** `VITE_SUPABASE_PUBLISHABLE_KEY`
- **Value:** `sua_chave_anon_aqui`
- **Environment:** Production, Preview, Development (marque todos)

#### Variável 3 (Opcional):
- **Name:** `VITE_WHATSAPP_LINK`
- **Value:** `https://chat.whatsapp.com/...`
- **Environment:** Production, Preview, Development (marque todos)

### 3. Onde Encontrar os Valores

#### VITE_SUPABASE_URL
1. Acesse o [Supabase Dashboard](https://app.supabase.com)
2. Selecione seu projeto
3. Vá em **Settings** → **API**
4. Copie o valor de **Project URL**

#### VITE_SUPABASE_PUBLISHABLE_KEY
1. No mesmo lugar (Settings → API)
2. Copie o valor de **anon public** key (não use a service_role_key!)

### 4. Redeploy
Após adicionar as variáveis:
1. Vá em **Deployments**
2. Clique nos três pontos (...) do último deployment
3. Selecione **Redeploy**
4. Ou faça um novo commit para trigger automático

## ✅ Verificação

Após o redeploy, acesse o site e verifique:
- Não deve mais aparecer o erro "supabaseUrl is required"
- A página deve carregar normalmente
- O login deve funcionar

## 🔒 Segurança

⚠️ **IMPORTANTE:**
- Nunca commite o arquivo `.env` ou `.env.local` no git
- Use apenas a **anon key** (publishable key), nunca a service_role_key
- As variáveis na Vercel são seguras e não são expostas no código

## 📝 Exemplo de Valores

```
VITE_SUPABASE_URL=https://abcdefghijklmnop.supabase.co
VITE_SUPABASE_PUBLISHABLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprbG1ub3AiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTYxNjIzOTAyMiwiZXhwIjoxOTMxODE1MDIyfQ.exemplo
```

---

**Última atualização:** Janeiro 2025

