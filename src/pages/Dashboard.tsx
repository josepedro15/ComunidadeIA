import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { Button } from "@/components/ui/button";
import { BookOpen, Clock, CheckCircle2 } from "lucide-react";

export default function Dashboard() {
  const stats = [
    { label: "Módulos Concluídos", value: "3/10", icon: BookOpen },
    { label: "Horas de Estudo", value: "24h", icon: Clock },
    { label: "Aulas Finalizadas", value: "45/120", icon: CheckCircle2 },
  ];

  const recentModules = [
    { id: 1, title: "Fundamentos de IA", progress: 75, lessons: 12, completed: 9 },
    { id: 2, title: "Machine Learning Básico", progress: 30, lessons: 15, completed: 5 },
    { id: 3, title: "Deep Learning", progress: 10, lessons: 20, completed: 2 },
  ];

  return (
    <Layout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold">Dashboard</h1>
          <p className="text-muted-foreground">Bem-vindo de volta! Confira seu progresso.</p>
        </div>

        <div className="grid gap-4 md:grid-cols-3">
          {stats.map((stat, index) => (
            <Card key={index}>
              <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                <CardTitle className="text-sm font-medium">{stat.label}</CardTitle>
                <stat.icon className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <div className="text-2xl font-bold">{stat.value}</div>
              </CardContent>
            </Card>
          ))}
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Continue Aprendendo</CardTitle>
            <CardDescription>Retome seus estudos onde parou</CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            {recentModules.map((module) => (
              <div key={module.id} className="space-y-2">
                <div className="flex items-center justify-between">
                  <div>
                    <h3 className="font-semibold">{module.title}</h3>
                    <p className="text-sm text-muted-foreground">
                      {module.completed} de {module.lessons} aulas concluídas
                    </p>
                  </div>
                  <Button variant="outline" size="sm">Continuar</Button>
                </div>
                <Progress value={module.progress} className="h-2" />
              </div>
            ))}
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
}
