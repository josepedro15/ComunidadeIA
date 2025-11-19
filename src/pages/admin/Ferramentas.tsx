import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { Plus, Search, Edit, Trash2, ExternalLink } from "lucide-react";
import { useState } from "react";

export default function FerramentasAdmin() {
  const [searchTerm, setSearchTerm] = useState("");
  const queryClient = useQueryClient();

  // Buscar ferramentas
  const { data: ferramentas, isLoading } = useQuery({
    queryKey: ["admin-ferramentas"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("ferramentas")
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
        .from("ferramentas")
        .delete()
        .eq("id", id);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-ferramentas"] });
      toast.success("Ferramenta deletada com sucesso!");
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  // Mutation para toggle ativo
  const toggleAtivoMutation = useMutation({
    mutationFn: async ({ id, ativo }: { id: string; ativo: boolean }) => {
      const { error } = await supabase
        .from("ferramentas")
        .update({ ativo: !ativo })
        .eq("id", id);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-ferramentas"] });
      toast.success("Status atualizado!");
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  const filteredFerramentas = ferramentas?.filter((ferramenta) =>
    ferramenta.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
    ferramenta.categoria.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <Layout>
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold">Gerenciar Ferramentas</h1>
            <p className="text-muted-foreground">
              Gerencie as ferramentas de IA recomendadas
            </p>
          </div>
          <Button>
            <Plus className="h-4 w-4 mr-2" />
            Nova Ferramenta
          </Button>
        </div>

        <div className="flex flex-col sm:flex-row gap-4">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              placeholder="Buscar ferramentas..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10"
            />
          </div>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Lista de Ferramentas</CardTitle>
            <CardDescription>
              {filteredFerramentas?.length || 0} ferramenta(s) encontrada(s)
            </CardDescription>
          </CardHeader>
          <CardContent>
            {isLoading ? (
              <div className="text-center py-8 text-muted-foreground">
                Carregando ferramentas...
              </div>
            ) : filteredFerramentas && filteredFerramentas.length > 0 ? (
              <div className="space-y-4">
                {filteredFerramentas.map((ferramenta) => (
                  <div
                    key={ferramenta.id}
                    className="flex items-start justify-between p-4 border rounded-lg hover:bg-muted/50 transition-colors"
                  >
                    <div className="flex-1">
                      <div className="flex items-center gap-2 mb-2">
                        <h3 className="font-semibold">{ferramenta.nome}</h3>
                        <Badge>{ferramenta.categoria}</Badge>
                        <Badge variant="outline">{ferramenta.preco}</Badge>
                        <Badge variant={ferramenta.ativo ? "default" : "secondary"}>
                          {ferramenta.ativo ? "Ativo" : "Inativo"}
                        </Badge>
                      </div>
                      <p className="text-sm text-muted-foreground mb-2">
                        {ferramenta.descricao}
                      </p>
                      {ferramenta.casos_uso && ferramenta.casos_uso.length > 0 && (
                        <div className="flex flex-wrap gap-1 mb-2">
                          {ferramenta.casos_uso.map((caso, idx) => (
                            <Badge key={idx} variant="secondary" className="text-xs">
                              {caso}
                            </Badge>
                          ))}
                        </div>
                      )}
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <a
                          href={ferramenta.link}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="flex items-center gap-1 text-primary hover:underline"
                        >
                          <ExternalLink className="h-3 w-3" />
                          Ver ferramenta
                        </a>
                        <span>•</span>
                        <span>Ordem: {ferramenta.ordem}</span>
                      </div>
                    </div>
                    <div className="flex gap-2 ml-4">
                      <Button
                        size="sm"
                        variant="outline"
                        onClick={() => toggleAtivoMutation.mutate({ id: ferramenta.id, ativo: ferramenta.ativo })}
                        disabled={toggleAtivoMutation.isPending}
                      >
                        {ferramenta.ativo ? "Desativar" : "Ativar"}
                      </Button>
                      <Button size="sm" variant="outline">
                        <Edit className="h-4 w-4" />
                      </Button>
                      <Button
                        size="sm"
                        variant="destructive"
                        onClick={() => {
                          if (confirm("Tem certeza que deseja deletar esta ferramenta?")) {
                            deleteMutation.mutate(ferramenta.id);
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
                Nenhuma ferramenta encontrada. Clique em "Nova Ferramenta" para criar a primeira.
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
}

