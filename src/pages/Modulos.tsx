import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { BookOpen, Clock, Lock } from "lucide-react";
import { Progress } from "@/components/ui/progress";

export default function Modulos() {
  const modules = [
    {
      id: 1,
      titulo: "Fundamentos de Inteligência Artificial",
      descricao: "Aprenda os conceitos básicos de IA e suas aplicações",
      aulas: 12,
      duracao: 360,
      plano: "essencial",
      progresso: 75,
    },
    {
      id: 2,
      titulo: "Machine Learning na Prática",
      descricao: "Desenvolva modelos de ML do zero",
      aulas: 15,
      duracao: 480,
      plano: "essencial",
      progresso: 30,
    },
    {
      id: 3,
      titulo: "Deep Learning Avançado",
      descricao: "Redes neurais profundas e suas aplicações",
      aulas: 20,
      duracao: 600,
      plano: "completo",
      progresso: 0,
    },
    {
      id: 4,
      titulo: "IA Generativa e GPT",
      descricao: "Domine modelos de linguagem e geração de conteúdo",
      aulas: 18,
      duracao: 540,
      plano: "completo",
      progresso: 0,
    },
    {
      id: 5,
      titulo: "Computer Vision Profissional",
      descricao: "Processamento de imagens e visão computacional",
      aulas: 25,
      duracao: 750,
      plano: "premium",
      progresso: 0,
    },
  ];

  const planColors = {
    essencial: "bg-green-500",
    completo: "bg-blue-500",
    premium: "bg-purple-500",
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

        <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
          {modules.map((module) => (
            <Card key={module.id} className="flex flex-col">
              <CardHeader>
                <div className="flex items-start justify-between gap-2">
                  <CardTitle className="text-lg">{module.titulo}</CardTitle>
                  <Badge className={planColors[module.plano as keyof typeof planColors]}>
                    {module.plano}
                  </Badge>
                </div>
                <CardDescription>{module.descricao}</CardDescription>
              </CardHeader>
              <CardContent className="flex-1 flex flex-col gap-4">
                <div className="space-y-2">
                  <div className="flex items-center gap-2 text-sm text-muted-foreground">
                    <BookOpen className="h-4 w-4" />
                    <span>{module.aulas} aulas</span>
                  </div>
                  <div className="flex items-center gap-2 text-sm text-muted-foreground">
                    <Clock className="h-4 w-4" />
                    <span>{Math.floor(module.duracao / 60)}h {module.duracao % 60}min</span>
                  </div>
                </div>

                {module.progresso > 0 && (
                  <div className="space-y-2">
                    <div className="flex justify-between text-sm">
                      <span className="text-muted-foreground">Progresso</span>
                      <span className="font-medium">{module.progresso}%</span>
                    </div>
                    <Progress value={module.progresso} className="h-2" />
                  </div>
                )}

                <Button className="w-full mt-auto" variant={module.progresso > 0 ? "default" : "outline"}>
                  {module.plano !== "essencial" ? (
                    <>
                      <Lock className="mr-2 h-4 w-4" />
                      Fazer upgrade
                    </>
                  ) : module.progresso > 0 ? (
                    "Continuar"
                  ) : (
                    "Começar"
                  )}
                </Button>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </Layout>
  );
}
