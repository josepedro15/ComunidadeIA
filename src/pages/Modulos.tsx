import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { BookOpen, Clock, Lock } from "lucide-react";
import { Progress } from "@/components/ui/progress";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { useNavigate } from "react-router-dom";

export default function Modulos() {
  const { user, profile } = useAuth();
  const navigate = useNavigate();

  // Buscar módulos do banco
  const { data: modulos, isLoading } = useQuery({
    queryKey: ["modulos", profile?.plano],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("modulos")
        .select("*")
        .eq("ativo", true)
        .order("ordem", { ascending: true });

      if (error) throw error;
      return data;
    },
    enabled: !!profile,
  });

  // Buscar contagem de aulas por módulo
  const { data: aulasCount } = useQuery({
    queryKey: ["aulas-count", modulos?.map(m => m.id)],
    queryFn: async () => {
      if (!modulos || modulos.length === 0) return {};
      
      const counts: Record<string, number> = {};
      await Promise.all(
        modulos.map(async (modulo) => {
          const { count } = await supabase
            .from("aulas")
            .select("id", { count: "exact", head: true })
            .eq("modulo_id", modulo.id);
          counts[modulo.id] = count || 0;
        })
      );
      return counts;
    },
    enabled: !!modulos && modulos.length > 0,
  });

  // Buscar progresso do usuário
  const { data: progresso } = useQuery({
    queryKey: ["progresso-modulos", user?.id],
    queryFn: async () => {
      if (!user) return {};
      
      const { data, error } = await supabase
        .from("progresso_aulas")
        .select("aula_id, progresso, concluida")
        .eq("user_id", user.id);

      if (error) throw error;
      
      // Agrupar por módulo
      const progressoPorModulo: Record<string, { total: number; concluidas: number; progressoTotal: number }> = {};
      
      if (data && modulos) {
        await Promise.all(
          modulos.map(async (modulo) => {
            const { data: aulas } = await supabase
              .from("aulas")
              .select("id")
              .eq("modulo_id", modulo.id);
            
            const aulasIds = aulas?.map(a => a.id) || [];
            const progressoModulo = data.filter(p => aulasIds.includes(p.aula_id));
            
            const concluidas = progressoModulo.filter(p => p.concluida).length;
            const progressoTotal = progressoModulo.reduce((acc, p) => acc + p.progresso, 0);
            const total = progressoModulo.length;
            
            progressoPorModulo[modulo.id] = {
              total,
              concluidas,
              progressoTotal: total > 0 ? Math.round(progressoTotal / total) : 0,
            };
          })
        );
      }
      
      return progressoPorModulo;
    },
    enabled: !!user && !!modulos && modulos.length > 0,
  });

  const planColors = {
    essencial: "bg-green-500",
    completo: "bg-blue-500",
    premium: "bg-purple-500",
  };

  // Verificar se o usuário tem acesso ao módulo baseado no plano
  const hasAccess = (planoMinimo: string) => {
    if (!profile) return false;
    const planos = ["essencial", "completo", "premium"];
    const userPlanoIndex = planos.indexOf(profile.plano);
    const requiredPlanoIndex = planos.indexOf(planoMinimo);
    return userPlanoIndex >= requiredPlanoIndex;
  };

  return (
    <Layout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold">Módulos de Aprendizado</h1>
          <p className="text-muted-foreground">
            Explore todos os módulos disponíveis e comece sua jornada
          </p>
        </div>

        {isLoading ? (
          <div className="text-center py-8 text-muted-foreground">
            Carregando módulos...
          </div>
        ) : modulos && modulos.length > 0 ? (
          <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
            {modulos.map((modulo) => {
              const numAulas = aulasCount?.[modulo.id] || 0;
              const progressoModulo = progresso?.[modulo.id];
              const progressoPercent = progressoModulo?.progressoTotal || 0;
              const temAcesso = hasAccess(modulo.plano_minimo);
              
              return (
                <Card key={modulo.id} className="flex flex-col">
                  <CardHeader>
                    <div className="flex items-start justify-between gap-2">
                      <CardTitle className="text-lg">{modulo.titulo}</CardTitle>
                      <Badge className={planColors[modulo.plano_minimo as keyof typeof planColors]}>
                        {modulo.plano_minimo}
                      </Badge>
                    </div>
                    <CardDescription>{modulo.descricao}</CardDescription>
                  </CardHeader>
                  <CardContent className="flex-1 flex flex-col gap-4">
                    <div className="space-y-2">
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <BookOpen className="h-4 w-4" />
                        <span>{numAulas} aulas</span>
                      </div>
                    </div>

                    {progressoPercent > 0 && (
                      <div className="space-y-2">
                        <div className="flex justify-between text-sm">
                          <span className="text-muted-foreground">Progresso</span>
                          <span className="font-medium">{progressoPercent}%</span>
                        </div>
                        <Progress value={progressoPercent} className="h-2" />
                      </div>
                    )}

                    <Button 
                      className="w-full mt-auto" 
                      variant={progressoPercent > 0 ? "default" : "outline"}
                      disabled={!temAcesso}
                      onClick={() => {
                        if (temAcesso) {
                          navigate(`/modulos/${modulo.id}`);
                        }
                      }}
                    >
                      {!temAcesso ? (
                        <>
                          <Lock className="mr-2 h-4 w-4" />
                          Fazer upgrade
                        </>
                      ) : progressoPercent > 0 ? (
                        "Continuar"
                      ) : (
                        "Começar"
                      )}
                    </Button>
                  </CardContent>
                </Card>
              );
            })}
          </div>
        ) : (
          <div className="text-center py-8 text-muted-foreground">
            Nenhum módulo disponível no momento.
          </div>
        )}
      </div>
    </Layout>
  );
}
