# Google Drive como Storage de Vídeos

Este documento explica como usar o Google Drive como alternativa ao Supabase Storage para hospedar vídeos privados na plataforma.

## ✅ Vantagens do Google Drive

- **Armazenamento gratuito**: 15GB gratuitos (compartilhado com Gmail e Google Fotos)
- **Familiar**: Interface conhecida para upload e gerenciamento
- **Integração simples**: Não requer configuração de buckets ou políticas RLS
- **Backup automático**: Google cuida do backup e redundância

## ⚠️ Limitações

- **Não é otimizado para streaming**: Pode ter latência maior que serviços especializados
- **Limites de API**: Google Drive tem limites de requisições por dia
- **Compartilhamento necessário**: Arquivos precisam estar compartilhados (mesmo que privados)
- **Sem controle total**: Menos granularidade que Supabase Storage para controle de acesso

## 📋 Como Configurar

### 1. Upload do Vídeo

1. Acesse seu Google Drive
2. Faça upload do vídeo (formato recomendado: MP4)
3. **IMPORTANTE**: O arquivo deve estar em uma pasta ou ter permissões de compartilhamento configuradas

### 2. Obter Link do Arquivo

Existem duas formas de obter o link:

#### Opção A: Link Direto (Recomendado)
1. Clique com botão direito no arquivo
2. Selecione "Obter link" ou "Compartilhar"
3. Configure como "Qualquer pessoa com o link pode visualizar" (para streaming)
4. Copie o link no formato:
   ```
   https://drive.google.com/file/d/FILE_ID/view
   ```

#### Opção B: Link de Download
1. Clique com botão direito no arquivo
2. Selecione "Obter link"
3. Copie o link no formato:
   ```
   https://drive.google.com/uc?export=download&id=FILE_ID
   ```

### 3. Formato de URL Suportado

O sistema detecta automaticamente os seguintes formatos:

- `https://drive.google.com/file/d/FILE_ID/view`
- `https://drive.google.com/file/d/FILE_ID/preview`
- `https://drive.google.com/open?id=FILE_ID`
- `https://docs.google.com/uc?export=download&id=FILE_ID`

Onde `FILE_ID` é o ID único do arquivo no Google Drive (geralmente uma string de 33 caracteres).

### 4. Adicionar URL no Banco de Dados

No banco de dados, adicione a URL do Google Drive no campo `video_url` da tabela `aulas`:

```sql
UPDATE aulas 
SET video_url = 'https://drive.google.com/file/d/SEU_FILE_ID/view'
WHERE id = 'aula_id';
```

## 🔒 Segurança e Privacidade

### Configuração de Compartilhamento

Para manter o conteúdo privado:

1. **Compartilhamento Restrito**:
   - Configure o arquivo como "Qualquer pessoa com o link pode visualizar"
   - Mas **NÃO** torne público (não liste no Google Drive público)
   - O link não será facilmente descoberto sem conhecimento direto

2. **Limitações**:
   - ⚠️ Qualquer pessoa com o link pode acessar o vídeo
   - ⚠️ Não há autenticação nativa do Google Drive
   - ⚠️ O link pode ser compartilhado se alguém tiver acesso

### Recomendações

- **Para conteúdo realmente privado**: Use Supabase Storage com signed URLs
- **Para conteúdo semi-privado**: Google Drive funciona bem
- **Para conteúdo público**: YouTube ou Vimeo são melhores opções

## 🎬 Como Funciona no Player

O sistema automaticamente:

1. **Detecta** se a URL é do Google Drive
2. **Extrai** o File ID da URL
3. **Converte** para URL de preview/streaming do Google Drive
4. **Renderiza** em um iframe com proteções anti-compartilhamento

### Proteções Implementadas

- Bloqueio de clique direito (context menu)
- Overlay com marca d'água "Comunidade IA"
- Avisos ao tentar compartilhar
- Bloqueio de seleção de texto

## 📊 Comparação: Google Drive vs Supabase Storage

| Característica | Google Drive | Supabase Storage |
|----------------|--------------|------------------|
| **Armazenamento gratuito** | 15GB | 1GB (free tier) |
| **Autenticação nativa** | ❌ | ✅ (RLS) |
| **Signed URLs** | ❌ | ✅ (expiráveis) |
| **Controle de acesso** | Limitado | Total (RLS) |
| **Otimizado para streaming** | ❌ | ✅ |
| **Facilidade de uso** | ✅ | ⚠️ (requer setup) |
| **Custo adicional** | A partir de 100GB | A partir de 1GB |

## 🚀 Próximos Passos (Opcional)

Para melhorar a privacidade com Google Drive, você pode:

1. **Criar uma Edge Function** (similar ao YouTube proxy):
   - Validar autenticação do usuário
   - Gerar link do Drive apenas para usuários autenticados
   - Rotacionar links periodicamente

2. **Usar Google Drive API**:
   - Upload programático
   - Controle de permissões via API
   - Gerenciamento automático de compartilhamento

3. **Híbrido**:
   - Google Drive para armazenamento
   - Supabase Storage como cache/CDN
   - Edge Function como proxy

## ❓ FAQ

### O vídeo não carrega. O que fazer?

1. Verifique se o arquivo está compartilhado corretamente
2. Confirme que o formato da URL está correto
3. Teste o link diretamente no navegador
4. Verifique se o arquivo não excede o limite de tamanho

### Posso usar Google Drive para vídeos privados?

Sim, mas com limitações. O link pode ser compartilhado se alguém tiver acesso. Para conteúdo realmente privado, prefira Supabase Storage.

### O Google Drive tem limites?

Sim:
- 15GB de armazenamento gratuito
- Limites de largura de banda (não divulgados publicamente)
- Limites de API (1000 requisições/100 segundos por usuário)

### Posso usar ambos (Drive + Supabase)?

Sim! O sistema suporta múltiplas fontes:
- Supabase Storage para conteúdo privado
- Google Drive para conteúdo semi-privado
- YouTube/Vimeo para conteúdo público

## 📝 Exemplo de Uso

```typescript
// No banco de dados
INSERT INTO aulas (modulo_id, titulo, video_url, duracao)
VALUES (
  'modulo-123',
  'Aula sobre IA',
  'https://drive.google.com/file/d/1a2b3c4d5e6f7g8h9i0j1k2l3m4n5o6p/view',
  30
);
```

O sistema automaticamente detectará que é um link do Google Drive e renderizará o player apropriado.

