# 🔧 Troubleshooting: Links Admin Não Funcionam

## 🐛 Problema

Ao clicar em "Dashboard Admin" ou "Gerenciar Membros", nada acontece.

## ✅ Soluções

### 1. Verificar se é Admin

**Abra o console do navegador (F12)** e verifique os logs:

```
AppSidebar - isAdmin: true/false
```

Se `isAdmin: false`, o problema é que o sistema não reconhece você como admin.

**Solução:**
1. Faça **logout** e **login novamente**
2. Ou aguarde alguns segundos para o hook `useAuth` recarregar o perfil
3. Verifique no banco de dados se `is_admin = true` na tabela `user_profiles`

### 2. Verificar Rotas no Console

Ao clicar nos links, verifique no console:

```
AdminProtectedRoute: { user: true/false, isAdmin: true/false, loading: true/false }
```

**Se aparecer:**
- `AdminProtectedRoute: Redirecionando para /dashboard (não é admin)` → Você não está sendo reconhecido como admin
- `AdminProtectedRoute: Permitindo acesso admin` → A rota está funcionando, mas pode haver outro problema

### 3. Verificar URL

Após clicar, verifique se a URL muda:
- Deve mudar para: `comunidade-ia-puce.vercel.app/admin/dashboard`
- Ou: `comunidade-ia-puce.vercel.app/admin/membros`

**Se a URL não muda:**
- O problema é com a navegação
- Tente recarregar a página
- Limpe o cache do navegador (Ctrl+Shift+R ou Cmd+Shift+R)

### 4. Verificar no Banco de Dados

Execute no Supabase SQL Editor:

```sql
SELECT 
  u.email,
  up.nome,
  up.is_admin
FROM auth.users u
JOIN public.user_profiles up ON up.user_id = u.id
WHERE u.email = 'seu-email@exemplo.com';
```

**Verifique:**
- `is_admin` deve estar como `true`
- Se estiver `false`, execute:

```sql
UPDATE public.user_profiles
SET is_admin = true
WHERE user_id = (
  SELECT id FROM auth.users WHERE email = 'seu-email@exemplo.com'
);
```

### 5. Forçar Recarregamento do Perfil

Se você acabou de tornar admin, o perfil pode não ter sido recarregado.

**Solução:**
1. Faça **logout completo**
2. Feche o navegador
3. Abra novamente
4. Faça **login**

Ou aguarde 10-15 segundos após tornar admin para o hook recarregar automaticamente.

### 6. Verificar Erros no Console

Procure por erros no console (F12):
- Erros de rede
- Erros de autenticação
- Erros de permissão

## 🔍 Checklist de Diagnóstico

- [ ] Console mostra `isAdmin: true`?
- [ ] URL muda ao clicar nos links?
- [ ] `is_admin = true` no banco de dados?
- [ ] Fez logout e login após tornar admin?
- [ ] Não há erros no console?
- [ ] Cache do navegador foi limpo?

## 🚀 Teste Rápido

1. Abra o console (F12)
2. Digite: `window.location.href = '/admin/dashboard'`
3. Pressione Enter

**Se funcionar:** O problema é com a navegação dos links
**Se não funcionar:** O problema é com as rotas ou permissões

## 📝 Próximos Passos

Se nenhuma solução funcionar:

1. Verifique os logs no console
2. Compartilhe os logs com o desenvolvedor
3. Verifique se o deploy na Vercel foi concluído
4. Tente em uma aba anônima (para descartar problemas de cache)

---

**Última atualização:** Após correção de navegação admin

