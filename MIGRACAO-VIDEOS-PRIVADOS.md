# 🔒 Migração para Vídeos Privados - Comunidade IA

## 📋 Resumo

Este documento explica como migrar de vídeos públicos do YouTube para vídeos privados hospedados no Supabase Storage, garantindo que apenas membros autenticados possam acessar o conteúdo.

---

## ⚠️ Problema Atual com YouTube

**Limitações do YouTube:**
- ❌ Vídeos públicos podem ser compartilhados livremente
- ❌ Qualquer pessoa com o link pode acessar
- ❌ Não há controle real sobre quem vê o conteúdo
- ❌ Botão de compartilhamento não pode ser removido
- ❌ Usuários podem abrir vídeo diretamente no YouTube

**Solução:** Migrar para Supabase Storage com vídeos privados.

---

## ✅ Solução Implementada

### 1. **Supabase Storage (Recomendado)**

**Vantagens:**
- ✅ Controle total sobre acesso
- ✅ Vídeos privados com signed URLs
- ✅ URLs expiram automaticamente (1 hora)
- ✅ Políticas RLS (Row Level Security) controlam acesso
- ✅ Apenas membros autenticados podem ver
- ✅ Sem botões de compartilhamento
- ✅ Player HTML5 customizado

**Como funciona:**
1. Vídeos são armazenados no bucket privado `videos` do Supabase
2. Apenas usuários autenticados podem gerar signed URLs
3. URLs expiram após 1 hora (renovadas automaticamente)
4. Políticas RLS verificam se o usuário tem acesso ao módulo

---

## 📝 Como Migrar Vídeos

### Passo 1: Fazer Upload dos Vídeos

1. Acesse a área admin: `/admin/modulos`
2. Selecione o módulo
3. Edite ou crie uma nova aula
4. **Desmarque** "Usar URL do YouTube"
5. Faça upload do arquivo de vídeo
6. Salve a aula

O sistema automaticamente:
- Faz upload para o bucket `videos` do Supabase
- Salva o path no banco de dados
- Gera signed URLs quando necessário

### Passo 2: Verificar Políticas RLS

Certifique-se de que as políticas RLS estão configuradas:

```sql
-- Verificar se a política existe
SELECT * FROM pg_policies 
WHERE tablename = 'objects' 
AND policyname = 'Users can read accessible videos';
```

Se não existir, execute o script em `supabase/migrations/001_storage_policies.sql`

### Passo 3: Testar Acesso

1. Faça login como membro
2. Acesse um módulo com vídeo privado
3. Verifique se o vídeo carrega corretamente
4. Tente acessar sem login (deve falhar)

---

## 🔐 Proteções Implementadas

### 1. **Bloqueio de Ações**

O sistema bloqueia:
- ❌ Clique direito (menu de contexto)
- ❌ F12 (DevTools)
- ❌ Ctrl+Shift+I (DevTools)
- ❌ Ctrl+Shift+J (Console)
- ❌ Ctrl+U (View Source)
- ❌ Ctrl+S (Save)
- ❌ Seleção de texto no player
- ❌ Drag and drop de vídeos

### 2. **Player HTML5 Protegido**

- `controlsList="nodownload noplaybackrate"` - Remove download e velocidade
- `disablePictureInPicture` - Desabilita PiP
- Overlay de proteção visual
- Badge "Conteúdo Privado"

### 3. **Signed URLs com Expiração**

- URLs válidas por apenas 1 hora
- Renovadas automaticamente quando necessário
- Não podem ser compartilhadas (expirarão)

---

## 🎯 Alternativas (Se Não Quiser Migrar)

### Opção 1: Vimeo Pro

**Vantagens:**
- ✅ Permite desabilitar compartilhamento
- ✅ Vídeos privados com senha
- ✅ Melhor controle que YouTube

**Desvantagens:**
- ❌ Requer plano pago (Vimeo Pro)
- ❌ Ainda permite alguns compartilhamentos
- ❌ Mais caro que Supabase Storage

**Como configurar:**
1. Faça upload no Vimeo
2. Configure vídeo como "Privado"
3. Desabilite compartilhamento nas configurações
4. Use o link do Vimeo na plataforma

### Opção 2: YouTube Private (Não Recomendado)

**Limitações:**
- ⚠️ Ainda permite compartilhamento se alguém tiver acesso
- ⚠️ Não é verdadeiramente privado
- ⚠️ Requer adicionar emails manualmente

**Não recomendado para comunidade fechada.**

---

## 📊 Comparação de Soluções

| Recurso | YouTube | Vimeo Pro | Supabase Storage |
|---------|---------|-----------|------------------|
| **Privacidade Real** | ❌ | ⚠️ | ✅ |
| **Controle de Acesso** | ❌ | ⚠️ | ✅ |
| **Bloquear Compartilhamento** | ❌ | ✅ | ✅ |
| **Custo** | Grátis | Pago | Incluído no Supabase |
| **Player Customizado** | ❌ | ⚠️ | ✅ |
| **URLs Expiráveis** | ❌ | ❌ | ✅ |
| **RLS/Políticas** | ❌ | ❌ | ✅ |

**Recomendação:** Use Supabase Storage para máxima segurança.

---

## 🚀 Próximos Passos

1. **Migrar vídeos existentes:**
   - Baixar vídeos do YouTube (se possível)
   - Fazer upload para Supabase Storage
   - Atualizar URLs no banco de dados

2. **Configurar políticas RLS:**
   - Verificar se estão aplicadas
   - Testar com diferentes usuários

3. **Monitorar acesso:**
   - Verificar logs do Supabase
   - Monitorar tentativas de acesso não autorizado

---

## ⚠️ Avisos Importantes

1. **YouTube não é seguro para conteúdo privado**
   - Mesmo com overlay, usuários podem inspecionar o código
   - Links podem ser extraídos do iframe
   - Não há proteção real

2. **Supabase Storage é a melhor opção**
   - Controle total sobre acesso
   - URLs expiráveis
   - Políticas RLS robustas

3. **Proteções JavaScript não são 100% seguras**
   - Usuários avançados podem contornar
   - Mas dificulta significativamente o acesso não autorizado
   - Combine com políticas de servidor (RLS)

---

## 📚 Referências

- [Supabase Storage Docs](https://supabase.com/docs/guides/storage)
- [Supabase RLS](https://supabase.com/docs/guides/auth/row-level-security)
- [Vimeo Privacy Settings](https://help.vimeo.com/hc/en-us/articles/12426260232977-Video-privacy-settings)

---

**Última atualização:** Janeiro 2025

