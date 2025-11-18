-- ============================================================================
-- ESTRUTURA COMPLETA DO BANCO DE DADOS - PLATAFORMA COMUNIDADE IA
-- ============================================================================
-- Este arquivo contém toda a estrutura necessária para a plataforma
-- Execute este SQL no Supabase SQL Editor ou via migração
-- ============================================================================

-- ============================================================================
-- 1. TIPOS ENUM
-- ============================================================================

-- Tipo de plano do usuário
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'plan_type') THEN
    CREATE TYPE public.plan_type AS ENUM ('essencial', 'completo', 'premium');
  END IF;
END $$;

-- Status de lives
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'live_status') THEN
    CREATE TYPE public.live_status AS ENUM ('agendada', 'ao_vivo', 'concluida', 'cancelada');
  END IF;
END $$;

-- Papéis de usuário (opcional, para sistema de roles mais complexo)
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'app_role') THEN
    CREATE TYPE public.app_role AS ENUM ('admin', 'moderator', 'user');
  END IF;
END $$;

-- ============================================================================
-- 2. TABELAS
-- ============================================================================

-- Perfis de usuário
CREATE TABLE IF NOT EXISTS public.user_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
  nome TEXT NOT NULL,
  foto_url TEXT,
  plano plan_type NOT NULL DEFAULT 'essencial',
  is_admin BOOLEAN NOT NULL DEFAULT false,
  data_adesao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMENT ON TABLE public.user_profiles IS 'Perfis dos usuários da plataforma';
COMMENT ON COLUMN public.user_profiles.plano IS 'Plano de assinatura: essencial, completo ou premium';
COMMENT ON COLUMN public.user_profiles.is_admin IS 'Indica se o usuário tem permissões administrativas';

-- Roles de usuário (opcional, para sistema mais granular)
CREATE TABLE IF NOT EXISTS public.user_roles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  role app_role NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  UNIQUE(user_id, role)
);

COMMENT ON TABLE public.user_roles IS 'Roles adicionais dos usuários (opcional)';

-- Módulos de aprendizado
CREATE TABLE IF NOT EXISTS public.modulos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo TEXT NOT NULL,
  descricao TEXT NOT NULL,
  ordem INTEGER NOT NULL DEFAULT 0,
  ativo BOOLEAN NOT NULL DEFAULT true,
  plano_minimo plan_type NOT NULL DEFAULT 'essencial',
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMENT ON TABLE public.modulos IS 'Módulos de aprendizado da plataforma';
COMMENT ON COLUMN public.modulos.plano_minimo IS 'Plano mínimo necessário para acessar este módulo';

-- Aulas
CREATE TABLE IF NOT EXISTS public.aulas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  modulo_id UUID NOT NULL REFERENCES public.modulos(id) ON DELETE CASCADE,
  titulo TEXT NOT NULL,
  descricao TEXT,
  video_url TEXT NOT NULL,
  duracao INTEGER NOT NULL, -- em minutos
  ordem INTEGER NOT NULL DEFAULT 0,
  materiais TEXT[], -- URLs de materiais complementares
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMENT ON TABLE public.aulas IS 'Aulas dos módulos';
COMMENT ON COLUMN public.aulas.duracao IS 'Duração da aula em minutos';
COMMENT ON COLUMN public.aulas.materiais IS 'Array de URLs para materiais complementares (PDFs, slides, etc)';

-- Progresso das aulas
CREATE TABLE IF NOT EXISTS public.progresso_aulas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  aula_id UUID NOT NULL REFERENCES public.aulas(id) ON DELETE CASCADE,
  progresso INTEGER NOT NULL DEFAULT 0 CHECK (progresso >= 0 AND progresso <= 100),
  concluida BOOLEAN NOT NULL DEFAULT false,
  ultima_visualizacao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  UNIQUE(user_id, aula_id)
);

COMMENT ON TABLE public.progresso_aulas IS 'Progresso dos usuários nas aulas';
COMMENT ON COLUMN public.progresso_aulas.progresso IS 'Progresso de 0 a 100%';

