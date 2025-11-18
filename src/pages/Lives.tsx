import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Calendar, Clock, Video, ExternalLink } from "lucide-react";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";

export default function Lives() {
  const lives = [
    {
      id: 1,
      titulo: "Introdução ao GPT-4 e suas aplicações",
      descricao: "Aprenda a usar o GPT-4 de forma eficiente em projetos reais",
      data: "2024-03-25",
      horario: "19:00",
      status: "agendada",
      plataforma: "meet",
      link: "https://meet.google.com/abc-defg-hij",
    },
    {
      id: 2,
      titulo: "Workshop: Fine-tuning de Modelos",
      descricao: "Técnicas avançadas de ajuste fino de modelos de IA",
      data: "2024-03-20",
      horario: "20:00",
      status: "concluida",
      plataforma: "zoom",
      linkGravacao: "https://youtube.com/watch?v=example",
    },
    {
      id: 3,
      titulo: "Q&A: Carreira em IA",
      descricao: "Tire suas dúvidas sobre como construir uma carreira em IA",
      data: "2024-03-22",
      horario: "18:30",
      status: "concluida",
      plataforma: "meet",
      linkGravacao: "https://youtube.com/watch?v=example2",
    },
    {
      id: 4,
      titulo: "Deep Learning na Prática",
      descricao: "Construindo redes neurais do zero",
      data: "2024-03-28",
      horario: "19:30",
      status: "agendada",
      plataforma: "meet",
      link: "https://meet.google.com/xyz-uvwx-rst",
    },
  ];

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

  const livesAgendadas = lives.filter((l) => l.status === "agendada");
  const livesConcluidas = lives.filter((l) => l.status === "concluida");

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
            <div className="grid gap-6 md:grid-cols-2">
              {livesAgendadas.map((live) => (
                <Card key={live.id}>
                  <CardHeader>
                    <div className="flex items-start justify-between gap-2">
                      <CardTitle className="text-lg">{live.titulo}</CardTitle>
                      <Badge className={statusColors[live.status as keyof typeof statusColors]}>
                        {statusLabels[live.status as keyof typeof statusLabels]}
                      </Badge>
                    </div>
                    <CardDescription>{live.descricao}</CardDescription>
                  </CardHeader>
                  <CardContent className="space-y-4">
                    <div className="space-y-2">
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <Calendar className="h-4 w-4" />
                        <span>{new Date(live.data).toLocaleDateString('pt-BR')}</span>
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
                    <Button className="w-full" asChild>
                      <a href={live.link} target="_blank" rel="noopener noreferrer">
                        Entrar na Live
                        <ExternalLink className="ml-2 h-4 w-4" />
                      </a>
                    </Button>
                  </CardContent>
                </Card>
              ))}
            </div>
          </TabsContent>

          <TabsContent value="gravacoes" className="space-y-4 mt-6">
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
                    <CardDescription>{live.descricao}</CardDescription>
                  </CardHeader>
                  <CardContent className="space-y-4">
                    <div className="space-y-2">
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <Calendar className="h-4 w-4" />
                        <span>{new Date(live.data).toLocaleDateString('pt-BR')}</span>
                      </div>
                    </div>
                    <Button className="w-full" variant="outline" asChild>
                      <a href={live.linkGravacao} target="_blank" rel="noopener noreferrer">
                        Assistir Gravação
                        <ExternalLink className="ml-2 h-4 w-4" />
                      </a>
                    </Button>
                  </CardContent>
                </Card>
              ))}
            </div>
          </TabsContent>
        </Tabs>
      </div>
    </Layout>
  );
}
