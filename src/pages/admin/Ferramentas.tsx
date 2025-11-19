import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { Plus, Search, Edit, Trash2, ExternalLink } from "lucide-react";
import { useState } from "react";
import { useForm } from "react-hook-form";

type FerramentaFormData = {
  nome: string;
  descricao: string;
  categoria: string;
  preco: string;
  link: string;
  logo_url?: string;
  casos_uso?: string; // Será convertido para array
  ordem: number;
  ativo: boolean;
};

export default function FerramentasAdmin() {
  const [searchTerm, setSearchTerm] = useState("");
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const queryClient = useQueryClient();
  const { register, handleSubmit, reset, formState: { errors } } = useForm<FerramentaFormData>({
    defaultValues: {
      nome: "",
      descricao: "",
      categoria: "",
      preco: "Gratuito",
      link: "",
      logo_url: "",
      casos_uso: "",
      ordem: 0,
      ativo: true,
    },
  });

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

  // Mutation para criar ferramenta
  const createMutation = useMutation({
    mutationFn: async (data: FerramentaFormData) => {
      const casosUsoArray = data.casos_uso
        ? data.casos_uso.split(",").map((c) => c.trim()).filter((c) => c.length > 0)
        : [];

      const { error } = await supabase
        .from("ferramentas")
        .insert([{
          nome: data.nome,
          descricao: data.descricao,
          categoria: data.categoria,
          preco: data.preco,
          link: data.link,
          logo_url: data.logo_url || null,
          casos_uso: casosUsoArray.length > 0 ? casosUsoArray : null,
          ordem: data.ordem,
          ativo: data.ativo,
        }]);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-ferramentas"] });
      toast.success("Ferramenta criada com sucesso!");
      reset();
      setIsDialogOpen(false);
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

  const onSubmit = (data: FerramentaFormData) => {
    createMutation.mutate(data);
  };

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
          <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
            <DialogTrigger asChild>
              <Button>
                <Plus className="h-4 w-4 mr-2" />
                Nova Ferramenta
              </Button>
            </DialogTrigger>
            <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
              <DialogHeader>
                <DialogTitle>Criar Nova Ferramenta</DialogTitle>
                <DialogDescription>
                  Preencha os dados para adicionar uma nova ferramenta de IA.
                </DialogDescription>
              </DialogHeader>
              <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
                <div className="space-y-2">
                  <Label htmlFor="nome">Nome *</Label>
                  <Input
                    id="nome"
                    {...register("nome", { required: "Nome é obrigatório" })}
                    placeholder="Ex: ChatGPT"
                  />
                  {errors.nome && (
                    <p className="text-sm text-destructive">{errors.nome.message}</p>
                  )}
                </div>

                <div className="space-y-2">
                  <Label htmlFor="descricao">Descrição *</Label>
                  <Textarea
                    id="descricao"
                    {...register("descricao", { required: "Descrição é obrigatória" })}
                    placeholder="Descreva a ferramenta..."
                    rows={3}
                  />
                  {errors.descricao && (
                    <p className="text-sm text-destructive">{errors.descricao.message}</p>
                  )}
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <Label htmlFor="categoria">Categoria *</Label>
                    <Input
                      id="categoria"
                      {...register("categoria", { required: "Categoria é obrigatória" })}
                      placeholder="Ex: Texto"
                    />
                    {errors.categoria && (
                      <p className="text-sm text-destructive">{errors.categoria.message}</p>
                    )}
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="preco">Preço *</Label>
                    <select
                      id="preco"
                      {...register("preco", { required: "Preço é obrigatório" })}
                      className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                    >
                      <option value="Gratuito">Gratuito</option>
                      <option value="Freemium">Freemium</option>
                      <option value="Pago">Pago</option>
                    </select>
                  </div>
                </div>

                <div className="space-y-2">
                  <Label htmlFor="link">Link *</Label>
                  <Input
                    id="link"
                    type="url"
                    {...register("link", { required: "Link é obrigatório" })}
                    placeholder="https://..."
                  />
                  {errors.link && (
                    <p className="text-sm text-destructive">{errors.link.message}</p>
                  )}
                </div>

                <div className="space-y-2">
                  <Label htmlFor="logo_url">URL do Logo</Label>
                  <Input
                    id="logo_url"
                    type="url"
                    {...register("logo_url")}
                    placeholder="https://..."
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="casos_uso">Casos de Uso (separados por vírgula)</Label>
                  <Input
                    id="casos_uso"
                    {...register("casos_uso")}
                    placeholder="Ex: Geração de texto, Análise de dados, Tradução"
                  />
                  <p className="text-xs text-muted-foreground">
                    Separe múltiplos casos de uso com vírgulas
                  </p>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <Label htmlFor="ordem">Ordem</Label>
                    <Input
                      id="ordem"
                      type="number"
                      {...register("ordem", { valueAsNumber: true, min: 0 })}
                      placeholder="0"
                    />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="ativo">Status</Label>
                    <select
                      id="ativo"
                      {...register("ativo", { 
                        setValueAs: (v) => v === "true" 
                      })}
                      className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                      defaultValue="true"
                    >
                      <option value="true">Ativo</option>
                      <option value="false">Inativo</option>
                    </select>
                  </div>
                </div>

                <DialogFooter>
                  <Button
                    type="button"
                    variant="outline"
                    onClick={() => {
                      reset();
                      setIsDialogOpen(false);
                    }}
                  >
                    Cancelar
                  </Button>
                  <Button type="submit" disabled={createMutation.isPending}>
                    {createMutation.isPending ? "Criando..." : "Criar Ferramenta"}
                  </Button>
                </DialogFooter>
              </form>
            </DialogContent>
          </Dialog>
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

