# 🔧 Configuração Completa - Variáveis de Ambiente

## 📋 Informações do Projeto Supabase

- **Project ID:** `ydbvbpguttphuejmxuwh`
- **Project URL:** `https://ydbvbpguttphuejmxuwh.supabase.co`

## 🔑 Chaves Identificadas

### ✅ **ANON PUBLIC KEY** (Use esta no frontend!)
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlkYnZicGd1dHRwaHVlam14dXdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0ODg1OTEsImV4cCI6MjA3OTA2NDU5MX0.m3sm_HKgYphnuZOM6lzh5IJ7D-UsyEeiguu51CRgJgU
```

### ❌ **SERVICE_ROLE KEY** (NUNCA use no frontend!)
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlkYnZicGd1dHRwaHVlam14dXdoIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzQ4ODU5MSwiZXhwIjoyMDc5MDY0NTkxfQ.rULb9BkNuW5OuY5t8e83gusuuyDhVNv5L77PjevLous
```

⚠️ **ATENÇÃO:** A service_role key tem acesso total ao banco e NUNCA deve ser exposta no frontend!

---

## 🚀 Configuração na Vercel

### Passo 1: Acessar Vercel Dashboard
1. Vá para [vercel.com](https://vercel.com)
2. Faça login
3. Selecione o projeto `comunidade-ia-puce` (ou seu projeto)

### Passo 2: Adicionar Variáveis de Ambiente
1. Vá em **Settings** → **Environment Variables**
2. Clique em **Add New**

#### Variável 1: VITE_SUPABASE_URL
- **Name:** `VITE_SUPABASE_URL`
- **Value:** `https://ydbvbpguttphuejmxuwh.supabase.co`
- **Environment:** ✅ Production, ✅ Preview, ✅ Development

#### Variável 2: VITE_SUPABASE_PUBLISHABLE_KEY
- **Name:** `VITE_SUPABASE_PUBLISHABLE_KEY`
- **Value:** `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlkYnZicGd1dHRwaHVlam14dXdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0ODg1OTEsImV4cCI6MjA3OTA2NDU5MX0.m3sm_HKgYphnuZOM6lzh5IJ7D-UsyEeiguu51CRgJgU`
- **Environment:** ✅ Production, ✅ Preview, ✅ Development

### Passo 3: Fazer Redeploy
1. Vá em **Deployments**
2. Clique nos **três pontos (...)** do último deployment
3. Selecione **Redeploy**
4. Aguarde o deploy completar

---

## 💻 Configuração Local (Desenvolvimento)

Crie um arquivo `.env.local` na raiz do projeto:

```env
VITE_SUPABASE_URL=https://ydbvbpguttphuejmxuwh.supabase.co
VITE_SUPABASE_PUBLISHABLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlkYnZicGd1dHRwaHVlam14dXdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0ODg1OTEsImV4cCI6MjA3OTA2NDU5MX0.m3sm_HKgYphnuZOM6lzh5IJ7D-UsyEeiguu51CRgJgU
```

⚠️ **IMPORTANTE:** 
- O arquivo `.env.local` já está no `.gitignore` (não será commitado)
- NUNCA commite este arquivo no git!

---

## ✅ Verificação

Após configurar:

1. **Na Vercel:**
   - Faça redeploy
   - Acesse o site
   - O erro "Invalid API key" deve desaparecer
   - O login deve funcionar

2. **Localmente:**
   - Crie o arquivo `.env.local`
   - Execute `npm run dev`
   - A aplicação deve conectar ao Supabase

---

## 🔒 Segurança

### ✅ O que é seguro:
- ✅ Usar a **anon public key** no frontend
- ✅ Armazenar variáveis na Vercel
- ✅ A anon key está limitada pelas políticas RLS (Row Level Security)

### ❌ O que NUNCA fazer:
- ❌ Usar a **service_role key** no frontend
- ❌ Commitar arquivos `.env` no git
- ❌ Expor a service_role key publicamente
- ❌ Compartilhar a service_role key

---

## 🐛 Troubleshooting

### Erro: "Invalid API key"
- ✅ Verifique se está usando a **anon public key** (não service_role)
- ✅ Verifique se copiou a chave completa (sem espaços)
- ✅ Verifique se fez redeploy após configurar

### Erro: "Missing env.VITE_SUPABASE_URL"
- ✅ Verifique se adicionou a variável na Vercel
- ✅ Verifique se marcou todos os ambientes (Production, Preview, Development)
- ✅ Faça redeploy após adicionar

### Erro: 401 Unauthorized
- ✅ Verifique se a chave está correta
- ✅ Verifique se não está usando a service_role key
- ✅ Tente gerar uma nova anon key no Supabase se necessário

---

**Status:** ✅ Configuração pronta para uso

