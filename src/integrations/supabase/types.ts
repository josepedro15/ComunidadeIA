export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "13.0.5"
  }
  public: {
    Tables: {
      aulas: {
        Row: {
          created_at: string
          descricao: string | null
          duracao: number
          id: string
          materiais: string[] | null
          modulo_id: string
          ordem: number
          titulo: string
          updated_at: string
          video_url: string
        }
        Insert: {
          created_at?: string
          descricao?: string | null
          duracao: number
          id?: string
          materiais?: string[] | null
          modulo_id: string
          ordem?: number
          titulo: string
          updated_at?: string
          video_url: string
        }
        Update: {
          created_at?: string
          descricao?: string | null
          duracao?: number
          id?: string
          materiais?: string[] | null
          modulo_id?: string
          ordem?: number
          titulo?: string
          updated_at?: string
          video_url?: string
        }
        Relationships: [
          {
            foreignKeyName: "aulas_modulo_id_fkey"
            columns: ["modulo_id"]
            isOneToOne: false
            referencedRelation: "modulos"
            referencedColumns: ["id"]
          },
        ]
      }
      ferramentas: {
        Row: {
          ativo: boolean
          casos_uso: string[] | null
          categoria: string
          created_at: string
          descricao: string
          id: string
          link: string
          logo_url: string | null
          nome: string
          ordem: number
          preco: string
          updated_at: string
        }
        Insert: {
          ativo?: boolean
          casos_uso?: string[] | null
          categoria: string
          created_at?: string
          descricao: string
          id?: string
          link: string
          logo_url?: string | null
          nome: string
          ordem?: number
          preco: string
          updated_at?: string
        }
        Update: {
          ativo?: boolean
          casos_uso?: string[] | null
          categoria?: string
          created_at?: string
          descricao?: string
          id?: string
          link?: string
          logo_url?: string | null
          nome?: string
          ordem?: number
          preco?: string
          updated_at?: string
        }
        Relationships: []
      }
      lives: {
        Row: {
          created_at: string
          data_agendada: string
          descricao: string | null
          horario: string
          id: string
          link_gravacao: string | null
          link_meet: string | null
          link_zoom: string | null
          materiais: Json | null
          plataforma: string
          status: Database["public"]["Enums"]["live_status"]
          titulo: string
          updated_at: string
        }
        Insert: {
          created_at?: string
          data_agendada: string
          descricao?: string | null
          horario: string
          id?: string
          link_gravacao?: string | null
          link_meet?: string | null
          link_zoom?: string | null
          materiais?: Json | null
          plataforma?: string
          status?: Database["public"]["Enums"]["live_status"]
          titulo: string
          updated_at?: string
        }
        Update: {
          created_at?: string
          data_agendada?: string
          descricao?: string | null
          horario?: string
          id?: string
          link_gravacao?: string | null
          link_meet?: string | null
          link_zoom?: string | null
          materiais?: Json | null
          plataforma?: string
          status?: Database["public"]["Enums"]["live_status"]
          titulo?: string
          updated_at?: string
        }
        Relationships: []
      }
      modulos: {
        Row: {
          ativo: boolean
          created_at: string
          descricao: string
          id: string
          ordem: number
          plano_minimo: Database["public"]["Enums"]["plan_type"]
          titulo: string
          updated_at: string
        }
        Insert: {
          ativo?: boolean
          created_at?: string
          descricao: string
          id?: string
          ordem?: number
          plano_minimo?: Database["public"]["Enums"]["plan_type"]
          titulo: string
          updated_at?: string
        }
        Update: {
          ativo?: boolean
          created_at?: string
          descricao?: string
          id?: string
          ordem?: number
          plano_minimo?: Database["public"]["Enums"]["plan_type"]
          titulo?: string
          updated_at?: string
        }
        Relationships: []
      }
      progresso_aulas: {
        Row: {
          aula_id: string
          concluida: boolean
          created_at: string
          id: string
          progresso: number
          ultima_visualizacao: string
          updated_at: string
          user_id: string
        }
        Insert: {
          aula_id: string
          concluida?: boolean
          created_at?: string
          id?: string
          progresso?: number
          ultima_visualizacao?: string
          updated_at?: string
          user_id: string
        }
        Update: {
          aula_id?: string
          concluida?: boolean
          created_at?: string
          id?: string
          progresso?: number
          ultima_visualizacao?: string
          updated_at?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "progresso_aulas_aula_id_fkey"
            columns: ["aula_id"]
            isOneToOne: false
            referencedRelation: "aulas"
            referencedColumns: ["id"]
          },
        ]
      }
      prompts: {
        Row: {
          ativo: boolean
          categoria: string
          conteudo: string
          created_at: string
          id: string
          ordem: number
          subcategoria: string | null
          titulo: string
          updated_at: string
        }
        Insert: {
          ativo?: boolean
          categoria: string
          conteudo: string
          created_at?: string
          id?: string
          ordem?: number
          subcategoria?: string | null
          titulo: string
          updated_at?: string
        }
        Update: {
          ativo?: boolean
          categoria?: string
          conteudo?: string
          created_at?: string
          id?: string
          ordem?: number
          subcategoria?: string | null
          titulo?: string
          updated_at?: string
        }
        Relationships: []
      }
      user_profiles: {
        Row: {
          created_at: string
          data_adesao: string
          foto_url: string | null
          id: string
          is_admin: boolean
          nome: string
          plano: Database["public"]["Enums"]["plan_type"]
          updated_at: string
          user_id: string
        }
        Insert: {
          created_at?: string
          data_adesao?: string
          foto_url?: string | null
          id?: string
          is_admin?: boolean
          nome: string
          plano?: Database["public"]["Enums"]["plan_type"]
          updated_at?: string
          user_id: string
        }
        Update: {
          created_at?: string
          data_adesao?: string
          foto_url?: string | null
          id?: string
          is_admin?: boolean
          nome?: string
          plano?: Database["public"]["Enums"]["plan_type"]
          updated_at?: string
          user_id?: string
        }
        Relationships: []
      }
      user_roles: {
        Row: {
          created_at: string
          id: string
          role: Database["public"]["Enums"]["app_role"]
          user_id: string
        }
        Insert: {
          created_at?: string
          id?: string
          role: Database["public"]["Enums"]["app_role"]
          user_id: string
        }
        Update: {
          created_at?: string
          id?: string
          role?: Database["public"]["Enums"]["app_role"]
          user_id?: string
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      has_role: {
        Args: {
          _role: Database["public"]["Enums"]["app_role"]
          _user_id: string
        }
        Returns: boolean
      }
      is_admin: { Args: { _user_id: string }; Returns: boolean }
    }
    Enums: {
      app_role: "admin" | "moderator" | "user"
      live_status: "agendada" | "ao_vivo" | "encerrada"
      plan_type: "essencial" | "completo" | "premium"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {
      app_role: ["admin", "moderator", "user"],
      live_status: ["agendada", "ao_vivo", "encerrada"],
      plan_type: ["essencial", "completo", "premium"],
    },
  },
} as const
