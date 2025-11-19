# 🔧 Solução: Erro "Invalid API key"

## 🐛 Problema Identificado

O erro **"Invalid API key"** e os erros **401 (Unauthorized)** no console indicam que as variáveis de ambiente do Supabase não estão configuradas corretamente na Vercel.

## ✅ Solução Rápida

### Passo 1: Obter as Credenciais do Supabase

1. Acesse [Supabase Dashboard](https://app.supabase.com)
2. Selecione seu projeto
3. Vá em **Settings** → **API**
4. Copie:
   - **Project URL** (exemplo: `https://ydbvbpguttphuejmxuwh.supabase.co`)
   - **anon public** key (a chave longa que começa com `eyJ...`)

⚠️ **IMPORTANTE:** Use apenas a **anon public** key, NUNCA a `service_role` key!

### Passo 2: Configurar na Vercel

1. Acesse [Vercel Dashboard](https://vercel.com)
2. Selecione o projeto `comunidade-ia-puce` (ou seu projeto)
3. Vá em **Settings** → **Environment Variables**
4. Adicione as seguintes variáveis:

#### Variável 1:
- **Name:** `VITE_SUPABASE_URL`
- **Value:** Cole a URL do seu projeto Supabase
- **Environment:** ✅ Production, ✅ Preview, ✅ Development

#### Variável 2:
- **Name:** `VITE_SUPABASE_PUBLISHABLE_KEY`
- **Value:** Cole a anon public key
- **Environment:** ✅ Production, ✅ Preview, ✅ Development

### Passo 3: Fazer Redeploy

Após adicionar as variáveis:

1. Vá em **Deployments**
2. Clique nos **três pontos (...)** do último deployment
3. Selecione **Redeploy**
4. Aguarde o deploy completar

### Passo 4: Verificar

Após o redeploy:
- ✅ O erro "Invalid API key" deve desaparecer
- ✅ O login deve funcionar
- ✅ Não deve mais aparecer erros 401 no console

## 🔍 Verificação Local (Desenvolvimento)

Para testar localmente, crie um arquivo `.env.local` na raiz do projeto:

```env
VITE_SUPABASE_URL=https://seu-projeto.supabase.co
VITE_SUPABASE_PUBLISHABLE_KEY=sua_chave_anon_aqui
```

⚠️ **NUNCA** commite o arquivo `.env.local` no git!

## 🚨 Erros Comuns

### Erro: "Missing env.VITE_SUPABASE_URL"
- **Causa:** Variável não configurada
- **Solução:** Adicione a variável na Vercel e faça redeploy

### Erro: "Invalid API key"
- **Causa:** Chave incorreta ou service_role key usada
- **Solução:** Verifique se está usando a **anon public** key correta

### Erro: 401 Unauthorized
- **Causa:** Chave inválida ou expirada
- **Solução:** Gere uma nova anon key no Supabase e atualize na Vercel

## 📝 Checklist

- [ ] Variáveis configuradas na Vercel
- [ ] Usando a **anon public** key (não service_role)
- [ ] Variáveis marcadas para Production, Preview e Development
- [ ] Redeploy feito após configurar variáveis
- [ ] Testado localmente com `.env.local` (opcional)

## 🔒 Segurança

- ✅ As variáveis na Vercel são seguras
- ✅ A anon key é pública e pode ser exposta no frontend
- ❌ NUNCA use a service_role key no frontend
- ❌ NUNCA commite arquivos `.env` no git

---

**Status:** ⚠️ Configuração necessária na Vercel

