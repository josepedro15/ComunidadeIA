# 📊 Análise: O que falta no projeto

Comparação entre o projeto atual e a estrutura documentada em `ESTRUTURA-PLATAFORMA.md`.

## ✅ O que já existe

### Páginas
- ✅ `Index.tsx` - Landing Page
- ✅ `NotFound.tsx` - 404
- ✅ `Auth.tsx` - Página de autenticação (mas sem integração real com Supabase)
- ✅ `Dashboard.tsx` - Dashboard básico (mas não está em `/area-membros/dashboard`)
- ✅ `Prompts.tsx` - Biblioteca de prompts (mas não está em `/area-membros/prompts`)
- ✅ `Lives.tsx` - Lives semanais (mas não está em `/area-membros/lives`)
- ✅ `Ferramentas.tsx` - Ferramentas (mas não está em `/area-membros/ferramentas`)
- ✅ `Modulos.tsx` - Módulos
- ✅ `Perfil.tsx` - Perfil

### Componentes
- ✅ `components/ui/` - Todos os componentes shadcn/ui
- ✅ `Layout.tsx` - Layout básico (mas genérico, não específico para membros/admin)
- ✅ `AppSidebar.tsx` - Sidebar básico (mas genérico, não específico para membros/admin)
- ✅ `NavLink.tsx` - Componente de navegação

### Hooks
- ✅ `use-mobile.tsx`
- ✅ `use-toast.ts`

### Integrações
- ✅ `integrations/supabase/client.ts` - Cliente Supabase configurado
- ✅ `integrations/supabase/types.ts` - Tipos do Supabase (gerados automaticamente)
- ✅ Migrações do banco de dados criadas (todas as tabelas principais)

### Dependências
- ✅ `@supabase/supabase-js` - Já instalado
- ✅ `react-router-dom` - Já instalado
- ✅ `@tanstack/react-query` - Já instalado
- ✅ `sonner` - Para toasts (já instalado)
- ✅ `lucide-react` - Para ícones (já instalado)

---

## 🔲 O que está faltando

### 📁 Estrutura de Diretórios

#### 1. Páginas faltantes

**Área de Membros** (deveria estar em `src/pages/area-membros/`):
- 🔲 `area-membros/Dashboard.tsx` - Dashboard do membro
- 🔲 `area-membros/BibliotecaPrompts.tsx` - Biblioteca de prompts
- 🔲 `area-membros/Lives.tsx` - Lives semanais
- 🔲 `area-membros/Aulas.tsx` - Aulas e módulos
- 🔲 `area-membros/Ferramentas.tsx` - Ferramentas recomendadas
- 🔲 `area-membros/Comunidade.tsx` - Acesso WhatsApp
- 🔲 `area-membros/Perfil.tsx` - Perfil do membro

**Área Admin** (deveria estar em `src/pages/admin/`):
- 🔲 `admin/Dashboard.tsx` - Dashboard admin
- 🔲 `admin/PromptsAdmin.tsx` - Gerenciar prompts
- 🔲 `admin/LivesAdmin.tsx` - Gerenciar lives
- 🔲 `admin/FerramentasAdmin.tsx` - Gerenciar ferramentas
- 🔲 `admin/ModulosAdmin.tsx` - Gerenciar módulos
- 🔲 `admin/AulasAdmin.tsx` - Gerenciar aulas
- 🔲 `admin/MembrosAdmin.tsx` - Gerenciar membros

**Páginas Públicas**:
- ⚠️ `Auth.tsx` - Existe mas não integra com Supabase (apenas simulação)
- 🔲 `Login.tsx` - Página de login separada (opcional, pode manter `Auth.tsx`)
- 🔲 `RecuperarSenha.tsx` - Recuperação de senha

#### 2. Componentes faltantes

**Autenticação** (`src/components/auth/`):
- 🔲 `LoginForm.tsx` - Formulário de login
- 🔲 `ProtectedRoute.tsx` - Rota protegida (membros)
- 🔲 `AdminProtectedRoute.tsx` - Rota protegida (admin)

**Área de Membros** (`src/components/membros/`):
- 🔲 `PromptCard.tsx` - Card de prompt
- 🔲 `PromptViewer.tsx` - Visualizador de prompt
- 🔲 `LiveCard.tsx` - Card de live
- 🔲 `AulaCard.tsx` - Card de aula
- 🔲 `ModuloCard.tsx` - Card de módulo
- 🔲 `VideoPlayer.tsx` - Player de vídeo
- 🔲 `FerramentaCard.tsx` - Card de ferramenta
- 🔲 `PlanoBadge.tsx` - Badge de plano
- 🔲 `WhatsAppButton.tsx` - Botão WhatsApp

**Admin** (`src/components/admin/`):
- 🔲 `PromptForm.tsx` - Formulário de prompt
- 🔲 `LiveForm.tsx` - Formulário de live
- 🔲 `FerramentaForm.tsx` - Formulário de ferramenta
- 🔲 `ModuloForm.tsx` - Formulário de módulo
- 🔲 `AulaForm.tsx` - Formulário de aula
- 🔲 `MembroDetalhes.tsx` - Detalhes do membro

