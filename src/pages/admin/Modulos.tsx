import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { Plus, Search, Edit, Trash2, BookOpen, GraduationCap } from "lucide-react";
import { useState } from "react";

export default function ModulosAdmin() {
  const [searchTerm, setSearchTerm] = useState("");
  const queryClient = useQueryClient();

  // Buscar módulos
  const { data: modulos, isLoading } = useQuery({
    queryKey: ["admin-modulos"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("modulos")
        .select("*")
        .order("ordem", { ascending: true });

      if (error) throw error;
      return data;
    },
  });

  // Buscar contagem de aulas por módulo
  const { data: aulasCount } = useQuery({
    queryKey: ["admin-aulas-count", modulos?.map(m => m.id)],
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

  // Mutation para deletar
  const deleteMutation = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase
        .from("modulos")
        .delete()
        .eq("id", id);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-modulos"] });
      toast.success("Módulo deletado com sucesso!");
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  // Mutation para toggle ativo
  const toggleAtivoMutation = useMutation({
    mutationFn: async ({ id, ativo }: { id: string; ativo: boolean }) => {
      const { error } = await supabase
        .from("modulos")
        .update({ ativo: !ativo })
        .eq("id", id);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-modulos"] });
      toast.success("Status atualizado!");
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

  const filteredModulos = modulos?.filter((modulo) =>
    modulo.titulo.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <Layout>
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold">Gerenciar Módulos e Aulas</h1>
            <p className="text-muted-foreground">
              Gerencie os módulos de aprendizado e suas aulas
            </p>
          </div>
          <Button>
            <Plus className="h-4 w-4 mr-2" />
            Novo Módulo
          </Button>
        </div>

        <div className="flex flex-col sm:flex-row gap-4">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              placeholder="Buscar módulos..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10"
            />
          </div>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Lista de Módulos</CardTitle>
            <CardDescription>
              {filteredModulos?.length || 0} módulo(s) encontrado(s)
            </CardDescription>
          </CardHeader>
          <CardContent>
            {isLoading ? (
              <div className="text-center py-8 text-muted-foreground">
                Carregando módulos...
              </div>
            ) : filteredModulos && filteredModulos.length > 0 ? (
              <div className="space-y-4">
                {filteredModulos.map((modulo) => (
                  <div
                    key={modulo.id}
                    className="flex items-start justify-between p-4 border rounded-lg hover:bg-muted/50 transition-colors"
                  >
                    <div className="flex-1">
                      <div className="flex items-center gap-2 mb-2">
                        <h3 className="font-semibold">{modulo.titulo}</h3>
                        <Badge className={planColors[modulo.plano_minimo as keyof typeof planColors]}>
                          {modulo.plano_minimo}
                        </Badge>
                        <Badge variant={modulo.ativo ? "default" : "secondary"}>
                          {modulo.ativo ? "Ativo" : "Inativo"}
                        </Badge>
                      </div>
                      <p className="text-sm text-muted-foreground mb-2">
                        {modulo.descricao}
                      </p>
                      <div className="flex items-center gap-4 text-sm text-muted-foreground">
                        <div className="flex items-center gap-1">
                          <GraduationCap className="h-4 w-4" />
                          <span>{aulasCount?.[modulo.id] || 0} aulas</span>
                        </div>
                        <span>•</span>
                        <span>Ordem: {modulo.ordem}</span>
                      </div>
                    </div>
                    <div className="flex gap-2 ml-4">
                      <Button size="sm" variant="outline">
                        <BookOpen className="h-4 w-4 mr-1" />
                        Aulas
                      </Button>
                      <Button
                        size="sm"
                        variant="outline"
                        onClick={() => toggleAtivoMutation.mutate({ id: modulo.id, ativo: modulo.ativo })}
                        disabled={toggleAtivoMutation.isPending}
                      >
                        {modulo.ativo ? "Desativar" : "Ativar"}
                      </Button>
                      <Button size="sm" variant="outline">
                        <Edit className="h-4 w-4" />
                      </Button>
                      <Button
                        size="sm"
                        variant="destructive"
                        onClick={() => {
                          if (confirm("Tem certeza que deseja deletar este módulo? Todas as aulas serão deletadas também.")) {
                            deleteMutation.mutate(modulo.id);
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
                Nenhum módulo encontrado. Clique em "Novo Módulo" para criar o primeiro.
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
}

