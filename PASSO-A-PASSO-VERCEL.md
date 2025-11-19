# 🎯 Passo a Passo: Configurar Variáveis na Vercel

## ⚠️ O Erro Ainda Aparece?

Isso significa que as variáveis **ainda não foram configuradas na Vercel** ou o **redeploy não foi feito**.

## 📸 Guia Visual Passo a Passo

### 1️⃣ Acesse a Vercel

1. Vá para: https://vercel.com/dashboard
2. Faça login
3. Clique no projeto: **comunidade-ia-puce**

### 2️⃣ Vá em Settings

1. No topo da página, clique em **"Settings"**
2. No menu lateral esquerdo, clique em **"Environment Variables"**

### 3️⃣ Adicione a Primeira Variável

1. Clique no botão **"Add New"** (ou **"Add"**)

2. Preencha:
   - **Key:** `VITE_SUPABASE_URL`
   - **Value:** `https://ydbvbpguttphuejmxuwh.supabase.co`
   - **Environments:** Marque TODAS as opções:
     - ✅ Production
     - ✅ Preview  
     - ✅ Development

3. Clique em **"Save"**

### 4️⃣ Adicione a Segunda Variável

1. Clique em **"Add New"** novamente

2. Preencha:
   - **Key:** `VITE_SUPABASE_PUBLISHABLE_KEY`
   - **Value:** Cole a chave COMPLETA:
     ```
     eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlkYnZicGd1dHRwaHVlam14dXdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0ODg1OTEsImV4cCI6MjA3OTA2NDU5MX0.m3sm_HKgYphnuZOM6lzh5IJ7D-UsyEeiguu51CRgJgU
     ```
   - **Environments:** Marque TODAS as opções:
     - ✅ Production
     - ✅ Preview
     - ✅ Development

3. Clique em **"Save"**

### 5️⃣ Verifique se Estão Salvas

Você deve ver na lista:
- ✅ `VITE_SUPABASE_URL`
- ✅ `VITE_SUPABASE_PUBLISHABLE_KEY`

### 6️⃣ FAÇA O REDEPLOY (MUITO IMPORTANTE!)

1. Vá em **"Deployments"** (no topo)
2. Encontre o último deployment
3. Clique nos **três pontos (...)** à direita
4. Selecione **"Redeploy"**
5. Aguarde o status mudar para **"Ready"** (pode levar 1-2 minutos)

### 7️⃣ Teste

1. Acesse: `comunidade-ia-puce.vercel.app`
2. Abra o console (F12)
3. **Limpe o cache** (Ctrl+Shift+R ou Cmd+Shift+R)
4. Verifique se não há mais erros

## 🚨 Problemas Comuns

### ❌ "Ainda aparece o erro após configurar"
**Solução:** Você esqueceu de fazer o **REDEPLOY**! As variáveis só funcionam após redeploy.

### ❌ "A chave parece estar incorreta"
**Solução:** 
- Verifique se copiou a chave **COMPLETA** (é muito longa, ~200 caracteres)
- Verifique se não há espaços no início/fim
- Certifique-se de usar a **anon public key** (não service_role)

### ❌ "As variáveis não aparecem na lista"
**Solução:** 
- Certifique-se de clicar em **"Save"** após adicionar
- Recarregue a página da Vercel

## ✅ Checklist Final

- [ ] Variável `VITE_SUPABASE_URL` adicionada
- [ ] Variável `VITE_SUPABASE_PUBLISHABLE_KEY` adicionada
- [ ] Ambas marcadas para Production, Preview e Development
- [ ] **REDEPLOY feito** (muito importante!)
- [ ] Cache do navegador limpo
- [ ] Testado e funcionando

## 🔗 Links Diretos

- [Vercel Dashboard](https://vercel.com/dashboard)
- [Seu Projeto](https://vercel.com/josepedro15/comunidade-ia-puce) (ajuste conforme seu usuário)

---

**💡 DICA:** Se ainda não funcionar após seguir todos os passos, verifique o console do navegador (F12) para ver mensagens de erro mais detalhadas.

