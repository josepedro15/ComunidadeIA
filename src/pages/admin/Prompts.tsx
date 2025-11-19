import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { Plus, Search, Edit, Trash2 } from "lucide-react";
import { useState } from "react";

export default function PromptsAdmin() {
  const [searchTerm, setSearchTerm] = useState("");
  const queryClient = useQueryClient();

  // Buscar prompts
  const { data: prompts, isLoading } = useQuery({
    queryKey: ["admin-prompts"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("prompts")
        .select("*")
        .order("ordem", { ascending: true });

      if (error) throw error;
      return data;
    },
  });

  // Mutation para deletar
  const deleteMutation = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase
        .from("prompts")
        .delete()
        .eq("id", id);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-prompts"] });
      toast.success("Prompt deletado com sucesso!");
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  // Mutation para toggle ativo
  const toggleAtivoMutation = useMutation({
    mutationFn: async ({ id, ativo }: { id: string; ativo: boolean }) => {
      const { error } = await supabase
        .from("prompts")
        .update({ ativo: !ativo })
        .eq("id", id);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-prompts"] });
      toast.success("Status atualizado!");
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  const filteredPrompts = prompts?.filter((prompt) =>
    prompt.titulo.toLowerCase().includes(searchTerm.toLowerCase()) ||
    prompt.categoria.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <Layout>
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold">Gerenciar Prompts</h1>
            <p className="text-muted-foreground">
              Gerencie a biblioteca de prompts da plataforma
            </p>
          </div>
          <Button>
            <Plus className="h-4 w-4 mr-2" />
            Novo Prompt
          </Button>
        </div>

        <div className="flex flex-col sm:flex-row gap-4">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              placeholder="Buscar prompts..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10"
            />
          </div>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Lista de Prompts</CardTitle>
            <CardDescription>
              {filteredPrompts?.length || 0} prompt(s) encontrado(s)
            </CardDescription>
          </CardHeader>
          <CardContent>
            {isLoading ? (
              <div className="text-center py-8 text-muted-foreground">
                Carregando prompts...
              </div>
            ) : filteredPrompts && filteredPrompts.length > 0 ? (
              <div className="space-y-4">
                {filteredPrompts.map((prompt) => (
                  <div
                    key={prompt.id}
                    className="flex items-start justify-between p-4 border rounded-lg hover:bg-muted/50 transition-colors"
                  >
                    <div className="flex-1">
                      <div className="flex items-center gap-2 mb-2">
                        <h3 className="font-semibold">{prompt.titulo}</h3>
                        <Badge>{prompt.categoria}</Badge>
                        {prompt.subcategoria && (
                          <Badge variant="outline">{prompt.subcategoria}</Badge>
                        )}
                        <Badge variant={prompt.ativo ? "default" : "secondary"}>
                          {prompt.ativo ? "Ativo" : "Inativo"}
                        </Badge>
                      </div>
                      <p className="text-sm text-muted-foreground line-clamp-2">
                        {prompt.conteudo}
                      </p>
                      <p className="text-xs text-muted-foreground mt-2">
                        Ordem: {prompt.ordem} | Criado em: {new Date(prompt.created_at).toLocaleDateString("pt-BR")}
                      </p>
                    </div>
                    <div className="flex gap-2 ml-4">
                      <Button
                        size="sm"
                        variant="outline"
                        onClick={() => toggleAtivoMutation.mutate({ id: prompt.id, ativo: prompt.ativo })}
                        disabled={toggleAtivoMutation.isPending}
                      >
                        {prompt.ativo ? "Desativar" : "Ativar"}
                      </Button>
                      <Button size="sm" variant="outline">
                        <Edit className="h-4 w-4" />
                      </Button>
                      <Button
                        size="sm"
                        variant="destructive"
                        onClick={() => {
                          if (confirm("Tem certeza que deseja deletar este prompt?")) {
                            deleteMutation.mutate(prompt.id);
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
                Nenhum prompt encontrado. Clique em "Novo Prompt" para criar o primeiro.
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
}

