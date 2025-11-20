import { useState, useEffect } from "react";
import { User } from "@supabase/supabase-js";
import { supabase } from "@/integrations/supabase/client";
import type { Database } from "@/integrations/supabase/types";

type UserProfile = Database["public"]["Tables"]["user_profiles"]["Row"];

interface AuthState {
  user: User | null;
  profile: UserProfile | null;
  loading: boolean;
  profileLoading: boolean; // Estado separado para carregamento do perfil
  isAdmin: boolean;
}

export function useAuth() {
  const [authState, setAuthState] = useState<AuthState>({
    user: null,
    profile: null,
    loading: true,
    profileLoading: true, // Inicia como true para aguardar perfil
    isAdmin: false,
  });

  useEffect(() => {
    let isMounted = true;
    let profileTimeoutId: NodeJS.Timeout | null = null;
    let profileLoadInProgress = false; // Flag para evitar múltiplas chamadas simultâneas
    
    // Timeout de segurança para evitar loading infinito
    const timeoutId = setTimeout(() => {
      if (isMounted) {
        console.warn("Timeout na verificação de autenticação");
        setAuthState((prev) => ({ ...prev, loading: false }));
      }
    }, 5000); // 5 segundos máximo

    const loadUserProfile = async (userId: string) => {
      // Evita múltiplas chamadas simultâneas
      if (profileLoadInProgress) {
        console.log("Perfil já está sendo carregado, ignorando chamada duplicada");
        return;
      }
      
      profileLoadInProgress = true;
      
      // Marca que está carregando o perfil
      if (isMounted) {
        setAuthState((prev) => ({ ...prev, profileLoading: true }));
      }

      try {
        // Timeout de segurança (aumentado para 8s para dar mais tempo)
        profileTimeoutId = setTimeout(() => {
          console.warn("Timeout ao carregar perfil do usuário após 8s");
          if (isMounted) {
            setAuthState((prev) => ({
              ...prev,
              profile: null,
              isAdmin: false,
              profileLoading: false, // Para o loading do perfil
            }));
          }
        }, 8000);

        // Query otimizada: busca apenas campos necessários
        const { data, error } = await supabase
          .from("user_profiles")
          .select("id, user_id, nome, foto_url, plano, is_admin, data_adesao")
          .eq("user_id", userId)
          .maybeSingle(); // Usa maybeSingle ao invés de single para não falhar se não existir

        if (profileTimeoutId) clearTimeout(profileTimeoutId);

        if (!isMounted) return;

        if (error) {
          // Se for erro de "não encontrado", não é crítico
          if (error.code === 'PGRST116') {
            console.log("Perfil não encontrado, usuário sem perfil");
            if (isMounted) {
              setAuthState((prev) => ({
                ...prev,
                profile: null,
                isAdmin: false,
                profileLoading: false, // Para o loading do perfil
              }));
            }
            return;
          }
          throw error;
        }

        if (isMounted) {
          setAuthState((prev) => ({
            ...prev,
            profile: data,
            isAdmin: data?.is_admin ?? false,
            profileLoading: false, // Perfil carregado
          }));
        }
      } catch (error: any) {
        if (profileTimeoutId) clearTimeout(profileTimeoutId);
        console.error("Erro ao carregar perfil:", error);
        // Sempre marca como não loading, mesmo em caso de erro
        if (isMounted) {
          setAuthState((prev) => ({
            ...prev,
            profile: null,
            isAdmin: false,
            profileLoading: false, // Para o loading do perfil
          }));
        }
      } finally {
        profileLoadInProgress = false;
      }
    };

    // Verifica sessão inicial
    const checkSessionAndProfile = async () => {
      try {
        const { data: { session }, error } = await supabase.auth.getSession();
        
        if (!isMounted) return;
        
        if (error) {
          console.error("Erro ao verificar sessão:", error);
          clearTimeout(timeoutId);
          setAuthState((prev) => ({ ...prev, loading: false }));
          return;
        }
        
        if (session?.user) {
          // Para o loading assim que tiver o usuário (não espera o perfil)
          setAuthState((prev) => ({
            ...prev,
            user: session.user,
            loading: false, // Para o loading imediatamente
          }));
          clearTimeout(timeoutId);
          // Carrega o perfil em background (não bloqueia a renderização)
          loadUserProfile(session.user.id).catch(err => {
            console.error("Erro ao carregar perfil em background:", err);
          });
        } else {
          clearTimeout(timeoutId);
          setAuthState((prev) => ({ ...prev, loading: false }));
        }
      } catch (error) {
        console.error("Erro ao verificar sessão:", error);
        if (isMounted) {
          clearTimeout(timeoutId);
          setAuthState((prev) => ({ ...prev, loading: false }));
        }
      }
    };

    checkSessionAndProfile();

    // Escuta mudanças na autenticação
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange(async (event, session) => {
      try {
        if (session?.user) {
          setAuthState((prev) => ({
            ...prev,
            user: session.user,
            loading: false, // Não bloqueia para mudanças de auth
          }));
          // Carrega perfil em background
          loadUserProfile(session.user.id).catch(err => {
            console.error("Erro ao carregar perfil:", err);
          });
        } else {
          setAuthState({
            user: null,
            profile: null,
            loading: false,
            profileLoading: false,
            isAdmin: false,
          });
        }
      } catch (error) {
        console.error("Erro ao processar mudança de autenticação:", error);
        setAuthState((prev) => ({ ...prev, loading: false }));
      }
    });

    return () => {
      isMounted = false;
      clearTimeout(timeoutId);
      if (profileTimeoutId) clearTimeout(profileTimeoutId);
      subscription.unsubscribe();
    };
  }, []);

  // Função auxiliar para carregar perfil (usada por signIn)
  const loadUserProfileExternal = async (userId: string) => {
    setAuthState((prev) => ({ ...prev, profileLoading: true }));
    
    try {
      // Query otimizada: busca apenas campos necessários
      const { data, error } = await supabase
        .from("user_profiles")
        .select("id, user_id, nome, foto_url, plano, is_admin, data_adesao")
        .eq("user_id", userId)
        .maybeSingle();

      if (error) {
        if (error.code === 'PGRST116') {
          console.log("Perfil não encontrado, usuário sem perfil");
          setAuthState((prev) => ({
            ...prev,
            profile: null,
            isAdmin: false,
            profileLoading: false,
          }));
          return;
        }
        throw error;
      }

      setAuthState((prev) => ({
        ...prev,
        profile: data,
        isAdmin: data?.is_admin ?? false,
        profileLoading: false,
      }));
    } catch (error: any) {
      console.error("Erro ao carregar perfil:", error);
      setAuthState((prev) => ({
        ...prev,
        profile: null,
        isAdmin: false,
        profileLoading: false,
      }));
    }
  };

  const signIn = async (email: string, password: string) => {
    try {
      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      if (error) throw error;

      if (data.user) {
        await loadUserProfileExternal(data.user.id);
      }

      return { data, error: null };
    } catch (error: any) {
      return { data: null, error };
    }
  };

  const signOut = async () => {
    try {
      const { error } = await supabase.auth.signOut();
      if (error) throw error;
      return { error: null };
    } catch (error: any) {
      return { error };
    }
  };

  const resetPassword = async (email: string) => {
    try {
      const { error } = await supabase.auth.resetPasswordForEmail(email, {
        redirectTo: `${window.location.origin}/auth?type=reset`,
      });
      if (error) throw error;
      return { error: null };
    } catch (error: any) {
      return { error };
    }
  };

  return {
    ...authState,
    signIn,
    signOut,
    resetPassword,
  };
}

