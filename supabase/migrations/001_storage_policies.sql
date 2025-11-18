-- ============================================================================
-- POLÍTICAS RLS PARA STORAGE BUCKETS
-- ============================================================================
-- Execute este script APÓS criar os buckets no Supabase Dashboard
-- Certifique-se de que os buckets 'videos', 'materiais', 'logos' e 'avatars' existem
-- ============================================================================

-- ============================================================================
-- BUCKET: videos
-- ============================================================================

-- Remover políticas existentes (se houver)
DROP POLICY IF EXISTS "Users can read accessible videos" ON storage.objects;
DROP POLICY IF EXISTS "Admins can manage videos" ON storage.objects;

-- Usuários autenticados podem ler vídeos de aulas acessíveis
CREATE POLICY "Users can read accessible videos"
ON storage.objects FOR SELECT
USING (
  bucket_id = 'videos' 
  AND auth.uid() IS NOT NULL
  AND EXISTS (
    SELECT 1 FROM aulas a
    JOIN modulos m ON m.id = a.modulo_id
    JOIN user_profiles up ON up.user_id = auth.uid()
    WHERE a.video_url LIKE '%' || (storage.objects.name) || '%'
    AND m.ativo = true
    AND (
      m.plano_minimo = 'essencial'
      OR (m.plano_minimo = 'completo' AND up.plano IN ('completo', 'premium'))
      OR (m.plano_minimo = 'premium' AND up.plano = 'premium')
    )
  )
);

-- Admins podem fazer tudo no bucket de vídeos
CREATE POLICY "Admins can manage videos"
ON storage.objects FOR ALL
USING (
  bucket_id = 'videos' 
  AND is_admin(auth.uid())
);

-- ============================================================================
-- BUCKET: materiais
-- ============================================================================

-- Remover políticas existentes (se houver)
DROP POLICY IF EXISTS "Users can read accessible materials" ON storage.objects;
DROP POLICY IF EXISTS "Admins can manage materials" ON storage.objects;

-- Usuários autenticados podem ler materiais
CREATE POLICY "Users can read accessible materials"
ON storage.objects FOR SELECT
USING (
  bucket_id = 'materiais' 
  AND auth.uid() IS NOT NULL
);

-- Admins podem fazer tudo no bucket de materiais
CREATE POLICY "Admins can manage materials"
ON storage.objects FOR ALL
USING (
  bucket_id = 'materiais' 
  AND is_admin(auth.uid())
);

-- ============================================================================
-- BUCKET: logos
-- ============================================================================

-- Remover políticas existentes (se houver)
DROP POLICY IF EXISTS "Anyone can read logos" ON storage.objects;
DROP POLICY IF EXISTS "Admins can manage logos" ON storage.objects;

-- Logos são públicos, qualquer um pode ler
CREATE POLICY "Anyone can read logos"
ON storage.objects FOR SELECT
USING (bucket_id = 'logos');

-- Admins podem fazer tudo no bucket de logos
CREATE POLICY "Admins can manage logos"
ON storage.objects FOR ALL
USING (
  bucket_id = 'logos' 
  AND is_admin(auth.uid())
);

-- ============================================================================
-- BUCKET: avatars
-- ============================================================================

-- Remover políticas existentes (se houver)
DROP POLICY IF EXISTS "Users can read avatars" ON storage.objects;
DROP POLICY IF EXISTS "Users can upload own avatar" ON storage.objects;
DROP POLICY IF EXISTS "Users can update own avatar" ON storage.objects;
DROP POLICY IF EXISTS "Users can delete own avatar" ON storage.objects;
DROP POLICY IF EXISTS "Admins can manage avatars" ON storage.objects;

-- Usuários podem ler avatares
CREATE POLICY "Users can read avatars"
ON storage.objects FOR SELECT
USING (bucket_id = 'avatars');

-- Usuários podem fazer upload do próprio avatar
CREATE POLICY "Users can upload own avatar"
ON storage.objects FOR INSERT
WITH CHECK (
  bucket_id = 'avatars' 
  AND auth.uid() IS NOT NULL
  AND (storage.foldername(name))[1] = auth.uid()::text
);

-- Usuários podem atualizar próprio avatar
CREATE POLICY "Users can update own avatar"
ON storage.objects FOR UPDATE
USING (
  bucket_id = 'avatars' 
  AND auth.uid() IS NOT NULL
  AND (storage.foldername(name))[1] = auth.uid()::text
);

-- Usuários podem deletar próprio avatar
CREATE POLICY "Users can delete own avatar"
ON storage.objects FOR DELETE
USING (
  bucket_id = 'avatars' 
  AND auth.uid() IS NOT NULL
  AND (storage.foldername(name))[1] = auth.uid()::text
);

-- Admins podem fazer tudo no bucket de avatares
CREATE POLICY "Admins can manage avatars"
ON storage.objects FOR ALL
USING (
  bucket_id = 'avatars' 
  AND is_admin(auth.uid())
);

-- ============================================================================
-- FIM DO SCRIPT
-- ============================================================================

