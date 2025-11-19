import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { Plus, Search, Edit, Trash2, Calendar, Clock } from "lucide-react";
import { useState } from "react";

export default function LivesAdmin() {
  const [searchTerm, setSearchTerm] = useState("");
  const queryClient = useQueryClient();

  // Buscar lives
  const { data: lives, isLoading } = useQuery({
    queryKey: ["admin-lives"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("lives")
        .select("*")
        .order("data_agendada", { ascending: false });

      if (error) throw error;
      return data;
    },
  });

  // Mutation para deletar
  const deleteMutation = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase
        .from("lives")
        .delete()
        .eq("id", id);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-lives"] });
      toast.success("Live deletada com sucesso!");
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
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

  const filteredLives = lives?.filter((live) =>
    live.titulo.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <Layout>
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold">Gerenciar Lives</h1>
            <p className="text-muted-foreground">
              Gerencie as lives e eventos da plataforma
            </p>
          </div>
          <Button>
            <Plus className="h-4 w-4 mr-2" />
            Nova Live
          </Button>
        </div>

        <div className="flex flex-col sm:flex-row gap-4">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              placeholder="Buscar lives..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10"
            />
          </div>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Lista de Lives</CardTitle>
            <CardDescription>
              {filteredLives?.length || 0} live(s) encontrada(s)
            </CardDescription>
          </CardHeader>
          <CardContent>
            {isLoading ? (
              <div className="text-center py-8 text-muted-foreground">
                Carregando lives...
              </div>
            ) : filteredLives && filteredLives.length > 0 ? (
              <div className="space-y-4">
                {filteredLives.map((live) => (
                  <div
                    key={live.id}
                    className="flex items-start justify-between p-4 border rounded-lg hover:bg-muted/50 transition-colors"
                  >
                    <div className="flex-1">
                      <div className="flex items-center gap-2 mb-2">
                        <h3 className="font-semibold">{live.titulo}</h3>
                        <Badge className={statusColors[live.status as keyof typeof statusColors]}>
                          {statusLabels[live.status as keyof typeof statusLabels]}
                        </Badge>
                        <Badge variant="outline" className="capitalize">
                          {live.plataforma}
                        </Badge>
                      </div>
                      {live.descricao && (
                        <p className="text-sm text-muted-foreground mb-2">
                          {live.descricao}
                        </p>
                      )}
                      <div className="flex items-center gap-4 text-sm text-muted-foreground">
                        <div className="flex items-center gap-1">
                          <Calendar className="h-4 w-4" />
                          <span>{new Date(live.data_agendada).toLocaleDateString("pt-BR")}</span>
                        </div>
                        <div className="flex items-center gap-1">
                          <Clock className="h-4 w-4" />
                          <span>{live.horario}</span>
                        </div>
                      </div>
                    </div>
                    <div className="flex gap-2 ml-4">
                      <Button size="sm" variant="outline">
                        <Edit className="h-4 w-4" />
                      </Button>
                      <Button
                        size="sm"
                        variant="destructive"
                        onClick={() => {
                          if (confirm("Tem certeza que deseja deletar esta live?")) {
                            deleteMutation.mutate(live.id);
                          }
                        }}
                        disabled={deleteMutation.isPending}
                      >
                        <Trash2 className="h-4 w-4" />
                      </Button>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="text-center py-8 text-muted-foreground">
                Nenhuma live encontrada. Clique em "Nova Live" para criar a primeira.
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
}

