import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Calendar, Clock, Video, ExternalLink } from "lucide-react";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

export default function Lives() {
  // Buscar lives do banco
  const { data: lives, isLoading } = useQuery({
    queryKey: ["lives"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("lives")
        .select("*")
        .order("data_agendada", { ascending: false });

      if (error) throw error;
      return data;
    },
  });

  const statusColors = {
    agendada: "bg-blue-500",
    ao_vivo: "bg-red-500",
    concluida: "bg-gray-500",
    cancelada: "bg-yellow-500",
  };

  const statusLabels = {
    agendada: "Agendada",
    ao_vivo: "Ao Vivo",
    concluida: "Concluída",
    cancelada: "Cancelada",
  };

  const livesAgendadas = lives?.filter((l) => l.status === "agendada" || l.status === "ao_vivo") || [];
  const livesConcluidas = lives?.filter((l) => l.status === "concluida") || [];

  return (
    <Layout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold">Lives e Eventos</h1>
          <p className="text-muted-foreground">
            Participe de lives ao vivo e assista gravações anteriores
          </p>
        </div>

        <Tabs defaultValue="agendadas" className="w-full">
          <TabsList>
            <TabsTrigger value="agendadas">Agendadas ({livesAgendadas.length})</TabsTrigger>
            <TabsTrigger value="gravacoes">Gravações ({livesConcluidas.length})</TabsTrigger>
          </TabsList>

          <TabsContent value="agendadas" className="space-y-4 mt-6">
            {isLoading ? (
              <div className="text-center py-8 text-muted-foreground">
                Carregando lives...
              </div>
            ) : livesAgendadas.length > 0 ? (
              <div className="grid gap-6 md:grid-cols-2">
                {livesAgendadas.map((live) => {
                  const link = live.plataforma === "meet" ? live.link_meet : live.link_zoom;
                  return (
                    <Card key={live.id}>
                      <CardHeader>
                        <div className="flex items-start justify-between gap-2">
                          <CardTitle className="text-lg">{live.titulo}</CardTitle>
                          <Badge className={statusColors[live.status as keyof typeof statusColors]}>
                            {statusLabels[live.status as keyof typeof statusLabels]}
                          </Badge>
                        </div>
                        {live.descricao && <CardDescription>{live.descricao}</CardDescription>}
                      </CardHeader>
                      <CardContent className="space-y-4">
                        <div className="space-y-2">
                          <div className="flex items-center gap-2 text-sm text-muted-foreground">
                            <Calendar className="h-4 w-4" />
                            <span>{new Date(live.data_agendada).toLocaleDateString('pt-BR')}</span>
                          </div>
                          <div className="flex items-center gap-2 text-sm text-muted-foreground">
                            <Clock className="h-4 w-4" />
                            <span>{live.horario}</span>
                          </div>
                          <div className="flex items-center gap-2 text-sm text-muted-foreground">
                            <Video className="h-4 w-4" />
                            <span className="capitalize">{live.plataforma}</span>
                          </div>
                        </div>
                        {link && (
                          <Button className="w-full" asChild>
                            <a href={link} target="_blank" rel="noopener noreferrer">
                              Entrar na Live
                              <ExternalLink className="ml-2 h-4 w-4" />
                            </a>
                          </Button>
                        )}
                      </CardContent>
                    </Card>
                  );
                })}
              </div>
            ) : (
              <div className="text-center py-8 text-muted-foreground">
                Nenhuma live agendada no momento.
              </div>
            )}
          </TabsContent>

          <TabsContent value="gravacoes" className="space-y-4 mt-6">
            {isLoading ? (
              <div className="text-center py-8 text-muted-foreground">
                Carregando gravações...
              </div>
            ) : livesConcluidas.length > 0 ? (
              <div className="grid gap-6 md:grid-cols-2">
                {livesConcluidas.map((live) => (
                  <Card key={live.id}>
                    <CardHeader>
                      <div className="flex items-start justify-between gap-2">
                        <CardTitle className="text-lg">{live.titulo}</CardTitle>
                        <Badge className={statusColors[live.status as keyof typeof statusColors]}>
                          {statusLabels[live.status as keyof typeof statusLabels]}
                        </Badge>
                      </div>
                      {live.descricao && <CardDescription>{live.descricao}</CardDescription>}
                    </CardHeader>
                    <CardContent className="space-y-4">
                      <div className="space-y-2">
                        <div className="flex items-center gap-2 text-sm text-muted-foreground">
                          <Calendar className="h-4 w-4" />
                          <span>{new Date(live.data_agendada).toLocaleDateString('pt-BR')}</span>
                        </div>
                      </div>
                      {live.link_gravacao && (
                        <Button className="w-full" variant="outline" asChild>
                          <a href={live.link_gravacao} target="_blank" rel="noopener noreferrer">
                            Assistir Gravação
                            <ExternalLink className="ml-2 h-4 w-4" />
                          </a>
                        </Button>
                      )}
                    </CardContent>
                  </Card>
                ))}
              </div>
            ) : (
              <div className="text-center py-8 text-muted-foreground">
                Nenhuma gravação disponível.
              </div>
            )}
          </TabsContent>
        </Tabs>
      </div>
    </Layout>
  );
}
