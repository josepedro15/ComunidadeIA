import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { Shield, ShieldOff, Search } from "lucide-react";
import { useState } from "react";
import type { Database } from "@/integrations/supabase/types";

type UserProfile = Database["public"]["Tables"]["user_profiles"]["Row"];

export default function MembrosAdmin() {
  const [searchTerm, setSearchTerm] = useState("");
  const queryClient = useQueryClient();

  // Buscar todos os membros
  const { data: membros, isLoading } = useQuery({
    queryKey: ["admin-membros"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("user_profiles")
        .select("*")
        .order("data_adesao", { ascending: false });

      if (error) throw error;

      // Buscar email do usuário atual para referência
      const { data: currentUser } = await supabase.auth.getUser();
      
      const membrosComInfo = (data || []).map((membro) => {
        // Se for o usuário atual, mostra o email
        const isCurrentUser = membro.user_id === currentUser?.user?.id;
        const email = isCurrentUser 
          ? currentUser.user.email || "N/A"
          : null; // Para outros usuários, o email não está disponível no frontend
        
        return {
          ...membro,
          email,
          isCurrentUser,
        };
      });

      return membrosComInfo;
    },
  });

  // Mutation para tornar admin
  const makeAdminMutation = useMutation({
    mutationFn: async (userId: string) => {
      const { error } = await supabase
        .from("user_profiles")
        .update({ is_admin: true })
        .eq("user_id", userId);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-membros"] });
      toast.success("Usuário tornado admin com sucesso!");
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  // Mutation para remover admin
  const removeAdminMutation = useMutation({
    mutationFn: async (userId: string) => {
      const { error } = await supabase
        .from("user_profiles")
        .update({ is_admin: false })
        .eq("user_id", userId);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-membros"] });
      toast.success("Privilégios de admin removidos!");
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  const planColors = {
    essencial: "bg-green-500",
    completo: "bg-blue-500",
    premium: "bg-purple-500",
  };

  const filteredMembros = membros?.filter((membro) =>
    membro.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
    (membro as any).email?.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <Layout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold">Gerenciar Membros</h1>
          <p className="text-muted-foreground">
            Visualize e gerencie todos os membros da plataforma
          </p>
        </div>

        <div className="flex flex-col sm:flex-row gap-4">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              placeholder="Buscar por nome ou email..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10"
            />
          </div>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Lista de Membros</CardTitle>
            <CardDescription>
              {filteredMembros?.length || 0} membro(s) encontrado(s)
            </CardDescription>
          </CardHeader>
          <CardContent>
            {isLoading ? (
              <div className="text-center py-8 text-muted-foreground">
                Carregando membros...
              </div>
            ) : filteredMembros && filteredMembros.length > 0 ? (
              <div className="space-y-4">
                {filteredMembros.map((membro) => (
                  <div
                    key={membro.id}
                    className="flex items-center justify-between p-4 border rounded-lg hover:bg-muted/50 transition-colors"
                  >
                    <div className="flex-1">
                      <div className="flex items-center gap-2 mb-1">
                        <h3 className="font-semibold">{membro.nome}</h3>
                        <Badge
                          className={`text-xs ${
                            planColors[membro.plano as keyof typeof planColors] || "bg-gray-500"
                          }`}
                        >
                          {membro.plano}
                        </Badge>
                        {membro.is_admin && (
                          <Badge className="text-xs bg-purple-600">Admin</Badge>
                        )}
                      </div>
                      <p className="text-sm text-muted-foreground">
                        {(membro as any).email || `ID: ${membro.user_id.substring(0, 8)}...`}
                      </p>
                      <p className="text-xs text-muted-foreground mt-1">
                        Adesão: {new Date(membro.data_adesao).toLocaleDateString("pt-BR")}
                      </p>
                    </div>
                    <div className="flex gap-2">
                      {membro.is_admin ? (
                        <Button
                          size="sm"
                          variant="outline"
                          onClick={() => removeAdminMutation.mutate(membro.user_id)}
                          disabled={removeAdminMutation.isPending}
                        >
                          <ShieldOff className="h-4 w-4 mr-2" />
                          Remover Admin
                        </Button>
                      ) : (
                        <Button
                          size="sm"
                          variant="outline"
                          onClick={() => makeAdminMutation.mutate(membro.user_id)}
                          disabled={makeAdminMutation.isPending}
                        >
                          <Shield className="h-4 w-4 mr-2" />
                          Tornar Admin
                        </Button>
                      )}
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="text-center py-8 text-muted-foreground">
                Nenhum membro encontrado
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
}

