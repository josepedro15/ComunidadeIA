# 📁 Estrutura da Plataforma - Área de Membros + Admin

Este documento mostra a estrutura completa de diretórios e arquivos da plataforma.

## 📂 Estrutura de Diretórios

```
src/
├── pages/
│   ├── Index.tsx                    # ✅ Landing Page (já existe)
│   ├── NotFound.tsx                 # ✅ 404 (já existe)
│   ├── Login.tsx                    # 🔲 Página de login
│   ├── RecuperarSenha.tsx           # 🔲 Recuperação de senha
│   │
│   ├── area-membros/                # 📁 Área de Membros
│   │   ├── Dashboard.tsx            # 🔲 Dashboard do membro
│   │   ├── BibliotecaPrompts.tsx    # 🔲 Biblioteca de prompts
│   │   ├── Lives.tsx                # 🔲 Lives semanais
│   │   ├── Aulas.tsx                # 🔲 Aulas e módulos
│   │   ├── Ferramentas.tsx          # 🔲 Ferramentas recomendadas
│   │   ├── Comunidade.tsx           # 🔲 Acesso WhatsApp
│   │   └── Perfil.tsx               # 🔲 Perfil do membro
│   │
│   └── admin/                       # 📁 Área Administrativa
│       ├── Dashboard.tsx             # 🔲 Dashboard admin
│       ├── PromptsAdmin.tsx         # 🔲 Gerenciar prompts
│       ├── LivesAdmin.tsx           # 🔲 Gerenciar lives
│       ├── FerramentasAdmin.tsx     # 🔲 Gerenciar ferramentas
│       ├── ModulosAdmin.tsx         # 🔲 Gerenciar módulos
│       ├── AulasAdmin.tsx           # 🔲 Gerenciar aulas
│       └── MembrosAdmin.tsx         # 🔲 Gerenciar membros
│
├── components/
│   ├── ui/                          # ✅ Componentes shadcn/ui (já existe)
│   │
│   ├── auth/                        # 📁 Componentes de Autenticação
│   │   ├── LoginForm.tsx            # 🔲 Formulário de login
│   │   ├── ProtectedRoute.tsx       # 🔲 Rota protegida (membros)
│   │   └── AdminProtectedRoute.tsx  # 🔲 Rota protegida (admin)
│   │
│   ├── membros/                     # 📁 Componentes da Área de Membros
│   │   ├── PromptCard.tsx           # 🔲 Card de prompt
│   │   ├── PromptViewer.tsx         # 🔲 Visualizador de prompt
│   │   ├── LiveCard.tsx             # 🔲 Card de live
│   │   ├── AulaCard.tsx             # 🔲 Card de aula
│   │   ├── ModuloCard.tsx           # 🔲 Card de módulo
│   │   ├── VideoPlayer.tsx          # 🔲 Player de vídeo
│   │   ├── FerramentaCard.tsx       # 🔲 Card de ferramenta
│   │   ├── PlanoBadge.tsx           # 🔲 Badge de plano
│   │   └── WhatsAppButton.tsx       # 🔲 Botão WhatsApp
│   │
│   ├── admin/                       # 📁 Componentes Admin
│   │   ├── PromptForm.tsx           # 🔲 Formulário de prompt
│   │   ├── LiveForm.tsx             # 🔲 Formulário de live
│   │   ├── FerramentaForm.tsx      # 🔲 Formulário de ferramenta
│   │   ├── ModuloForm.tsx           # 🔲 Formulário de módulo
│   │   ├── AulaForm.tsx             # 🔲 Formulário de aula
│   │   └── MembroDetalhes.tsx       # 🔲 Detalhes do membro
│   │
│   └── layout/                      # 📁 Layouts
│       ├── MemberLayout.tsx         # 🔲 Layout área de membros
│       ├── MemberSidebar.tsx        # 🔲 Sidebar de membros
│       ├── MemberHeader.tsx         # 🔲 Header de membros
│       ├── AdminLayout.tsx          # 🔲 Layout admin
│       ├── AdminSidebar.tsx         # 🔲 Sidebar admin
│       └── AdminHeader.tsx          # 🔲 Header admin
│
├── hooks/
│   ├── use-mobile.tsx               # ✅ Hook mobile (já existe)
│   ├── use-parallax.ts              # ✅ Hook parallax (já existe)
│   ├── use-toast.ts                 # ✅ Hook toast (já existe)
│   └── useAuth.ts                   # 🔲 Hook de autenticação
│
├── lib/
│   ├── utils.ts                     # ✅ Utilitários (já existe)
│   └── supabase.ts                  # 🔲 Cliente Supabase
│
└── data/
    ├── prompts/
    │   └── index.ts                 # 🔲 Carregar prompts
    ├── lives.ts                     # 🔲 Dados de lives
    └── ferramentas.ts               # 🔲 Dados de ferramentas
```

## 📋 Legenda

- ✅ = Já existe no projeto
- 🔲 = Precisa ser criado
- 📁 = Diretório

## 🗂️ Estrutura de Banco de Dados (Supabase)

### Tabelas

1. **user_profiles**
   - `id` (UUID, PK, FK → auth.users)
   - `nome` (TEXT)
   - `foto_url` (TEXT)
   - `plano` (TEXT: 'essencial' | 'completo' | 'premium')
   - `data_adesao` (TIMESTAMP)
   - `is_admin` (BOOLEAN)

2. **prompts**
   - `id` (UUID, PK)
   - `titulo` (TEXT)
   - `categoria` (TEXT)
   - `subcategoria` (TEXT, nullable)
   - `conteudo` (TEXT)
   - `ordem` (INTEGER)
   - `ativo` (BOOLEAN)
   - `created_at` (TIMESTAMP)
   - `updated_at` (TIMESTAMP)

