import { useState, useEffect } from "react";
import { User } from "@supabase/supabase-js";
import { supabase } from "@/integrations/supabase/client";
import type { Database } from "@/integrations/supabase/types";

type UserProfile = Database["public"]["Tables"]["user_profiles"]["Row"];

interface AuthState {
  user: User | null;
  profile: UserProfile | null;
  loading: boolean;
  isAdmin: boolean;
}

export function useAuth() {
  const [authState, setAuthState] = useState<AuthState>({
    user: null,
    profile: null,
    loading: true,
    isAdmin: false,
  });

  useEffect(() => {
    // Verifica sessão inicial
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (session?.user) {
        setAuthState((prev) => ({
          ...prev,
          user: session.user,
          loading: false,
        }));
        loadUserProfile(session.user.id);
      } else {
        setAuthState((prev) => ({ ...prev, loading: false }));
      }
    });

    // Escuta mudanças na autenticação
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange(async (event, session) => {
      if (session?.user) {
        setAuthState((prev) => ({
          ...prev,
          user: session.user,
          loading: false,
        }));
        loadUserProfile(session.user.id);
      } else {
        setAuthState({
          user: null,
          profile: null,
          loading: false,
          isAdmin: false,
        });
      }
    });

    return () => {
      subscription.unsubscribe();
    };
  }, []);

  const loadUserProfile = async (userId: string) => {
    try {
      const { data, error } = await supabase
        .from("user_profiles")
        .select("*")
        .eq("user_id", userId)
        .single();

      if (error) throw error;

      setAuthState((prev) => ({
        ...prev,
        profile: data,
        isAdmin: data?.is_admin ?? false,
      }));
    } catch (error) {
      console.error("Erro ao carregar perfil:", error);
      setAuthState((prev) => ({
        ...prev,
        profile: null,
        isAdmin: false,
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
        await loadUserProfile(data.user.id);
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

