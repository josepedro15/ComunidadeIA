import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { Button } from "@/components/ui/button";
import { BookOpen, Clock, CheckCircle2 } from "lucide-react";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { useNavigate } from "react-router-dom";

export default function Dashboard() {
  const { user } = useAuth();
  const navigate = useNavigate();

  // Buscar estatísticas do usuário
  const { data: stats, isLoading: statsLoading } = useQuery({
    queryKey: ["dashboard-stats", user?.id],
    queryFn: async () => {
      if (!user) return null;

      // Buscar progresso do usuário
      const { data: progresso, error: progressoError } = await supabase
        .from("progresso_aulas")
        .select("aula_id, concluida, progresso")
        .eq("user_id", user.id);

      if (progressoError) throw progressoError;

      // Buscar todas as aulas para calcular totais
      const { data: todasAulas, error: aulasError } = await supabase
        .from("aulas")
        .select("id, duracao");

      if (aulasError) throw aulasError;

      // Buscar módulos
      const { data: modulos, error: modulosError } = await supabase
        .from("modulos")
        .select("id")
        .eq("ativo", true);

      if (modulosError) throw modulosError;

      // Calcular estatísticas
      const aulasConcluidas = progresso?.filter(p => p.concluida).length || 0;
      const totalAulas = todasAulas?.length || 0;
      const totalModulos = modulos?.length || 0;
      
      // Calcular módulos concluídos (módulos com todas as aulas concluídas)
      let modulosConcluidos = 0;
      if (modulos && todasAulas && progresso) {
        for (const modulo of modulos) {
          const aulasDoModulo = todasAulas.filter(a => 
            // Precisamos verificar se a aula pertence ao módulo
            // Por enquanto, vamos usar uma aproximação
            true
          );
          const progressoModulo = progresso.filter(p => 
            aulasDoModulo.some(a => a.id === p.aula_id)
          );
          if (progressoModulo.length > 0 && progressoModulo.every(p => p.concluida)) {
            modulosConcluidos++;
          }
        }
      }

      // Calcular horas de estudo (aproximação baseada em aulas concluídas)
      const horasEstudo = Math.round((aulasConcluidas * 1.5) / 60); // Assumindo 1.5h por aula em média

      return {
        modulosConcluidos,
        totalModulos,
        horasEstudo,
        aulasConcluidas,
        totalAulas,
      };
    },
    enabled: !!user,
  });

  // Buscar módulos recentes com progresso
  const { data: recentModules, isLoading: modulesLoading } = useQuery({
    queryKey: ["dashboard-modules", user?.id],
    queryFn: async () => {
      if (!user) return [];

      // Buscar módulos ativos
      const { data: modulos, error: modulosError } = await supabase
        .from("modulos")
        .select("id, titulo")
        .eq("ativo", true)
        .order("ordem", { ascending: true })
        .limit(3);

      if (modulosError) throw modulosError;

      // Buscar progresso para cada módulo
      const modulesWithProgress = await Promise.all(
        (modulos || []).map(async (modulo) => {
          // Buscar aulas do módulo
          const { data: aulas, error: aulasError } = await supabase
            .from("aulas")
            .select("id")
            .eq("modulo_id", modulo.id);

          if (aulasError) {
            console.error("Erro ao buscar aulas:", aulasError);
            return {
              id: modulo.id,
              title: modulo.titulo,
              progress: 0,
              lessons: 0,
              completed: 0,
            };
          }

          const aulasIds = aulas?.map(a => a.id) || [];

          if (aulasIds.length === 0) {
            return {
              id: modulo.id,
              title: modulo.titulo,
              progress: 0,
              lessons: 0,
              completed: 0,
            };
          }

          // Buscar progresso
          const { data: progresso, error: progressoError } = await supabase
            .from("progresso_aulas")
            .select("progresso, concluida")
            .eq("user_id", user.id)
            .in("aula_id", aulasIds);

          if (progressoError) {
            console.error("Erro ao buscar progresso:", progressoError);
            return {
              id: modulo.id,
              title: modulo.titulo,
              progress: 0,
              lessons: aulasIds.length,
              completed: 0,
            };
          }

          const totalAulas = aulasIds.length;
          const concluidas = progresso?.filter(p => p.concluida).length || 0;
          const progressoTotal = progresso?.reduce((acc, p) => acc + (p.progresso || 0), 0) || 0;
          const progressoPercent = totalAulas > 0 ? Math.round(progressoTotal / totalAulas) : 0;

          return {
            id: modulo.id,
            title: modulo.titulo,
            progress: progressoPercent,
            lessons: totalAulas,
            completed: concluidas,
          };
        })
      );

      return modulesWithProgress;
    },
    enabled: !!user,
  });

  return (
    <Layout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold">Dashboard</h1>
          <p className="text-muted-foreground">Bem-vindo de volta! Confira seu progresso.</p>
        </div>

        <div className="grid gap-4 md:grid-cols-3">
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Módulos Concluídos</CardTitle>
              <BookOpen className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">
                {statsLoading ? "..." : `${stats?.modulosConcluidos || 0}/${stats?.totalModulos || 0}`}
              </div>
            </CardContent>
          </Card>
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Horas de Estudo</CardTitle>
              <Clock className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">
                {statsLoading ? "..." : `${stats?.horasEstudo || 0}h`}
              </div>
            </CardContent>
          </Card>
          <Card>
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Aulas Finalizadas</CardTitle>
              <CheckCircle2 className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">
                {statsLoading ? "..." : `${stats?.aulasConcluidas || 0}/${stats?.totalAulas || 0}`}
              </div>
            </CardContent>
          </Card>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Continue Aprendendo</CardTitle>
            <CardDescription>Retome seus estudos onde parou</CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            {modulesLoading ? (
              <div className="text-center py-4 text-muted-foreground">
                Carregando módulos...
              </div>
            ) : recentModules && recentModules.length > 0 ? (
              recentModules.map((module) => (
                <div key={module.id} className="space-y-2">
                  <div className="flex items-center justify-between">
                    <div>
                      <h3 className="font-semibold">{module.title}</h3>
                      <p className="text-sm text-muted-foreground">
                        {module.completed} de {module.lessons} aulas concluídas
                      </p>
                    </div>
                    <Button 
                      variant="outline" 
                      size="sm"
                      onClick={() => navigate("/modulos")}
                    >
                      Continuar
                    </Button>
                  </div>
                  {module.progress > 0 && (
                    <Progress value={module.progress} className="h-2" />
                  )}
                </div>
              ))
            ) : (
              <div className="text-center py-4 text-muted-foreground">
                Nenhum módulo disponível. Explore os módulos para começar!
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
}