**Layouts** (`src/components/layout/`):
- 🔲 `MemberLayout.tsx` - Layout área de membros
- 🔲 `MemberSidebar.tsx` - Sidebar de membros
- 🔲 `MemberHeader.tsx` - Header de membros
- 🔲 `AdminLayout.tsx` - Layout admin
- 🔲 `AdminSidebar.tsx` - Sidebar admin
- 🔲 `AdminHeader.tsx` - Header admin

#### 3. Hooks faltantes

- 🔲 `useAuth.ts` - Hook de autenticação (essencial!)
- ⚠️ `use-parallax.ts` - Hook parallax (mencionado no doc, mas não existe - pode ser opcional)

#### 4. Utilitários faltantes

- ⚠️ `lib/supabase.ts` - Cliente Supabase (existe em `integrations/supabase/client.ts`, mas o doc menciona `lib/supabase.ts` - pode ser apenas uma referência diferente)

#### 5. Dados faltantes

**Diretório `src/data/`**:
- 🔲 `data/prompts/index.ts` - Carregar prompts
- 🔲 `data/lives.ts` - Dados de lives
- 🔲 `data/ferramentas.ts` - Dados de ferramentas

---

## 🔄 O que precisa ser reorganizado

### Rotas

**Rotas atuais** (em `App.tsx`):
- `/auth` - Deveria ser `/login`
- `/dashboard` - Deveria ser `/area-membros/dashboard`
- `/modulos` - Deveria ser `/area-membros/aulas`
- `/ferramentas` - Deveria ser `/area-membros/ferramentas`
- `/prompts` - Deveria ser `/area-membros/prompts`
- `/lives` - Deveria ser `/area-membros/lives`
- `/perfil` - Deveria ser `/area-membros/perfil`

**Rotas faltantes**:
- `/recuperar-senha` - Recuperação de senha
- `/area-membros/comunidade` - Comunidade WhatsApp
- `/area-membros/prompts/:categoria` - Prompts por categoria
- `/area-membros/aulas/:moduloId` - Aulas do módulo
- Todas as rotas `/admin/*`

### Autenticação

**Problemas atuais**:
- ❌ `Auth.tsx` não integra com Supabase (apenas simulação)
- ❌ Não há proteção de rotas
- ❌ Não há hook `useAuth` para gerenciar estado de autenticação
- ❌ Não há verificação de permissões (admin vs membro)

**O que precisa**:
- ✅ Integração real com Supabase Auth
- ✅ `ProtectedRoute` para rotas de membros
- ✅ `AdminProtectedRoute` para rotas admin
- ✅ Hook `useAuth` para gerenciar sessão
- ✅ Verificação de plano do usuário

---

## 📦 Dependências faltantes

Conforme `ESTRUTURA-PLATAFORMA.md`:

- 🔲 `react-copy-to-clipboard` - Para copiar prompts
- 🔲 `qrcode.react` - Para gerar QR codes (WhatsApp?)
- 🔲 `react-player` - Para player de vídeo
- 🔲 `@tanstack/react-table` - Para tabelas admin (já tem `@tanstack/react-query`)
- 🔲 `react-beautiful-dnd` - Para drag and drop (opcional)

---

## 🗄️ Banco de Dados

### Tabelas
✅ Todas as tabelas principais estão criadas na migração:
- ✅ `user_profiles`
- ✅ `user_roles`
- ✅ `modulos`
- ✅ `aulas`
- ✅ `progresso_aulas`
- ✅ `ferramentas`
- ✅ `prompts`
- ✅ `lives`

### Tabela opcional faltante
- 🔲 `favorites` - Para favoritar prompts/ferramentas

### Storage Buckets
Verificar se os buckets do Supabase Storage foram criados:
- 🔲 `videos` - Vídeos de aulas
- 🔲 `materiais` - PDFs, slides, documentos
- 🔲 `logos` - Logos de ferramentas
- 🔲 `avatars` - Fotos de perfil

---

## 🔐 Variáveis de Ambiente

Verificar se existem no `.env` (arquivo não encontrado no projeto):
- 🔲 `VITE_SUPABASE_URL` - Necessário
- 🔲 `VITE_SUPABASE_PUBLISHABLE_KEY` - Necessário (código usa este nome)
- 🔲 `VITE_WHATSAPP_LINK` - Para página de comunidade

---

## 📝 Resumo por Prioridade

### 🔴 Crítico (Bloqueia funcionalidade)
1. **Autenticação real com Supabase**
   - Hook `useAuth.ts`
   - Componentes `ProtectedRoute.tsx` e `AdminProtectedRoute.tsx`
   - Integração real em `Auth.tsx`

2. **Reorganização de rotas**
   - Mover páginas para `area-membros/` e `admin/`
   - Atualizar rotas no `App.tsx`

### 🟡 Importante (Funcionalidade principal)
3. **Componentes de layout**
   - `MemberLayout.tsx`, `MemberSidebar.tsx`, `MemberHeader.tsx`
   - `AdminLayout.tsx`, `AdminSidebar.tsx`, `AdminHeader.tsx`

4. **Páginas admin**
   - Todas as páginas de gerenciamento admin

5. **Componentes de membros**
   - Cards, viewers, players

### 🟢 Desejável (Melhorias)
6. **Página de recuperação de senha**
7. **Página de comunidade WhatsApp**
8. **Sistema de favoritos**
9. **Dependências adicionais** (react-player, react-copy-to-clipboard, etc.)

---

**Última atualização:** Janeiro 2025