-- Ferramentas recomendadas
CREATE TABLE IF NOT EXISTS public.ferramentas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome TEXT NOT NULL,
  descricao TEXT NOT NULL,
  categoria TEXT NOT NULL,
  preco TEXT NOT NULL, -- 'Gratuito', 'Freemium', 'Pago', etc
  link TEXT NOT NULL,
  logo_url TEXT,
  casos_uso TEXT[], -- Array de casos de uso
  ordem INTEGER NOT NULL DEFAULT 0,
  ativo BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMENT ON TABLE public.ferramentas IS 'Ferramentas de IA recomendadas';
COMMENT ON COLUMN public.ferramentas.casos_uso IS 'Array de casos de uso da ferramenta';

-- Prompts
CREATE TABLE IF NOT EXISTS public.prompts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo TEXT NOT NULL,
  categoria TEXT NOT NULL,
  subcategoria TEXT,
  conteudo TEXT NOT NULL,
  ordem INTEGER NOT NULL DEFAULT 0,
  ativo BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMENT ON TABLE public.prompts IS 'Biblioteca de prompts testados e otimizados';

-- Lives
CREATE TABLE IF NOT EXISTS public.lives (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo TEXT NOT NULL,
  descricao TEXT,
  data_agendada DATE NOT NULL,
  horario TIME NOT NULL,
  status live_status NOT NULL DEFAULT 'agendada',
  plataforma TEXT NOT NULL DEFAULT 'meet', -- 'meet' ou 'zoom'
  link_meet TEXT,
  link_zoom TEXT,
  link_gravacao TEXT,
  materiais JSONB, -- Materiais em formato JSON (pode conter múltiplos arquivos)
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMENT ON TABLE public.lives IS 'Lives e eventos semanais';
COMMENT ON COLUMN public.lives.materiais IS 'Materiais da live em formato JSONB';

-- Favoritos (opcional)
CREATE TABLE IF NOT EXISTS public.favorites (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  tipo TEXT NOT NULL CHECK (tipo IN ('prompt', 'ferramenta')),
  item_id UUID NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  UNIQUE(user_id, tipo, item_id)
);

COMMENT ON TABLE public.favorites IS 'Itens favoritados pelos usuários';
COMMENT ON COLUMN public.favorites.tipo IS 'Tipo do item: prompt ou ferramenta';
COMMENT ON COLUMN public.favorites.item_id IS 'ID do prompt ou ferramenta favoritado';

-- Perfis pendentes (inseridos pelo n8n após compra)
-- Quando dados são inseridos aqui, cria automaticamente o usuário no auth
CREATE TABLE IF NOT EXISTS public.pending_users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT NOT NULL UNIQUE,
  nome TEXT NOT NULL,
  plano plan_type NOT NULL DEFAULT 'essencial',
  senha_temporaria TEXT, -- Senha gerada automaticamente (opcional, pode usar magic link)
  user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL, -- Preenchido após criação
  processado BOOLEAN NOT NULL DEFAULT false, -- Indica se já foi processado
  erro_processamento TEXT, -- Mensagem de erro se houver
  dados_pagamento JSONB, -- Dados adicionais da compra (ID da transação, gateway, etc)
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMENT ON TABLE public.pending_users IS 'Usuários pendentes de criação (inseridos pelo n8n após compra)';
COMMENT ON COLUMN public.pending_users.email IS 'Email do usuário (deve ser único)';
COMMENT ON COLUMN public.pending_users.plano IS 'Plano adquirido pelo usuário';
COMMENT ON COLUMN public.pending_users.senha_temporaria IS 'Senha temporária gerada (opcional, pode usar magic link)';
COMMENT ON COLUMN public.pending_users.user_id IS 'ID do usuário criado no auth (preenchido automaticamente)';
COMMENT ON COLUMN public.pending_users.processado IS 'Indica se o usuário já foi criado no auth';
COMMENT ON COLUMN public.pending_users.erro_processamento IS 'Mensagem de erro caso a criação falhe';
COMMENT ON COLUMN public.pending_users.dados_pagamento IS 'Dados adicionais da compra (JSONB)';

-- ============================================================================
-- 3. ÍNDICES PARA PERFORMANCE
-- ============================================================================

-- Índices para user_profiles
CREATE INDEX IF NOT EXISTS idx_user_profiles_user_id ON public.user_profiles(user_id);
CREATE INDEX IF NOT EXISTS idx_user_profiles_plano ON public.user_profiles(plano);
CREATE INDEX IF NOT EXISTS idx_user_profiles_is_admin ON public.user_profiles(is_admin);

-- Índices para user_roles
CREATE INDEX IF NOT EXISTS idx_user_roles_user_id ON public.user_roles(user_id);
CREATE INDEX IF NOT EXISTS idx_user_roles_role ON public.user_roles(role);

-- Índices para modulos
CREATE INDEX IF NOT EXISTS idx_modulos_ativo ON public.modulos(ativo);
CREATE INDEX IF NOT EXISTS idx_modulos_plano_minimo ON public.modulos(plano_minimo);
CREATE INDEX IF NOT EXISTS idx_modulos_ordem ON public.modulos(ordem);

-- Índices para aulas
CREATE INDEX IF NOT EXISTS idx_aulas_modulo_id ON public.aulas(modulo_id);
CREATE INDEX IF NOT EXISTS idx_aulas_ordem ON public.aulas(ordem);

-- Índices para progresso_aulas
CREATE INDEX IF NOT EXISTS idx_progresso_aulas_user_id ON public.progresso_aulas(user_id);
CREATE INDEX IF NOT EXISTS idx_progresso_aulas_aula_id ON public.progresso_aulas(aula_id);
CREATE INDEX IF NOT EXISTS idx_progresso_aulas_concluida ON public.progresso_aulas(concluida);

-- Índices para ferramentas
CREATE INDEX IF NOT EXISTS idx_ferramentas_ativo ON public.ferramentas(ativo);
CREATE INDEX IF NOT EXISTS idx_ferramentas_categoria ON public.ferramentas(categoria);
CREATE INDEX IF NOT EXISTS idx_ferramentas_ordem ON public.ferramentas(ordem);

-- Índices para prompts
CREATE INDEX IF NOT EXISTS idx_prompts_ativo ON public.prompts(ativo);
CREATE INDEX IF NOT EXISTS idx_prompts_categoria ON public.prompts(categoria);
CREATE INDEX IF NOT EXISTS idx_prompts_ordem ON public.prompts(ordem);

-- Índices para lives
CREATE INDEX IF NOT EXISTS idx_lives_data_agendada ON public.lives(data_agendada);
CREATE INDEX IF NOT EXISTS idx_lives_status ON public.lives(status);

-- Índices para favorites
CREATE INDEX IF NOT EXISTS idx_favorites_user_id ON public.favorites(user_id);
CREATE INDEX IF NOT EXISTS idx_favorites_tipo_item ON public.favorites(tipo, item_id);

-- Índices para pending_users
CREATE INDEX IF NOT EXISTS idx_pending_users_email ON public.pending_users(email);
CREATE INDEX IF NOT EXISTS idx_pending_users_processado ON public.pending_users(processado);
CREATE INDEX IF NOT EXISTS idx_pending_users_user_id ON public.pending_users(user_id);

-- ============================================================================
-- 4. HABILITAR ROW LEVEL SECURITY (RLS)
-- ============================================================================

ALTER TABLE public.user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.modulos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.aulas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.progresso_aulas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ferramentas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.prompts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lives ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.favorites ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.pending_users ENABLE ROW LEVEL SECURITY;

-- ============================================================================
-- 5. FUNÇÕES AUXILIARES
-- ============================================================================

-- Função para verificar se usuário é admin
CREATE OR REPLACE FUNCTION public.is_admin(_user_id UUID)
RETURNS BOOLEAN
LANGUAGE SQL
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.user_profiles
    WHERE user_id = _user_id
      AND is_admin = true
  )