3. **lives**
   - `id` (UUID, PK)
   - `titulo` (TEXT)
   - `descricao` (TEXT)
   - `data_agendada` (DATE)
   - `horario` (TIME)
   - `link_meet` (TEXT, nullable)
   - `link_zoom` (TEXT, nullable)
   - `plataforma` (TEXT: 'meet' | 'zoom')
   - `status` (TEXT: 'agendada' | 'ao-vivo' | 'encerrada' | 'gravada')
   - `link_gravacao` (TEXT, nullable)
   - `materiais` (TEXT[], nullable)
   - `created_at` (TIMESTAMP)

4. **ferramentas**
   - `id` (UUID, PK)
   - `nome` (TEXT)
   - `categoria` (TEXT)
   - `preco` (TEXT)
   - `descricao` (TEXT)
   - `casos_uso` (TEXT[])
   - `link` (TEXT)
   - `logo_url` (TEXT, nullable)
   - `ordem` (INTEGER)
   - `ativo` (BOOLEAN)
   - `created_at` (TIMESTAMP)

5. **modulos**
   - `id` (UUID, PK)
   - `titulo` (TEXT)
   - `descricao` (TEXT)
   - `ordem` (INTEGER)
   - `plano_minimo` (TEXT: 'essencial' | 'completo' | 'premium')
   - `ativo` (BOOLEAN)
   - `created_at` (TIMESTAMP)

6. **aulas**
   - `id` (UUID, PK)
   - `modulo_id` (UUID, FK → modulos)
   - `titulo` (TEXT)
   - `descricao` (TEXT)
   - `video_url` (TEXT)
   - `duracao` (INTEGER) -- em minutos
   - `ordem` (INTEGER)
   - `materiais` (TEXT[], nullable)
   - `created_at` (TIMESTAMP)

7. **progresso_aulas**
   - `id` (UUID, PK)
   - `user_id` (UUID, FK → auth.users)
   - `aula_id` (UUID, FK → aulas)
   - `concluida` (BOOLEAN)
   - `progresso` (INTEGER) -- 0-100
   - `ultima_visualizacao` (TIMESTAMP)

8. **favorites** (opcional)
   - `id` (UUID, PK)
   - `user_id` (UUID, FK → auth.users)
   - `tipo` (TEXT: 'prompt' | 'ferramenta')
   - `item_id` (TEXT)
   - `created_at` (TIMESTAMP)

## 📦 Supabase Storage Buckets

1. **videos** - Vídeos de aulas (se upload direto)
2. **materiais** - PDFs, slides, documentos complementares
3. **logos** - Logos de ferramentas
4. **avatars** - Fotos de perfil dos membros

## 🔗 Rotas da Aplicação

### Rotas Públicas
- `/` - Landing Page
- `/login` - Login
- `/recuperar-senha` - Recuperação de senha

### Rotas de Membros (Protegidas)
- `/area-membros/dashboard` - Dashboard
- `/area-membros/prompts` - Biblioteca de prompts
- `/area-membros/prompts/:categoria` - Prompts por categoria
- `/area-membros/lives` - Lives semanais
- `/area-membros/aulas` - Lista de módulos
- `/area-membros/aulas/:moduloId` - Aulas do módulo
- `/area-membros/ferramentas` - Ferramentas recomendadas
- `/area-membros/comunidade` - Comunidade WhatsApp
- `/area-membros/perfil` - Perfil do membro

### Rotas Admin (Protegidas + Admin)
- `/admin/dashboard` - Dashboard admin
- `/admin/prompts` - Gerenciar prompts
- `/admin/prompts/novo` - Criar prompt
- `/admin/prompts/:id/editar` - Editar prompt
- `/admin/lives` - Gerenciar lives
- `/admin/lives/novo` - Criar live
- `/admin/lives/:id/editar` - Editar live
- `/admin/ferramentas` - Gerenciar ferramentas
- `/admin/ferramentas/nova` - Criar ferramenta
- `/admin/ferramentas/:id/editar` - Editar ferramenta
- `/admin/modulos` - Gerenciar módulos
- `/admin/modulos/novo` - Criar módulo
- `/admin/modulos/:id/editar` - Editar módulo
- `/admin/modulos/:moduloId/aulas` - Gerenciar aulas do módulo
- `/admin/modulos/:moduloId/aulas/nova` - Criar aula
- `/admin/modulos/:moduloId/aulas/:id/editar` - Editar aula
- `/admin/membros` - Gerenciar membros
- `/admin/membros/:id` - Detalhes do membro

## 📝 Variáveis de Ambiente

```env
VITE_SUPABASE_URL=seu_url_supabase
VITE_SUPABASE_ANON_KEY=sua_chave_anon
VITE_WHATSAPP_LINK=https://chat.whatsapp.com/...
```

## 📦 Dependências Necessárias

```json
{
  "@supabase/supabase-js": "^2.x",
  "react-copy-to-clipboard": "^5.x",
  "qrcode.react": "^3.x",
  "react-player": "^2.x",
  "@tanstack/react-table": "^8.x",
  "react-beautiful-dnd": "^13.x"
}
```

## ✅ Status de Implementação

- [ ] Estrutura de diretórios criada
- [ ] Configuração Supabase
- [ ] Tabelas do banco criadas
- [ ] Buckets de storage criados
- [ ] Autenticação implementada
- [ ] Área de membros implementada
- [ ] Área admin implementada

---

**Última atualização:** Janeiro 2025

