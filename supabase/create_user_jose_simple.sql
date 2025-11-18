-- ============================================================================
-- CRIAR USUÁRIO: José Pedro - Versão Simples
-- ============================================================================
-- Execute este SQL primeiro
-- ============================================================================

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
  'TempPass123!',
  '{"criado_manual": true}'::jsonb
);

-- ============================================================================
-- PRÓXIMO PASSO:
-- ============================================================================
-- Agora crie o usuário no Supabase Dashboard:
-- 1. Vá em Authentication > Users > Add User
-- 2. Email: jopedromkt@gmail.com
-- 3. Password: TempPass123!
-- 4. Marque "Auto Confirm User"
-- 5. Em User Metadata, adicione:
--    {
--      "nome": "Jose Pedro",
--      "plano": "premium"
--    }
--
-- O trigger vai criar automaticamente o perfil em user_profiles!
-- ============================================================================

