-- ============================================================================
-- TORNAR USUÁRIO ADMIN: José Pedro
-- ============================================================================
-- Execute este SQL no Supabase SQL Editor
-- ============================================================================

-- Tornar o usuário jopedromkt@gmail.com em admin
UPDATE public.user_profiles
SET is_admin = true
WHERE user_id = (
  SELECT id 
  FROM auth.users 
  WHERE email = 'jopedromkt@gmail.com'
);

-- Verificar se funcionou
SELECT 
  u.email,
  u.id as user_id,
  up.nome,
  up.plano,
  up.is_admin,
  up.data_adesao
FROM auth.users u
JOIN public.user_profiles up ON up.user_id = u.id
WHERE u.email = 'jopedromkt@gmail.com';

-- ============================================================================
-- RESULTADO ESPERADO:
-- is_admin deve estar como 'true'
-- ============================================================================
--
-- APÓS EXECUTAR:
-- 1. O usuário precisa fazer logout e login novamente
-- 2. Ou aguardar alguns segundos para o hook useAuth recarregar
-- 3. A propriedade isAdmin será true
-- ============================================================================

