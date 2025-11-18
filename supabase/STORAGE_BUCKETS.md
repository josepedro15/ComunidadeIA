# 📦 Configuração dos Storage Buckets do Supabase

Os Storage Buckets não podem ser criados via SQL, então você precisa criá-los manualmente ou via API.

## 🎯 Buckets Necessários

1. **videos** - Vídeos de aulas
   - Público: `false` (privado)
   - Tamanho máximo: Conforme seu plano
   - Tipos permitidos: `video/*`

2. **materiais** - PDFs, slides, documentos complementares
   - Público: `false` (privado)
   - Tamanho máximo: Conforme seu plano
   - Tipos permitidos: `application/pdf`, `application/vnd.ms-powerpoint`, `application/vnd.openxmlformats-officedocument.presentationml.presentation`, `application/msword`, `application/vnd.openxmlformats-officedocument.wordprocessingml.document`

3. **logos** - Logos de ferramentas
   - Público: `true` (público)
   - Tamanho máximo: 5MB por arquivo
   - Tipos permitidos: `image/*`

4. **avatars** - Fotos de perfil dos membros
   - Público: `false` (privado)
   - Tamanho máximo: 2MB por arquivo
   - Tipos permitidos: `image/*`

## 📝 Como Criar via Dashboard

1. Acesse o Supabase Dashboard
2. Vá em **Storage** no menu lateral
3. Clique em **New bucket**
4. Configure cada bucket conforme acima
5. Para buckets privados, configure as políticas RLS (veja abaixo)

## 🔐 Políticas RLS para Storage

### Bucket: videos
```sql
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

-- Admins podem fazer tudo
CREATE POLICY "Admins can manage videos"
ON storage.objects FOR ALL
USING (
  bucket_id = 'videos' 
  AND is_admin(auth.uid())
);
```

### Bucket: materiais
```sql
-- Usuários autenticados podem ler materiais de aulas acessíveis
CREATE POLICY "Users can read accessible materials"
ON storage.objects FOR SELECT
USING (
  bucket_id = 'materiais' 
  AND auth.uid() IS NOT NULL
);

-- Admins podem fazer tudo
CREATE POLICY "Admins can manage materials"
ON storage.objects FOR ALL
USING (
  bucket_id = 'materiais' 
  AND is_admin(auth.uid())
);
```

### Bucket: logos
```sql
-- Logos são públicos, qualquer um pode ler
CREATE POLICY "Anyone can read logos"
ON storage.objects FOR SELECT
USING (bucket_id = 'logos');

-- Admins podem fazer tudo
CREATE POLICY "Admins can manage logos"
ON storage.objects FOR ALL
USING (
  bucket_id = 'logos' 
  AND is_admin(auth.uid())
);
```

### Bucket: avatars
```sql
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

-- Admins podem fazer tudo
CREATE POLICY "Admins can manage avatars"
ON storage.objects FOR ALL
USING (
  bucket_id = 'avatars' 
  AND is_admin(auth.uid())
);
```

## 🚀 Como Criar via API (Programaticamente)

Você pode usar o cliente Supabase para criar os buckets:

```typescript
import { supabase } from '@/integrations/supabase/client';

// Criar bucket de vídeos
await supabase.storage.createBucket('videos', {
  public: false,
  fileSizeLimit: 104857600, // 100MB
  allowedMimeTypes: ['video/*']
});

// Criar bucket de materiais
await supabase.storage.createBucket('materiais', {
  public: false,
  fileSizeLimit: 52428800, // 50MB
  allowedMimeTypes: [
    'application/pdf',
    'application/vnd.ms-powerpoint',
    'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  ]
});

// Criar bucket de logos
await supabase.storage.createBucket('logos', {
  public: true,
  fileSizeLimit: 5242880, // 5MB
  allowedMimeTypes: ['image/*']
});

// Criar bucket de avatares
await supabase.storage.createBucket('avatars', {
  public: false,
  fileSizeLimit: 2097152, // 2MB
  allowedMimeTypes: ['image/*']
});
```

**Nota:** A criação de buckets via API geralmente requer permissões de service role, então é melhor fazer via Dashboard na primeira vez.

## ✅ Verificação

Após criar os buckets, verifique se estão funcionando:

1. Tente fazer upload de um arquivo de teste
2. Verifique as políticas RLS
3. Teste o acesso público/privado conforme configurado