$$;

COMMENT ON FUNCTION public.is_admin IS 'Verifica se um usuário é administrador';

-- Função para verificar role do usuário
CREATE OR REPLACE FUNCTION public.has_role(_user_id UUID, _role app_role)
RETURNS BOOLEAN
LANGUAGE SQL
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.user_roles
    WHERE user_id = _user_id
      AND role = _role
  )
$$;

COMMENT ON FUNCTION public.has_role IS 'Verifica se um usuário tem um role específico';

-- Função para atualizar updated_at automaticamente
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

COMMENT ON FUNCTION public.update_updated_at_column IS 'Atualiza automaticamente o campo updated_at';

-- Função para criar perfil automaticamente quando usuário se cadastra no auth
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_plano plan_type;
  v_nome TEXT;
BEGIN
  -- Verifica se existe um pending_user com este email
  SELECT p.plano, p.nome INTO v_plano, v_nome
  FROM public.pending_users p
  WHERE p.email = NEW.email
  AND p.processado = false
  LIMIT 1;

  -- Se não encontrou, usa valores padrão
  IF v_plano IS NULL THEN
    v_plano := 'essencial';
  END IF;

  IF v_nome IS NULL THEN
    v_nome := COALESCE(NEW.raw_user_meta_data->>'nome', split_part(NEW.email, '@', 1));
  END IF;

  -- Cria o perfil
  INSERT INTO public.user_profiles (user_id, nome, plano)
  VALUES (NEW.id, v_nome, v_plano);

  -- Atualiza o pending_user marcando como processado
  UPDATE public.pending_users
  SET 
    user_id = NEW.id,
    processado = true,
    updated_at = now()
  WHERE email = NEW.email
  AND processado = false;

  RETURN NEW;
