-- Create enums only if they don't exist
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'app_role') THEN
    CREATE TYPE public.app_role AS ENUM ('admin', 'moderator', 'user');
  END IF;
END $$;

DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'live_status') THEN
    CREATE TYPE public.live_status AS ENUM ('agendada', 'ao_vivo', 'concluida', 'cancelada');
  END IF;
END $$;

DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'plan_type') THEN
    CREATE TYPE public.plan_type AS ENUM ('essencial', 'completo', 'premium');
  END IF;
END $$;

-- Create tables
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

CREATE TABLE IF NOT EXISTS public.user_roles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  role app_role NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  UNIQUE(user_id, role)
);

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

CREATE TABLE IF NOT EXISTS public.aulas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  modulo_id UUID NOT NULL REFERENCES public.modulos(id) ON DELETE CASCADE,
  titulo TEXT NOT NULL,
  descricao TEXT,
  video_url TEXT NOT NULL,
  duracao INTEGER NOT NULL,
  ordem INTEGER NOT NULL DEFAULT 0,
  materiais TEXT[],
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.progresso_aulas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  aula_id UUID NOT NULL REFERENCES public.aulas(id) ON DELETE CASCADE,
  progresso INTEGER NOT NULL DEFAULT 0,
  concluida BOOLEAN NOT NULL DEFAULT false,
  ultima_visualizacao TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  UNIQUE(user_id, aula_id)
);

CREATE TABLE IF NOT EXISTS public.ferramentas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome TEXT NOT NULL,
  descricao TEXT NOT NULL,
  categoria TEXT NOT NULL,
  preco TEXT NOT NULL,
  link TEXT NOT NULL,
  logo_url TEXT,
  casos_uso TEXT[],
  ordem INTEGER NOT NULL DEFAULT 0,
  ativo BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

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

CREATE TABLE IF NOT EXISTS public.lives (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo TEXT NOT NULL,
  descricao TEXT,
  data_agendada DATE NOT NULL,
  horario TIME NOT NULL,
  status live_status NOT NULL DEFAULT 'agendada',
  plataforma TEXT NOT NULL DEFAULT 'meet',
  link_meet TEXT,
  link_zoom TEXT,
  link_gravacao TEXT,
  materiais JSONB,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Enable RLS
ALTER TABLE public.user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.modulos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.aulas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.progresso_aulas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ferramentas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.prompts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lives ENABLE ROW LEVEL SECURITY;

-- Create functions (AFTER tables exist)
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

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO public.user_profiles (user_id, nome, plano)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'nome', NEW.email),
    'essencial'
  );
  RETURN NEW;
END;
$$;

-- Drop and recreate triggers
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP TRIGGER IF EXISTS update_user_profiles_updated_at ON public.user_profiles;
DROP TRIGGER IF EXISTS update_modulos_updated_at ON public.modulos;
DROP TRIGGER IF EXISTS update_aulas_updated_at ON public.aulas;
DROP TRIGGER IF EXISTS update_progresso_aulas_updated_at ON public.progresso_aulas;
DROP TRIGGER IF EXISTS update_ferramentas_updated_at ON public.ferramentas;
DROP TRIGGER IF EXISTS update_prompts_updated_at ON public.prompts;
DROP TRIGGER IF EXISTS update_lives_updated_at ON public.lives;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

CREATE TRIGGER update_user_profiles_updated_at
  BEFORE UPDATE ON public.user_profiles
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_modulos_updated_at
  BEFORE UPDATE ON public.modulos
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_aulas_updated_at
  BEFORE UPDATE ON public.aulas
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_progresso_aulas_updated_at
  BEFORE UPDATE ON public.progresso_aulas
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_ferramentas_updated_at
  BEFORE UPDATE ON public.ferramentas
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_prompts_updated_at
  BEFORE UPDATE ON public.prompts
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_lives_updated_at
  BEFORE UPDATE ON public.lives
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- Drop existing policies
DO $$ 
BEGIN
  EXECUTE (
    SELECT string_agg('DROP POLICY IF EXISTS ' || quote_ident(policyname) || ' ON ' || quote_ident(schemaname) || '.' || quote_ident(tablename), '; ')
    FROM pg_policies 
    WHERE schemaname = 'public' 
    AND tablename IN ('user_profiles', 'user_roles', 'modulos', 'aulas', 'progresso_aulas', 'ferramentas', 'prompts', 'lives')
  );
END $$;

-- RLS Policies
CREATE POLICY "Users can view their own profile"
  ON public.user_profiles FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can update their own profile"
  ON public.user_profiles FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all profiles"
  ON public.user_profiles FOR SELECT
  USING (is_admin(auth.uid()));

CREATE POLICY "Admins can update all profiles"
  ON public.user_profiles FOR UPDATE
  USING (is_admin(auth.uid()));

CREATE POLICY "Users can view their own roles"
  ON public.user_roles FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all roles"
  ON public.user_roles FOR SELECT
  USING (is_admin(auth.uid()));

CREATE POLICY "Admins can manage roles"
  ON public.user_roles FOR ALL
  USING (is_admin(auth.uid()));

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

CREATE POLICY "Admins can manage modulos"
  ON public.modulos FOR ALL
  USING (is_admin(auth.uid()));

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

CREATE POLICY "Admins can manage aulas"
  ON public.aulas FOR ALL
  USING (is_admin(auth.uid()));

CREATE POLICY "Users can view their own progress"
  ON public.progresso_aulas FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can manage their own progress"
  ON public.progresso_aulas FOR ALL
  USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all progress"
  ON public.progresso_aulas FOR SELECT
  USING (is_admin(auth.uid()));

CREATE POLICY "Authenticated users can view active ferramentas"
  ON public.ferramentas FOR SELECT
  USING (auth.uid() IS NOT NULL AND ativo = true);

CREATE POLICY "Admins can manage ferramentas"
  ON public.ferramentas FOR ALL
  USING (is_admin(auth.uid()));

CREATE POLICY "Authenticated users can view active prompts"
  ON public.prompts FOR SELECT
  USING (auth.uid() IS NOT NULL AND ativo = true);

CREATE POLICY "Admins can manage prompts"
  ON public.prompts FOR ALL
  USING (is_admin(auth.uid()));

CREATE POLICY "Authenticated users can view lives"
  ON public.lives FOR SELECT
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Admins can manage lives"
  ON public.lives FOR ALL
  USING (is_admin(auth.uid()));