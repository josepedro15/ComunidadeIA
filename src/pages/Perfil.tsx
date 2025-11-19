import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { toast } from "sonner";
import { useAuth } from "@/hooks/useAuth";
import { useState, useEffect } from "react";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useQuery } from "@tanstack/react-query";

export default function Perfil() {
  const { profile, isAdmin, user } = useAuth();
  const queryClient = useQueryClient();
  const [nome, setNome] = useState(profile?.nome || "");

  // Atualizar nome quando profile mudar
  useEffect(() => {
    if (profile?.nome) {
      setNome(profile.nome);
    }
  }, [profile?.nome]);

  // Buscar estatísticas reais
  const { data: stats } = useQuery({
    queryKey: ["perfil-stats", user?.id],
    queryFn: async () => {
      if (!user) return null;

      const { data: progresso } = await supabase
        .from("progresso_aulas")
        .select("aula_id, concluida")
        .eq("user_id", user.id);

      const { data: todasAulas } = await supabase
        .from("aulas")
        .select("id");

      const { data: modulos } = await supabase
        .from("modulos")
        .select("id")
        .eq("ativo", true);

      const aulasConcluidas = progresso?.filter(p => p.concluida).length || 0;
      const totalAulas = todasAulas?.length || 0;
      const totalModulos = modulos?.length || 0;
      const horasEstudo = Math.round((aulasConcluidas * 1.5) / 60);

      // Calcular módulos concluídos (simplificado)
      let modulosConcluidos = 0;
      // Lógica mais complexa seria necessária aqui

      return {
        aulasConcluidas,
        totalAulas,
        horasEstudo,
        modulosConcluidos,
        totalModulos,
      };
    },
    enabled: !!user,
  });

  // Mutation para atualizar perfil
  const updateMutation = useMutation({
    mutationFn: async (data: { nome: string }) => {
      if (!profile) throw new Error("Perfil não encontrado");

      const { error } = await supabase
        .from("user_profiles")
        .update({ nome: data.nome })
        .eq("user_id", profile.user_id);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-membros"] });
      toast.success("Perfil atualizado com sucesso!");
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  const handleSave = () => {
    if (!nome.trim()) {
      toast.error("O nome é obrigatório");
      return;
    }
    updateMutation.mutate({ nome });
  };

  const getInitials = (name: string) => {
    return name
      .split(" ")
      .map((n) => n[0])
      .join("")
      .toUpperCase()
      .slice(0, 2);
  };

  return (
    <Layout>
      <div className="space-y-6 max-w-2xl">
        <div>
          <h1 className="text-3xl font-bold">Meu Perfil</h1>
          <p className="text-muted-foreground">
            Gerencie suas informações pessoais e preferências
          </p>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Informações Pessoais</CardTitle>
            <CardDescription>Atualize seus dados pessoais</CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="flex items-center gap-4">
              <Avatar className="h-20 w-20">
                <AvatarImage src={profile?.foto_url || undefined} />
                <AvatarFallback>
                  {profile?.nome ? getInitials(profile.nome) : "U"}
                </AvatarFallback>
              </Avatar>
              <Button variant="outline" disabled>
                Alterar Foto
              </Button>
              <span className="text-xs text-muted-foreground">Em breve</span>
            </div>

            <div className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="nome">Nome Completo</Label>
                <Input 
                  id="nome" 
                  value={nome}
                  onChange={(e) => setNome(e.target.value)}
                  placeholder="Seu nome completo"
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="email">Email</Label>
                <Input 
                  id="email" 
                  type="email" 
                  value={user?.email || ""}
                  disabled
                  className="bg-muted"
                />
                <p className="text-xs text-muted-foreground">
                  O email não pode ser alterado aqui
                </p>
              </div>

              <Button 
                onClick={handleSave}
                disabled={updateMutation.isPending || !nome.trim()}
              >
                {updateMutation.isPending ? "Salvando..." : "Salvar Alterações"}
              </Button>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Plano Atual</CardTitle>
            <CardDescription>Informações sobre sua assinatura</CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="flex items-center justify-between">
              <div>
                <div className="flex items-center gap-2 mb-1">
                  <p className="font-semibold">Plano {profile?.plano || "Essencial"}</p>
                  {isAdmin && (
                    <Badge className="bg-purple-600">Admin</Badge>
                  )}
                </div>
                <p className="text-sm text-muted-foreground">
                  {profile?.plano === "essencial" && "Acesso a módulos básicos"}
                  {profile?.plano === "completo" && "Acesso a módulos completos"}
                  {profile?.plano === "premium" && "Acesso completo a todos os módulos"}
                </p>
              </div>
              <Badge className="bg-green-500">Ativo</Badge>
            </div>

            <div className="space-y-2 pt-4 border-t">
              <p className="text-sm font-medium">Benefícios incluídos:</p>
              <ul className="text-sm text-muted-foreground space-y-1">
                <li>✓ Acesso a módulos essenciais</li>
                <li>✓ Biblioteca de prompts básica</li>
                <li>✓ Ferramentas de IA gratuitas</li>
                <li>✓ Gravações de lives</li>
              </ul>
            </div>

            <Button variant="outline" className="w-full">
              Fazer Upgrade
            </Button>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Estatísticas</CardTitle>
            <CardDescription>Seu progresso na plataforma</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid gap-4 md:grid-cols-2">
              <div className="space-y-1">
                <p className="text-sm text-muted-foreground">Total de Aulas</p>
                <p className="text-2xl font-bold">
                  {stats ? `${stats.aulasConcluidas}/${stats.totalAulas}` : "0/0"}
                </p>
              </div>
              <div className="space-y-1">
                <p className="text-sm text-muted-foreground">Horas de Estudo</p>
                <p className="text-2xl font-bold">
                  {stats ? `${stats.horasEstudo}h` : "0h"}
                </p>
              </div>
              <div className="space-y-1">
                <p className="text-sm text-muted-foreground">Módulos Completos</p>
                <p className="text-2xl font-bold">
                  {stats ? `${stats.modulosConcluidos}/${stats.totalModulos}` : "0/0"}
                </p>
              </div>
              <div className="space-y-1">
                <p className="text-sm text-muted-foreground">Data de Adesão</p>
                <p className="text-2xl font-bold text-sm">
                  {profile?.data_adesao 
                    ? new Date(profile.data_adesao).toLocaleDateString("pt-BR")
                    : "N/A"}
                </p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
}