END;
$$;

COMMENT ON FUNCTION public.handle_new_user IS 'Cria perfil automaticamente quando novo usuário se cadastra no auth';

-- NOTA: Não é possível criar usuários diretamente em auth.users via função SQL
-- Use a API Admin do Supabase ou uma Edge Function
-- Veja INTEGRACAO_N8N.md para instruções detalhadas

-- ============================================================================
-- 6. TRIGGERS
-- ============================================================================

-- Trigger para criar perfil ao cadastrar usuário no auth
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- NOTA: Para criar usuários automaticamente quando inserir em pending_users:
-- 1. Configure um webhook no n8n que chame a API Admin do Supabase
-- 2. Ou use uma Edge Function do Supabase
-- Veja INTEGRACAO_N8N.md para instruções detalhadas

-- Triggers para atualizar updated_at
DROP TRIGGER IF EXISTS update_user_profiles_updated_at ON public.user_profiles;
CREATE TRIGGER update_user_profiles_updated_at
  BEFORE UPDATE ON public.user_profiles
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_modulos_updated_at ON public.modulos;
CREATE TRIGGER update_modulos_updated_at
  BEFORE UPDATE ON public.modulos
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_aulas_updated_at ON public.aulas;
CREATE TRIGGER update_aulas_updated_at
  BEFORE UPDATE ON public.aulas
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_progresso_aulas_updated_at ON public.progresso_aulas;
CREATE TRIGGER update_progresso_aulas_updated_at
  BEFORE UPDATE ON public.progresso_aulas
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_ferramentas_updated_at ON public.ferramentas;
CREATE TRIGGER update_ferramentas_updated_at
  BEFORE UPDATE ON public.ferramentas
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_prompts_updated_at ON public.prompts;
CREATE TRIGGER update_prompts_updated_at
  BEFORE UPDATE ON public.prompts
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_lives_updated_at ON public.lives;
CREATE TRIGGER update_lives_updated_at
  BEFORE UPDATE ON public.lives
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

DROP TRIGGER IF EXISTS update_pending_users_updated_at ON public.pending_users;
CREATE TRIGGER update_pending_users_updated_at
  BEFORE UPDATE ON public.pending_users
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============================================================================
-- 7. POLÍTICAS RLS (ROW LEVEL SECURITY)
-- ============================================================================

-- Remover políticas existentes (se houver)
DO $$ 
DECLARE
  v_sql TEXT;
