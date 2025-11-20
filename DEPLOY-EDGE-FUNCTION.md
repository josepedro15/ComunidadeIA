# 🚀 Como Fazer Deploy da Edge Function - YouTube Proxy

## 📋 Pré-requisitos

1. Supabase CLI instalado
2. Projeto linkado ao Supabase
3. Autenticado no Supabase

## 🔧 Passo a Passo

### 1. Instalar Supabase CLI (se não tiver)

```bash
# macOS
brew install supabase/tap/supabase

# Ou via npm
npm install -g supabase
```

### 2. Fazer Login no Supabase

```bash
supabase login
```

### 3. Linkar Projeto

```bash
# Na raiz do projeto
supabase link --project-ref ydbvbpguttphuejmxuwh
```

### 4. Fazer Deploy da Edge Function

```bash
# Deploy da função youtube-proxy
supabase functions deploy youtube-proxy
```

### 5. Verificar Deploy

A função estará disponível em:
```
https://ydbvbpguttphuejmxuwh.supabase.co/functions/v1/youtube-proxy
```

## 🧪 Testar a Função

```bash
# Testar localmente
supabase functions serve youtube-proxy

# Ou testar via curl (após deploy)
curl -X POST https://ydbvbpguttphuejmxuwh.supabase.co/functions/v1/youtube-proxy \
  -H "Authorization: Bearer SEU_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"youtubeId": "VIDEO_ID_AQUI"}'
```

## ⚠️ Notas Importantes

1. **A função valida autenticação** - apenas usuários logados podem usar
2. **URL ainda aponta para YouTube** - não podemos fazer stream proxy sem violar ToS
3. **Oculta URL do frontend** - URL é gerada no backend
4. **Valida formato do ID** - previne IDs inválidos

## 🔄 Alternativa: Usar sem Edge Function

Se não quiser fazer deploy da Edge Function, o código tem fallback:
- Gera URL embed diretamente no frontend
- Menos seguro, mas funciona
- Recomendado apenas para desenvolvimento

---

**Última atualização:** Janeiro 2025

