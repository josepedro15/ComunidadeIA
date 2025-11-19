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
import { Plus, Search, Edit, Trash2, Calendar, Clock } from "lucide-react";
import { useState } from "react";
import { useForm } from "react-hook-form";

type LiveFormData = {
  titulo: string;
  descricao?: string;
  data_agendada: string;
  horario: string;
  status: "agendada" | "ao_vivo" | "concluida" | "cancelada";
  plataforma: string;
  link_meet?: string;
  link_zoom?: string;
  link_gravacao?: string;
};

export default function LivesAdmin() {
  const [searchTerm, setSearchTerm] = useState("");
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const queryClient = useQueryClient();
  const { register, handleSubmit, reset, formState: { errors } } = useForm<LiveFormData>({
    defaultValues: {
      titulo: "",
      descricao: "",
      data_agendada: "",
      horario: "",
      status: "agendada",
      plataforma: "meet",
      link_meet: "",
      link_zoom: "",
      link_gravacao: "",
    },
  });

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

  // Mutation para criar live
  const createMutation = useMutation({
    mutationFn: async (data: LiveFormData) => {
      const { error } = await supabase
        .from("lives")
        .insert([{
          titulo: data.titulo,
          descricao: data.descricao || null,
          data_agendada: data.data_agendada,
          horario: data.horario,
          status: data.status,
          plataforma: data.plataforma,
          link_meet: data.link_meet || null,
          link_zoom: data.link_zoom || null,
          link_gravacao: data.link_gravacao || null,
        }]);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-lives"] });
      toast.success("Live criada com sucesso!");
      reset();
      setIsDialogOpen(false);
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
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

  const onSubmit = (data: LiveFormData) => {
    createMutation.mutate(data);
  };

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
          <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
            <DialogTrigger asChild>
              <Button>
                <Plus className="h-4 w-4 mr-2" />
                Nova Live
              </Button>
            </DialogTrigger>
            <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
              <DialogHeader>
                <DialogTitle>Criar Nova Live</DialogTitle>
                <DialogDescription>
                  Preencha os dados para criar uma nova live ou evento.
                </DialogDescription>
              </DialogHeader>
              <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
                <div className="space-y-2">
                  <Label htmlFor="titulo">Título *</Label>
                  <Input
                    id="titulo"
                    {...register("titulo", { required: "Título é obrigatório" })}
                    placeholder="Ex: Live sobre IA Generativa"
                  />
                  {errors.titulo && (
                    <p className="text-sm text-destructive">{errors.titulo.message}</p>
                  )}
                </div>

                <div className="space-y-2">
                  <Label htmlFor="descricao">Descrição</Label>
                  <Textarea
                    id="descricao"
                    {...register("descricao")}
                    placeholder="Descrição da live..."
                    rows={3}
                  />
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <Label htmlFor="data_agendada">Data *</Label>
                    <Input
                      id="data_agendada"
                      type="date"
                      {...register("data_agendada", { required: "Data é obrigatória" })}
                    />
                    {errors.data_agendada && (
                      <p className="text-sm text-destructive">{errors.data_agendada.message}</p>
                    )}
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="horario">Horário *</Label>
                    <Input
                      id="horario"
                      type="time"
                      {...register("horario", { required: "Horário é obrigatório" })}
                    />
                    {errors.horario && (
                      <p className="text-sm text-destructive">{errors.horario.message}</p>
                    )}
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <Label htmlFor="status">Status *</Label>
                    <select
                      id="status"
                      {...register("status", { required: "Status é obrigatório" })}
                      className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                    >
                      <option value="agendada">Agendada</option>
                      <option value="ao_vivo">Ao Vivo</option>
                      <option value="concluida">Concluída</option>
                      <option value="cancelada">Cancelada</option>
                    </select>
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="plataforma">Plataforma *</Label>
                    <select
                      id="plataforma"
                      {...register("plataforma", { required: "Plataforma é obrigatória" })}
                      className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                    >
                      <option value="meet">Google Meet</option>
                      <option value="zoom">Zoom</option>
                    </select>
                  </div>
                </div>

                <div className="space-y-2">
                  <Label htmlFor="link_meet">Link Google Meet</Label>
                  <Input
                    id="link_meet"
                    type="url"
                    {...register("link_meet")}
                    placeholder="https://meet.google.com/..."
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="link_zoom">Link Zoom</Label>
                  <Input
                    id="link_zoom"
                    type="url"
                    {...register("link_zoom")}
                    placeholder="https://zoom.us/j/..."
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="link_gravacao">Link da Gravação</Label>
                  <Input
                    id="link_gravacao"
                    type="url"
                    {...register("link_gravacao")}
                    placeholder="https://youtube.com/..."
                  />
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
                    {createMutation.isPending ? "Criando..." : "Criar Live"}
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