BEGIN
  SELECT string_agg('DROP POLICY IF EXISTS ' || quote_ident(policyname) || ' ON ' || quote_ident(schemaname) || '.' || quote_ident(tablename), '; ')
  INTO v_sql
  FROM pg_policies 
  WHERE schemaname = 'public' 
  AND tablename IN ('user_profiles', 'user_roles', 'modulos', 'aulas', 'progresso_aulas', 'ferramentas', 'prompts', 'lives', 'favorites', 'pending_users');
  
  -- Só executa se houver políticas para remover
  IF v_sql IS NOT NULL THEN
    EXECUTE v_sql;
  END IF;
END $$;

-- ============================================================================
-- POLÍTICAS PARA user_profiles
-- ============================================================================

-- Usuários podem ver seu próprio perfil
CREATE POLICY "Users can view their own profile"
  ON public.user_profiles FOR SELECT
  USING (auth.uid() = user_id);

-- Usuários podem atualizar seu próprio perfil
CREATE POLICY "Users can update their own profile"
  ON public.user_profiles FOR UPDATE
  USING (auth.uid() = user_id);

-- Admins podem ver todos os perfis
CREATE POLICY "Admins can view all profiles"
  ON public.user_profiles FOR SELECT
  USING (is_admin(auth.uid()));

-- Admins podem atualizar todos os perfis
CREATE POLICY "Admins can update all profiles"
  ON public.user_profiles FOR UPDATE
  USING (is_admin(auth.uid()));

-- Admins podem inserir perfis
CREATE POLICY "Admins can insert profiles"
  ON public.user_profiles FOR INSERT
  WITH CHECK (is_admin(auth.uid()));

-- ============================================================================
-- POLÍTICAS PARA user_roles
-- ============================================================================

-- Usuários podem ver seus próprios roles
CREATE POLICY "Users can view their own roles"
  ON public.user_roles FOR SELECT
  USING (auth.uid() = user_id);

-- Admins podem ver todos os roles
CREATE POLICY "Admins can view all roles"
  ON public.user_roles FOR SELECT
  USING (is_admin(auth.uid()));

-- Admins podem gerenciar todos os roles
CREATE POLICY "Admins can manage roles"
  ON public.user_roles FOR ALL
  USING (is_admin(auth.uid()));

-- ============================================================================
-- POLÍTICAS PARA modulos
-- ============================================================================

-- Usuários autenticados podem ver módulos ativos baseado no plano
CREATE POLICY "Authenticated users can view active modulos"
  ON public.modulos FOR SELECT
  USING (
    auth.uid() IS NOT NULL 
    AND ativo = true 
    AND EXISTS (
      SELECT 1 FROM user_profiles
      WHERE user_profiles.user_id = auth.uid()
      AND (
        modulos.plano_minimo = 'essencial'
        OR (modulos.plano_minimo = 'completo' AND user_profiles.plano IN ('completo', 'premium'))
        OR (modulos.plano_minimo = 'premium' AND user_profiles.plano = 'premium')
      )
    )
  );

-- Admins podem gerenciar módulos
CREATE POLICY "Admins can manage modulos"
  ON public.modulos FOR ALL
  USING (is_admin(auth.uid()));

-- ============================================================================
-- POLÍTICAS PARA aulas
-- ============================================================================

-- Usuários autenticados podem ver aulas de módulos acessíveis
CREATE POLICY "Authenticated users can view aulas from accessible modulos"
  ON public.aulas FOR SELECT
  USING (
    auth.uid() IS NOT NULL
    AND EXISTS (
      SELECT 1 FROM modulos m
      JOIN user_profiles up ON up.user_id = auth.uid()
      WHERE m.id = aulas.modulo_id
      AND m.ativo = true
      AND (
        m.plano_minimo = 'essencial'
        OR (m.plano_minimo = 'completo' AND up.plano IN ('completo', 'premium'))
        OR (m.plano_minimo = 'premium' AND up.plano = 'premium')
      )
    )
  );

-- Admins podem gerenciar aulas
CREATE POLICY "Admins can manage aulas"
  ON public.aulas FOR ALL
  USING (is_admin(auth.uid()));

-- ============================================================================
-- POLÍTICAS PARA progresso_aulas
-- ============================================================================

-- Usuários podem ver seu próprio progresso
CREATE POLICY "Users can view their own progress"
  ON public.progresso_aulas FOR SELECT
  USING (auth.uid() = user_id);

