# ⚡ Verificação Rápida - Erro "Invalid API key"

## 🔍 Status Atual

O erro ainda está aparecendo, o que indica que as variáveis de ambiente **ainda não foram configuradas na Vercel** ou o **redeploy não foi feito**.

## ✅ Checklist de Verificação

### 1. Variáveis Configuradas na Vercel?
- [ ] Acessou [Vercel Dashboard](https://vercel.com)
- [ ] Foi em **Settings** → **Environment Variables**
- [ ] Adicionou `VITE_SUPABASE_URL` = `https://ydbvbpguttphuejmxuwh.supabase.co`
- [ ] Adicionou `VITE_SUPABASE_PUBLISHABLE_KEY` = `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlkYnZicGd1dHRwaHVlam14dXdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0ODg1OTEsImV4cCI6MjA3OTA2NDU5MX0.m3sm_HKgYphnuZOM6lzh5IJ7D-UsyEeiguu51CRgJgU`
- [ ] Marcou **todas** as opções: Production, Preview, Development

### 2. Redeploy Feito?
- [ ] Foi em **Deployments**
- [ ] Clicou nos **três pontos (...)** do último deployment
- [ ] Selecionou **Redeploy**
- [ ] Aguardou o deploy completar (pode levar 1-2 minutos)

### 3. Verificação no Console

Após o redeploy, abra o console do navegador (F12) e verifique:

**✅ Se estiver correto, você verá:**
- Nenhum erro de "Invalid API key"
- Nenhum erro 401
- A aplicação carrega normalmente

**❌ Se ainda houver erro:**
- Verifique se copiou a chave completa (sem espaços)
- Verifique se está usando a **anon public key** (não service_role)
- Verifique se o redeploy foi concluído

## 🚨 Problemas Comuns

### Problema 1: Variáveis não aparecem após adicionar
**Solução:** Certifique-se de clicar em **Save** após adicionar cada variável.

### Problema 2: Redeploy não atualizou
**Solução:** 
- Aguarde 2-3 minutos após o redeploy
- Limpe o cache do navegador (Ctrl+Shift+R ou Cmd+Shift+R)
- Tente em uma aba anônima

### Problema 3: Erro persiste mesmo após configurar
**Solução:**
- Verifique se copiou a chave **completa** (é muito longa)
- Verifique se não há espaços extras no início/fim
- Tente deletar e recriar as variáveis na Vercel

## 📋 Passo a Passo Detalhado

### Passo 1: Acessar Vercel
1. Vá para https://vercel.com
2. Faça login
3. Selecione o projeto `comunidade-ia-puce`

### Passo 2: Adicionar Variáveis
1. Clique em **Settings** (no topo)
2. Clique em **Environment Variables** (no menu lateral)
3. Clique em **Add New**

**Primeira variável:**
- **Key:** `VITE_SUPABASE_URL`
- **Value:** `https://ydbvbpguttphuejmxuwh.supabase.co`
- Marque: ✅ Production, ✅ Preview, ✅ Development
- Clique em **Save**

**Segunda variável:**
- Clique em **Add New** novamente
- **Key:** `VITE_SUPABASE_PUBLISHABLE_KEY`
- **Value:** `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlkYnZicGd1dHRwaHVlam14dXdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0ODg1OTEsImV4cCI6MjA3OTA2NDU5MX0.m3sm_HKgYphnuZOM6lzh5IJ7D-UsyEeiguu51CRgJgU`
- Marque: ✅ Production, ✅ Preview, ✅ Development
- Clique em **Save**

### Passo 3: Fazer Redeploy
1. Vá em **Deployments** (no topo)
2. Encontre o último deployment
3. Clique nos **três pontos (...)** à direita
4. Selecione **Redeploy**
5. Aguarde o deploy completar (status "Ready")

### Passo 4: Testar
1. Acesse o site: `comunidade-ia-puce.vercel.app`
2. Abra o console (F12)
3. Verifique se não há mais erros
4. Tente fazer login

## 🔗 Links Úteis

- [Vercel Dashboard](https://vercel.com/dashboard)
- [Supabase Dashboard](https://app.supabase.com)
- [Documentação Completa](./CONFIGURACAO-COMPLETA.md)

---

**⚠️ IMPORTANTE:** As variáveis de ambiente só funcionam após fazer o **redeploy** na Vercel!

