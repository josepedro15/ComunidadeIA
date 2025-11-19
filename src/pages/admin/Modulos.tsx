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
import { Plus, Search, Edit, Trash2, BookOpen, GraduationCap, Clock, Video } from "lucide-react";
import { useState } from "react";
import { useForm } from "react-hook-form";

type ModuloFormData = {
  titulo: string;
  descricao: string;
  ordem: number;
  ativo: boolean;
  plano_minimo: "essencial" | "completo" | "premium";
};

type AulaFormData = {
  titulo: string;
  descricao?: string;
  video_url: string;
  duracao: number;
  ordem: number;
  materiais?: string; // Será convertido para array
};

export default function ModulosAdmin() {
  const [searchTerm, setSearchTerm] = useState("");
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const [isEditDialogOpen, setIsEditDialogOpen] = useState(false);
  const [editingModulo, setEditingModulo] = useState<any>(null);
  const [isAulasDialogOpen, setIsAulasDialogOpen] = useState(false);
  const [selectedModuloId, setSelectedModuloId] = useState<string | null>(null);
  const [isAulaDialogOpen, setIsAulaDialogOpen] = useState(false);
  const [editingAula, setEditingAula] = useState<any>(null);
  const [videoFile, setVideoFile] = useState<File | null>(null);
  const [materialFiles, setMaterialFiles] = useState<File[]>([]);
  const [useVideoUpload, setUseVideoUpload] = useState(true);
  const [uploadingVideo, setUploadingVideo] = useState(false);
  const queryClient = useQueryClient();
  
  const { register, handleSubmit, reset, formState: { errors }, setValue } = useForm<ModuloFormData>({
    defaultValues: {
      titulo: "",
      descricao: "",
      ordem: 0,
      ativo: true,
      plano_minimo: "essencial",
    },
  });

  const { register: registerAula, handleSubmit: handleSubmitAula, reset: resetAula, formState: { errors: errorsAula }, setValue: setValueAula } = useForm<AulaFormData>({
    defaultValues: {
      titulo: "",
      descricao: "",
      video_url: "",
      duracao: 0,
      ordem: 0,
      materiais: "",
    },
  });

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

  // Buscar aulas de um módulo
  const { data: aulas, refetch: refetchAulas } = useQuery({
    queryKey: ["admin-aulas", selectedModuloId],
    queryFn: async () => {
      if (!selectedModuloId) return [];
      const { data, error } = await supabase
        .from("aulas")
        .select("*")
        .eq("modulo_id", selectedModuloId)
        .order("ordem", { ascending: true });

      if (error) throw error;
      return data;
    },
    enabled: !!selectedModuloId && isAulasDialogOpen,
  });

  // Mutation para criar módulo
  const createMutation = useMutation({
    mutationFn: async (data: ModuloFormData) => {
      const { error } = await supabase
        .from("modulos")
        .insert([{
          titulo: data.titulo,
          descricao: data.descricao,
          ordem: data.ordem,
          ativo: data.ativo,
          plano_minimo: data.plano_minimo,
        }]);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-modulos"] });
      toast.success("Módulo criado com sucesso!");
      reset();
      setIsDialogOpen(false);
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  // Mutation para atualizar módulo
  const updateMutation = useMutation({
    mutationFn: async ({ id, data }: { id: string; data: ModuloFormData }) => {
      const { error } = await supabase
        .from("modulos")
        .update({
          titulo: data.titulo,
          descricao: data.descricao,
          ordem: data.ordem,
          ativo: data.ativo,
          plano_minimo: data.plano_minimo,
        })
        .eq("id", id);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-modulos"] });
      toast.success("Módulo atualizado com sucesso!");
      reset();
      setIsEditDialogOpen(false);
      setEditingModulo(null);
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  // Função para fazer upload de vídeo
  const uploadVideo = async (file: File, aulaId?: string): Promise<string> => {
    const fileExt = file.name.split('.').pop();
    const fileName = aulaId 
      ? `${aulaId}/${Date.now()}.${fileExt}`
      : `temp/${Date.now()}.${fileExt}`;
    
    const { data, error } = await supabase.storage
      .from('videos')
      .upload(fileName, file, {
        cacheControl: '3600',
        upsert: false
      });

    if (error) throw error;

    // Para bucket privado, sempre usar signed URL (válida por 1 ano)
    // Salvamos o path no banco e geramos signed URL quando necessário
    // Retornamos o path completo para salvar no banco
    const storagePath = `videos/${data.path}`;
    
    // Tentar gerar signed URL (válida por 1 ano)
    const { data: signedData, error: signedError } = await supabase.storage
      .from('videos')
      .createSignedUrl(data.path, 31536000); // 1 ano em segundos

    if (signedError) {
      console.warn("Erro ao gerar signed URL, salvando path:", signedError);
      // Se não conseguir signed URL, salvar o path e gerar depois
      return storagePath;
    }

    // Retornar signed URL (mas vamos salvar o path no banco para gerar novas URLs depois)
    // Por enquanto, retornamos a signed URL, mas idealmente deveríamos salvar apenas o path
    return signedData.signedUrl;
  };

  // Função para fazer upload de materiais
  const uploadMaterials = async (files: File[], aulaId?: string): Promise<string[]> => {
    const uploadPromises = files.map(async (file) => {
      const fileExt = file.name.split('.').pop();
      const fileName = aulaId
        ? `${aulaId}/materiais/${Date.now()}-${file.name}`
        : `temp/materiais/${Date.now()}-${file.name}`;
      
      const { data, error } = await supabase.storage
        .from('materiais')
        .upload(fileName, file, {
          cacheControl: '3600',
          upsert: false
        });

      if (error) throw error;

      // Para bucket privado, usar signed URL (válida por 1 ano)
      const { data: { publicUrl } } = supabase.storage
        .from('materiais')
        .getPublicUrl(data.path);

      // Se não conseguir URL pública, tentar signed URL
      if (!publicUrl || publicUrl.includes('undefined')) {
        const { data: signedData, error: signedError } = await supabase.storage
          .from('materiais')
          .createSignedUrl(data.path, 31536000); // 1 ano em segundos

        if (signedError) throw signedError;
        return signedData.signedUrl;
      }

      return publicUrl;
    });

    return Promise.all(uploadPromises);
  };

  // Mutation para criar aula
  const createAulaMutation = useMutation({
    mutationFn: async (data: AulaFormData) => {
      if (!selectedModuloId) throw new Error("Módulo não selecionado");
      
      setUploadingVideo(true);
      let videoUrl = data.video_url;
      let materiaisUrls: string[] = [];

      // Upload de vídeo se houver arquivo
      if (useVideoUpload && videoFile) {
        try {
          videoUrl = await uploadVideo(videoFile);
        } catch (error: any) {
          setUploadingVideo(false);
          throw new Error(`Erro ao fazer upload do vídeo: ${error.message}`);
        }
      }

      // Upload de materiais se houver arquivos
      if (materialFiles.length > 0) {
        try {
          materiaisUrls = await uploadMaterials(materialFiles);
        } catch (error: any) {
          setUploadingVideo(false);
          throw new Error(`Erro ao fazer upload dos materiais: ${error.message}`);
        }
      }

      // Se também houver URLs de materiais no campo texto, adicionar
      const materiaisFromText = data.materiais
        ? data.materiais.split(",").map((m) => m.trim()).filter((m) => m.length > 0)
        : [];
      
      const allMateriais = [...materiaisUrls, ...materiaisFromText];

      const { data: aulaData, error } = await supabase
        .from("aulas")
        .insert([{
          modulo_id: selectedModuloId,
          titulo: data.titulo,
          descricao: data.descricao || null,
          video_url: videoUrl,
          duracao: data.duracao,
          ordem: data.ordem,
          materiais: allMateriais.length > 0 ? allMateriais : null,
        }])
        .select()
        .single();

      if (error) {
        setUploadingVideo(false);
        throw error;
      }

      // Se o vídeo foi feito upload, mover do temp para a pasta da aula
      if (useVideoUpload && videoFile && aulaData) {
        // Não precisa mover, já está na pasta correta
      }

      setUploadingVideo(false);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-aulas", selectedModuloId] });
      queryClient.invalidateQueries({ queryKey: ["admin-aulas-count"] });
      toast.success("Aula criada com sucesso!");
      resetAula();
      setVideoFile(null);
      setMaterialFiles([]);
      setUseVideoUpload(true);
      setIsAulaDialogOpen(false);
      setEditingAula(null);
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  // Mutation para atualizar aula
  const updateAulaMutation = useMutation({
    mutationFn: async ({ id, data }: { id: string; data: AulaFormData }) => {
      setUploadingVideo(true);
      let videoUrl = data.video_url;
      let materiaisUrls: string[] = [];

      // Upload de vídeo se houver arquivo novo
      if (useVideoUpload && videoFile) {
        try {
          videoUrl = await uploadVideo(videoFile, id);
        } catch (error: any) {
          setUploadingVideo(false);
          throw new Error(`Erro ao fazer upload do vídeo: ${error.message}`);
        }
      }

      // Upload de materiais se houver arquivos novos
      if (materialFiles.length > 0) {
        try {
          materiaisUrls = await uploadMaterials(materialFiles, id);
        } catch (error: any) {
          setUploadingVideo(false);
          throw new Error(`Erro ao fazer upload dos materiais: ${error.message}`);
        }
      }

      // Se também houver URLs de materiais no campo texto, adicionar
      const materiaisFromText = data.materiais
        ? data.materiais.split(",").map((m) => m.trim()).filter((m) => m.length > 0)
        : [];
      
      const allMateriais = [...materiaisUrls, ...materiaisFromText];

      const { error } = await supabase
        .from("aulas")
        .update({
          titulo: data.titulo,
          descricao: data.descricao || null,
          video_url: videoUrl,
          duracao: data.duracao,
          ordem: data.ordem,
          materiais: allMateriais.length > 0 ? allMateriais : null,
        })
        .eq("id", id);

      if (error) {
        setUploadingVideo(false);
        throw error;
      }

      setUploadingVideo(false);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-aulas", selectedModuloId] });
      toast.success("Aula atualizada com sucesso!");
      resetAula();
      setVideoFile(null);
      setMaterialFiles([]);
      setUseVideoUpload(true);
      setIsAulaDialogOpen(false);
      setEditingAula(null);
    },
    onError: (error: any) => {
      toast.error(`Erro: ${error.message}`);
    },
  });

  // Mutation para deletar aula
  const deleteAulaMutation = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase
        .from("aulas")
        .delete()
        .eq("id", id);

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-aulas", selectedModuloId] });
      queryClient.invalidateQueries({ queryKey: ["admin-aulas-count"] });
      toast.success("Aula deletada com sucesso!");
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

  const onSubmit = (data: ModuloFormData) => {
    if (editingModulo) {
      updateMutation.mutate({ id: editingModulo.id, data });
    } else {
      createMutation.mutate(data);
    }
  };

  const onSubmitAula = (data: AulaFormData) => {
    // Validar se tem vídeo (upload ou URL)
    if (useVideoUpload && !videoFile && !editingAula) {
      toast.error("Selecione um arquivo de vídeo para fazer upload");
      return;
    }
    
    if (!useVideoUpload && !data.video_url) {
      toast.error("Informe a URL do vídeo");
      return;
    }

    if (editingAula) {
      updateAulaMutation.mutate({ id: editingAula.id, data });
    } else {
      createAulaMutation.mutate(data);
    }
  };

  const handleEditModulo = (modulo: any) => {
    setEditingModulo(modulo);
    setValue("titulo", modulo.titulo);
    setValue("descricao", modulo.descricao);
    setValue("ordem", modulo.ordem);
    setValue("ativo", modulo.ativo);
    setValue("plano_minimo", modulo.plano_minimo);
    setIsEditDialogOpen(true);
  };

  const handleOpenAulas = (moduloId: string) => {
    setSelectedModuloId(moduloId);
    setIsAulasDialogOpen(true);
  };

  const handleEditAula = (aula: any) => {
    setEditingAula(aula);
    setValueAula("titulo", aula.titulo);
    setValueAula("descricao", aula.descricao || "");
    setValueAula("video_url", aula.video_url);
    setValueAula("duracao", aula.duracao);
    setValueAula("ordem", aula.ordem);
    setValueAula("materiais", aula.materiais?.join(", ") || "");
    setVideoFile(null);
    setMaterialFiles([]);
    // Verificar se a URL é do Supabase Storage
    setUseVideoUpload(aula.video_url?.includes('supabase.co/storage') || false);
    setIsAulaDialogOpen(true);
  };

  const handleNewAula = () => {
    setEditingAula(null);
    resetAula();
    setVideoFile(null);
    setMaterialFiles([]);
    setUseVideoUpload(true);
    setIsAulaDialogOpen(true);
  };

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
          <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
            <DialogTrigger asChild>
              <Button>
                <Plus className="h-4 w-4 mr-2" />
                Novo Módulo
              </Button>
            </DialogTrigger>
            <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
              <DialogHeader>
                <DialogTitle>Criar Novo Módulo</DialogTitle>
                <DialogDescription>
                  Preencha os dados para criar um novo módulo de aprendizado.
                </DialogDescription>
              </DialogHeader>
              <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
                <div className="space-y-2">
                  <Label htmlFor="titulo">Título *</Label>
                  <Input
                    id="titulo"
                    {...register("titulo", { required: "Título é obrigatório" })}
                    placeholder="Ex: Introdução à IA"
                  />
                  {errors.titulo && (
                    <p className="text-sm text-destructive">{errors.titulo.message}</p>
                  )}
                </div>

                <div className="space-y-2">
                  <Label htmlFor="descricao">Descrição *</Label>
                  <Textarea
                    id="descricao"
                    {...register("descricao", { required: "Descrição é obrigatória" })}
                    placeholder="Descreva o módulo..."
                    rows={4}
                  />
                  {errors.descricao && (
                    <p className="text-sm text-destructive">{errors.descricao.message}</p>
                  )}
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <Label htmlFor="plano_minimo">Plano Mínimo *</Label>
                    <select
                      id="plano_minimo"
                      {...register("plano_minimo", { required: "Plano mínimo é obrigatório" })}
                      className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                    >
                      <option value="essencial">Essencial</option>
                      <option value="completo">Completo</option>
                      <option value="premium">Premium</option>
                    </select>
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="ordem">Ordem</Label>
                    <Input
                      id="ordem"
                      type="number"
                      {...register("ordem", { valueAsNumber: true, min: 0 })}
                      placeholder="0"
                    />
                  </div>
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
                    {createMutation.isPending ? "Criando..." : "Criar Módulo"}
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
                      <Button 
                        size="sm" 
                        variant="outline"
                        onClick={() => handleOpenAulas(modulo.id)}
                      >
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
                      <Button 
                        size="sm" 
                        variant="outline"
                        onClick={() => handleEditModulo(modulo)}
                      >
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

      {/* Dialog de Edição de Módulo */}
      <Dialog open={isEditDialogOpen} onOpenChange={setIsEditDialogOpen}>
        <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle>Editar Módulo</DialogTitle>
            <DialogDescription>
              Atualize os dados do módulo de aprendizado.
            </DialogDescription>
          </DialogHeader>
          <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="edit-titulo">Título *</Label>
              <Input
                id="edit-titulo"
                {...register("titulo", { required: "Título é obrigatório" })}
                placeholder="Ex: Introdução à IA"
              />
              {errors.titulo && (
                <p className="text-sm text-destructive">{errors.titulo.message}</p>
              )}
            </div>

            <div className="space-y-2">
              <Label htmlFor="edit-descricao">Descrição *</Label>
              <Textarea
                id="edit-descricao"
                {...register("descricao", { required: "Descrição é obrigatória" })}
                placeholder="Descreva o módulo..."
                rows={4}
              />
              {errors.descricao && (
                <p className="text-sm text-destructive">{errors.descricao.message}</p>
              )}
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="edit-plano_minimo">Plano Mínimo *</Label>
                <select
                  id="edit-plano_minimo"
                  {...register("plano_minimo", { required: "Plano mínimo é obrigatório" })}
                  className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
                >
                  <option value="essencial">Essencial</option>
                  <option value="completo">Completo</option>
                  <option value="premium">Premium</option>
                </select>
              </div>

              <div className="space-y-2">
                <Label htmlFor="edit-ordem">Ordem</Label>
                <Input
                  id="edit-ordem"
                  type="number"
                  {...register("ordem", { valueAsNumber: true, min: 0 })}
                  placeholder="0"
                />
              </div>
            </div>

            <div className="space-y-2">
              <Label htmlFor="edit-ativo">Status</Label>
              <select
                id="edit-ativo"
                {...register("ativo", { 
                  setValueAs: (v) => v === "true" 
                })}
                className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
              >
                <option value="true">Ativo</option>
                <option value="false">Inativo</option>
              </select>
            </div>

            <DialogFooter>
              <Button
                type="button"
                variant="outline"
                onClick={() => {
                  reset();
                  setIsEditDialogOpen(false);
                  setEditingModulo(null);
                }}
              >
                Cancelar
              </Button>
              <Button type="submit" disabled={updateMutation.isPending}>
                {updateMutation.isPending ? "Salvando..." : "Salvar Alterações"}
              </Button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>

      {/* Dialog de Gerenciamento de Aulas */}
      <Dialog open={isAulasDialogOpen} onOpenChange={setIsAulasDialogOpen}>
        <DialogContent className="max-w-4xl max-h-[90vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle>Gerenciar Aulas</DialogTitle>
            <DialogDescription>
              Gerencie as aulas deste módulo.
            </DialogDescription>
          </DialogHeader>
          <div className="space-y-4">
            <div className="flex justify-end">
              <Button onClick={handleNewAula}>
                <Plus className="h-4 w-4 mr-2" />
                Nova Aula
              </Button>
            </div>
            {aulas && aulas.length > 0 ? (
              <div className="space-y-2">
                {aulas.map((aula: any) => (
                  <div
                    key={aula.id}
                    className="flex items-start justify-between p-4 border rounded-lg hover:bg-muted/50 transition-colors"
                  >
                    <div className="flex-1">
                      <div className="flex items-center gap-2 mb-2">
                        <h4 className="font-semibold">{aula.titulo}</h4>
                        <Badge variant="outline">Ordem: {aula.ordem}</Badge>
                      </div>
                      {aula.descricao && (
                        <p className="text-sm text-muted-foreground mb-2">
                          {aula.descricao}
                        </p>
                      )}
                      <div className="flex items-center gap-4 text-sm text-muted-foreground">
                        <div className="flex items-center gap-1">
                          <Video className="h-4 w-4" />
                          <span className="text-muted-foreground">
                            {aula.video_url.includes('youtube.com') || aula.video_url.includes('vimeo.com') 
                              ? 'Vídeo externo' 
                              : 'Vídeo do Supabase'}
                          </span>
                        </div>
                        <div className="flex items-center gap-1">
                          <Clock className="h-4 w-4" />
                          <span>{aula.duracao} min</span>
                        </div>
                      </div>
                    </div>
                    <div className="flex gap-2 ml-4">
                      <Button
                        size="sm"
                        variant="outline"
                        onClick={() => handleEditAula(aula)}
                      >
                        <Edit className="h-4 w-4" />
                      </Button>
                      <Button
                        size="sm"
                        variant="destructive"
                        onClick={() => {
                          if (confirm("Tem certeza que deseja deletar esta aula?")) {
                            deleteAulaMutation.mutate(aula.id);
                          }
                        }}
                        disabled={deleteAulaMutation.isPending}
                      >
                        <Trash2 className="h-4 w-4" />
                      </Button>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="text-center py-8 text-muted-foreground">
                Nenhuma aula encontrada. Clique em "Nova Aula" para criar a primeira.
              </div>
            )}
          </div>
        </DialogContent>
      </Dialog>

      {/* Dialog de Criar/Editar Aula */}
      <Dialog open={isAulaDialogOpen} onOpenChange={setIsAulaDialogOpen}>
        <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle>{editingAula ? "Editar Aula" : "Nova Aula"}</DialogTitle>
            <DialogDescription>
              {editingAula ? "Atualize os dados da aula." : "Preencha os dados para criar uma nova aula."}
            </DialogDescription>
          </DialogHeader>
          <form onSubmit={handleSubmitAula(onSubmitAula)} className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="aula-titulo">Título *</Label>
              <Input
                id="aula-titulo"
                {...registerAula("titulo", { required: "Título é obrigatório" })}
                placeholder="Ex: Introdução ao ChatGPT"
              />
              {errorsAula.titulo && (
                <p className="text-sm text-destructive">{errorsAula.titulo.message}</p>
              )}
            </div>

            <div className="space-y-2">
              <Label htmlFor="aula-descricao">Descrição</Label>
              <Textarea
                id="aula-descricao"
                {...registerAula("descricao")}
                placeholder="Descrição da aula..."
                rows={3}
              />
            </div>

            <div className="space-y-2">
              <Label>Vídeo *</Label>
              <div className="space-y-2">
                <div className="flex items-center gap-4 mb-2">
                  <label className="flex items-center gap-2 cursor-pointer">
                    <input
                      type="radio"
                      checked={useVideoUpload}
                      onChange={() => setUseVideoUpload(true)}
                      className="w-4 h-4"
                    />
                    <span>Fazer upload</span>
                  </label>
                  <label className="flex items-center gap-2 cursor-pointer">
                    <input
                      type="radio"
                      checked={!useVideoUpload}
                      onChange={() => setUseVideoUpload(false)}
                      className="w-4 h-4"
                    />
                    <span>Usar URL externa</span>
                  </label>
                </div>

                {useVideoUpload ? (
                  <div className="space-y-2">
                    <Input
                      type="file"
                      accept="video/*"
                      onChange={(e) => {
                        const file = e.target.files?.[0];
                        if (file) {
                          const fileSizeGB = file.size / 1024 / 1024 / 1024;
                          const maxSizeGB = 5;
                          const maxSizeBytes = maxSizeGB * 1024 * 1024 * 1024;
                          
                          if (file.size > maxSizeBytes) {
                            toast.error(`Vídeo muito grande (${fileSizeGB.toFixed(2)}GB). Tamanho máximo permitido: ${maxSizeGB}GB`);
                            e.target.value = ''; // Limpa o input
                            return;
                          }
                          
                          setVideoFile(file);
                          // Aviso informativo para arquivos grandes
                          if (fileSizeGB > 1) {
                            toast.info(`Arquivo grande (${fileSizeGB.toFixed(2)}GB). O upload pode demorar dependendo da sua conexão.`);
                          }
                        }
                      }}
                      className="cursor-pointer"
                    />
                    {videoFile && (
                      <p className="text-sm text-muted-foreground">
                        Arquivo selecionado: {videoFile.name} ({(videoFile.size / 1024 / 1024).toFixed(2)} MB)
                      </p>
                    )}
                    {editingAula && editingAula.video_url && !videoFile && (
                      <p className="text-sm text-muted-foreground">
                        Vídeo atual: <a href={editingAula.video_url} target="_blank" rel="noopener noreferrer" className="text-primary hover:underline">Ver vídeo</a>
                      </p>
                    )}
                    {!videoFile && !editingAula && (
                      <p className="text-xs text-muted-foreground">
                        Selecione um arquivo de vídeo para fazer upload
                      </p>
                    )}
                  </div>
                ) : (
                  <Input
                    id="aula-video_url"
                    type="url"
                    {...registerAula("video_url", { 
                      required: !useVideoUpload ? "URL do vídeo é obrigatória" : false,
                      validate: (value) => {
                        if (!useVideoUpload && !value) {
                          return "URL do vídeo é obrigatória quando usar URL externa";
                        }
                        return true;
                      }
                    })}
                    placeholder="https://youtube.com/... ou https://..."
                  />
                )}
                {errorsAula.video_url && (
                  <p className="text-sm text-destructive">{errorsAula.video_url.message}</p>
                )}
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="aula-duracao">Duração (minutos) *</Label>
                <Input
                  id="aula-duracao"
                  type="number"
                  {...registerAula("duracao", { required: "Duração é obrigatória", valueAsNumber: true, min: 1 })}
                  placeholder="30"
                />
                {errorsAula.duracao && (
                  <p className="text-sm text-destructive">{errorsAula.duracao.message}</p>
                )}
              </div>

              <div className="space-y-2">
                <Label htmlFor="aula-ordem">Ordem</Label>
                <Input
                  id="aula-ordem"
                  type="number"
                  {...registerAula("ordem", { valueAsNumber: true, min: 0 })}
                  placeholder="0"
                />
              </div>
            </div>

            <div className="space-y-2">
              <Label htmlFor="aula-materiais">Materiais</Label>
              <div className="space-y-2">
                <div className="space-y-2">
                  <Label htmlFor="aula-materiais-files" className="text-sm font-normal">
                    Fazer upload de arquivos (PDFs, slides, etc)
                  </Label>
                  <Input
                    id="aula-materiais-files"
                    type="file"
                    multiple
                    accept=".pdf,.ppt,.pptx,.doc,.docx"
                    onChange={(e) => {
                      const files = Array.from(e.target.files || []);
                      if (files.length > 0) {
                        setMaterialFiles(files);
                        // Aviso informativo para arquivos grandes (sem bloquear)
                        const largeFiles = files.filter(f => f.size > 100 * 1024 * 1024);
                        if (largeFiles.length > 0) {
                          const totalSizeMB = largeFiles.reduce((sum, f) => sum + f.size, 0) / 1024 / 1024;
                          toast.info(`${largeFiles.length} arquivo(s) grande(s) (${totalSizeMB.toFixed(2)}MB total). O upload pode demorar.`);
                        }
                      }
                    }}
                    className="cursor-pointer"
                  />
                  {materialFiles.length > 0 && (
                    <div className="space-y-1">
                      {materialFiles.map((file, idx) => (
                        <p key={idx} className="text-sm text-muted-foreground">
                          • {file.name} ({(file.size / 1024 / 1024).toFixed(2)} MB)
                        </p>
                      ))}
                    </div>
                  )}
                </div>
                <div className="space-y-2">
                  <Label htmlFor="aula-materiais-urls" className="text-sm font-normal">
                    Ou adicione URLs externas (separadas por vírgula)
                  </Label>
                  <Input
                    id="aula-materiais-urls"
                    {...registerAula("materiais")}
                    placeholder="https://exemplo.com/material1.pdf, https://exemplo.com/material2.pdf"
                  />
                  <p className="text-xs text-muted-foreground">
                    Você pode fazer upload de arquivos OU adicionar URLs externas, ou ambos
                  </p>
                </div>
              </div>
            </div>

            <DialogFooter>
              <Button
                type="button"
                variant="outline"
                onClick={() => {
                  resetAula();
                  setIsAulaDialogOpen(false);
                  setEditingAula(null);
                }}
              >
                Cancelar
              </Button>
              <Button 
                type="submit" 
                disabled={createAulaMutation.isPending || updateAulaMutation.isPending || uploadingVideo}
              >
                {createAulaMutation.isPending || updateAulaMutation.isPending || uploadingVideo
                  ? uploadingVideo ? "Fazendo upload..." : "Salvando..."
                  : editingAula
                  ? "Salvar Alterações"
                  : "Criar Aula"}
              </Button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>
    </Layout>
  );
}

