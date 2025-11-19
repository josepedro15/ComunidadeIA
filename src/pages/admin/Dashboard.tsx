import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Users, BookOpen, FileText, Video, TrendingUp } from "lucide-react";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

export default function AdminDashboard() {
  // Buscar estatísticas
  const { data: stats, isLoading } = useQuery({
    queryKey: ["admin-stats"],
    queryFn: async () => {
      const [usersResult, modulosResult, promptsResult, livesResult] = await Promise.all([
        supabase.from("user_profiles").select("id", { count: "exact" }),
        supabase.from("modulos").select("id", { count: "exact" }),
        supabase.from("prompts").select("id", { count: "exact" }),
        supabase.from("lives").select("id", { count: "exact" }),
      ]);

      return {
        totalUsuarios: usersResult.count || 0,
        totalModulos: modulosResult.count || 0,
        totalPrompts: promptsResult.count || 0,
        totalLives: livesResult.count || 0,
      };
    },
  });

  const statsCards = [
    {
      title: "Total de Usuários",
      value: stats?.totalUsuarios || 0,
      icon: Users,
      description: "Membros cadastrados",
    },
    {
      title: "Módulos",
      value: stats?.totalModulos || 0,
      icon: BookOpen,
      description: "Módulos disponíveis",
    },
    {
      title: "Prompts",
      value: stats?.totalPrompts || 0,
      icon: FileText,
      description: "Prompts na biblioteca",
    },
    {
      title: "Lives",
      value: stats?.totalLives || 0,
      icon: Video,
      description: "Lives cadastradas",
    },
  ];

  return (
    <Layout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold">Dashboard Administrativo</h1>
          <p className="text-muted-foreground">
            Visão geral da plataforma e estatísticas
          </p>
        </div>

        <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
          {statsCards.map((stat, index) => (
            <Card key={index}>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">{stat.title}</CardTitle>
                <stat.icon className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">
                  {isLoading ? "..." : stat.value}
                </div>
                <p className="text-xs text-muted-foreground">{stat.description}</p>
              </CardContent>
            </Card>
          ))}
        </div>

        <div className="grid gap-4 md:grid-cols-2">
          <Card>
            <CardHeader>
              <CardTitle>Ações Rápidas</CardTitle>
              <CardDescription>Gerenciamento rápido da plataforma</CardDescription>
            </CardHeader>
            <CardContent className="space-y-2">
              <p className="text-sm text-muted-foreground">
                Use o menu lateral para acessar as áreas de gerenciamento:
              </p>
              <ul className="text-sm space-y-1 list-disc list-inside text-muted-foreground">
                <li>Gerenciar Membros</li>
                <li>Gerenciar Módulos e Aulas</li>
                <li>Gerenciar Prompts</li>
                <li>Gerenciar Lives</li>
                <li>Gerenciar Ferramentas</li>
              </ul>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Status do Sistema</CardTitle>
              <CardDescription>Informações sobre a plataforma</CardDescription>
            </CardHeader>
            <CardContent className="space-y-2">
              <div className="flex items-center justify-between">
                <span className="text-sm">Status</span>
                <span className="text-sm font-medium text-green-600">Online</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-sm">Versão</span>
                <span className="text-sm font-medium">1.0.0</span>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </Layout>
  );
}

