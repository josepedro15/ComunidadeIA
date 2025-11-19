# 🎥 Como Criar o Bucket de Vídeos no Supabase

O erro "Bucket not found" indica que o bucket `videos` ainda não foi criado no Supabase Storage.

## 📝 Passo a Passo

### 1. Acesse o Supabase Dashboard
1. Vá para [https://supabase.com/dashboard](https://supabase.com/dashboard)
2. Selecione seu projeto

### 2. Crie o Bucket `videos`
1. No menu lateral, clique em **Storage**
2. Clique no botão **New bucket**
3. Configure:
   - **Name:** `videos`
   - **Public bucket:** ❌ **DESMARCADO** (privado)
   - **File size limit:** Deixe vazio ou configure conforme seu plano
   - **Allowed MIME types:** `video/*` (ou deixe vazio para aceitar todos)
4. Clique em **Create bucket**

### 3. Configure as Políticas RLS (Row Level Security)
1. Ainda na página de Storage, clique no bucket `videos`
2. Vá para a aba **Policies**
3. Execute o seguinte SQL no SQL Editor do Supabase:

```sql
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
  AND EXISTS (
    SELECT 1 FROM user_profiles
    WHERE user_id = auth.uid()
    AND is_admin = true
  )
);
```

### 4. Crie também o Bucket `materiais` (se ainda não existe)
1. Repita os passos acima
2. **Name:** `materiais`
3. **Public bucket:** ❌ **DESMARCADO** (privado)
4. **Allowed MIME types:** `application/pdf,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document`

E execute este SQL:

```sql
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
  AND EXISTS (
    SELECT 1 FROM user_profiles
    WHERE user_id = auth.uid()
    AND is_admin = true
  )
);
```

## ✅ Verificação

Após criar os buckets:
1. Tente fazer upload de um vídeo de teste na área admin
2. Verifique se o vídeo aparece na lista de aulas
3. Tente assistir o vídeo na página de detalhes do módulo

## 🔧 Troubleshooting

- **Erro "Bucket not found":** Certifique-se de que o bucket foi criado com o nome exato `videos` (minúsculas)
- **Erro de permissão:** Verifique se as políticas RLS foram criadas corretamente
- **Vídeo não carrega:** Verifique se a signed URL está sendo gerada corretamente (o código agora faz isso automaticamente)

