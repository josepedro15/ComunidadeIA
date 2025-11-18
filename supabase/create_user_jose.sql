-- ============================================================================
-- CRIAR USUÁRIO: José Pedro
-- ============================================================================
-- Execute este SQL e depois crie o usuário via API Admin do Supabase
-- ============================================================================

-- 1. Inserir em pending_users
INSERT INTO public.pending_users (
  email,
  nome,
  plano,
  senha_temporaria,
  dados_pagamento
) VALUES (
  'jopedromkt@gmail.com',
  'Jose Pedro',
  'premium',
  'TempPass123!', -- Senha temporária (usuário deve trocar no primeiro login)
  '{"criado_manual": true, "data": "2025-01-XX"}'::jsonb
);

-- ============================================================================
-- 2. CRIAR USUÁRIO NO AUTH (Execute via API ou Supabase Dashboard)
-- ============================================================================
--
-- Opção A: Via Supabase Dashboard
-- 1. Vá em Authentication > Users > Add User
-- 2. Preencha:
--    - Email: jopedromkt@gmail.com
--    - Password: TempPass123!
--    - Auto Confirm User: SIM
--    - User Metadata:
--      {
--        "nome": "Jose Pedro",
--        "plano": "premium"
--      }
--
-- Opção B: Via API (usando service_role_key)
-- POST https://[seu-projeto].supabase.co/auth/v1/admin/users
-- Headers:
--   Authorization: Bearer [service_role_key]
--   Content-Type: application/json
-- Body:
-- {
--   "email": "jopedromkt@gmail.com",
--   "password": "TempPass123!",
--   "email_confirm": true,
--   "user_metadata": {
--     "nome": "Jose Pedro",
--     "plano": "premium"
--   }
-- }
--
-- 3. Após criar o usuário, atualize o pending_users:
--    UPDATE pending_users 
--    SET user_id = '[user_id_retornado]', processado = true 
--    WHERE email = 'jopedromkt@gmail.com';
--
-- ============================================================================