-- Usuários podem gerenciar seu próprio progresso
CREATE POLICY "Users can manage their own progress"
  ON public.progresso_aulas FOR ALL
  USING (auth.uid() = user_id);

-- Admins podem ver todo o progresso
CREATE POLICY "Admins can view all progress"
  ON public.progresso_aulas FOR SELECT
  USING (is_admin(auth.uid()));

-- ============================================================================
-- POLÍTICAS PARA ferramentas
-- ============================================================================

-- Usuários autenticados podem ver ferramentas ativas
CREATE POLICY "Authenticated users can view active ferramentas"
  ON public.ferramentas FOR SELECT
  USING (auth.uid() IS NOT NULL AND ativo = true);

-- Admins podem gerenciar ferramentas
CREATE POLICY "Admins can manage ferramentas"
  ON public.ferramentas FOR ALL
  USING (is_admin(auth.uid()));

-- ============================================================================
-- POLÍTICAS PARA prompts
-- ============================================================================

-- Usuários autenticados podem ver prompts ativos
CREATE POLICY "Authenticated users can view active prompts"
  ON public.prompts FOR SELECT
  USING (auth.uid() IS NOT NULL AND ativo = true);

-- Admins podem gerenciar prompts
CREATE POLICY "Admins can manage prompts"
  ON public.prompts FOR ALL
  USING (is_admin(auth.uid()));

-- ============================================================================
-- POLÍTICAS PARA lives
-- ============================================================================

-- Usuários autenticados podem ver lives
CREATE POLICY "Authenticated users can view lives"
  ON public.lives FOR SELECT
  USING (auth.uid() IS NOT NULL);

-- Admins podem gerenciar lives
CREATE POLICY "Admins can manage lives"
  ON public.lives FOR ALL
  USING (is_admin(auth.uid()));

-- ============================================================================
-- POLÍTICAS PARA favorites
-- ============================================================================

-- Usuários podem ver seus próprios favoritos
CREATE POLICY "Users can view their own favorites"
  ON public.favorites FOR SELECT
  USING (auth.uid() = user_id);

-- Usuários podem gerenciar seus próprios favoritos
CREATE POLICY "Users can manage their own favorites"
  ON public.favorites FOR ALL
  USING (auth.uid() = user_id);

-- Admins podem ver todos os favoritos
CREATE POLICY "Admins can view all favorites"
  ON public.favorites FOR SELECT
  USING (is_admin(auth.uid()));

-- ============================================================================
-- POLÍTICAS PARA pending_users
-- ============================================================================

-- Apenas admins podem ver pending_users
CREATE POLICY "Admins can view pending users"
  ON public.pending_users FOR SELECT
  USING (is_admin(auth.uid()));

-- Apenas service role (n8n) pode inserir pending_users
-- NOTA: Para inserir via n8n, use a service_role_key do Supabase
-- Esta política permite inserção apenas via service role
CREATE POLICY "Service role can insert pending users"
  ON public.pending_users FOR INSERT
  WITH CHECK (true); -- Service role bypassa RLS

-- Admins podem atualizar pending_users
CREATE POLICY "Admins can update pending users"
  ON public.pending_users FOR UPDATE
  USING (is_admin(auth.uid()));

-- ============================================================================
-- FIM DO SCRIPT
-- ============================================================================
--
-- IMPORTANTE: Para criar usuários automaticamente via n8n:
--
-- 1. n8n insere dados em pending_users após compra confirmada
-- 2. n8n chama a API Admin do Supabase para criar o usuário
-- 3. O trigger on_auth_user_created cria automaticamente o perfil em user_profiles
-- 4. n8n atualiza pending_users marcando como processado
--
-- Veja INTEGRACAO_N8N.md para instruções detalhadas de configuração

-- Para criar os Storage Buckets, execute os seguintes comandos no Supabase Dashboard:
-- 
-- 1. Vá em Storage > Create Bucket
-- 2. Crie os seguintes buckets:
--    - videos (público: false)
--    - materiais (público: false)
--    - logos (público: true)
--    - avatars (público: false)
--
-- Ou use a API do Supabase para criar programaticamente

