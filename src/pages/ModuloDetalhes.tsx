import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { useParams, useNavigate } from "react-router-dom";
import { BookOpen, Clock, CheckCircle2, Play, Pause, ArrowLeft, Download, ExternalLink } from "lucide-react";
import { useState, useEffect } from "react";
import { toast } from "sonner";

export default function ModuloDetalhes() {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const { user } = useAuth();
  const queryClient = useQueryClient();
  const [selectedAulaId, setSelectedAulaId] = useState<string | null>(null);
  const [playerError, setPlayerError] = useState<string | null>(null);
  const [playerReady, setPlayerReady] = useState(false);

  // Buscar módulo
  const { data: modulo, isLoading: moduloLoading } = useQuery({
    queryKey: ["modulo", id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("modulos")
        .select("*")
        .eq("id", id)
        .single();

      if (error) throw error;
      return data;
    },
    enabled: !!id,
  });

  // Buscar aulas do módulo
  const { data: aulas, isLoading: aulasLoading } = useQuery({
    queryKey: ["aulas-modulo", id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("aulas")
        .select("*")
        .eq("modulo_id", id)
        .order("ordem", { ascending: true });

      if (error) throw error;
      return data;
    },
    enabled: !!id,
  });

  // Buscar progresso do usuário
  const aulasIds = aulas?.map(a => a.id) || [];
  const { data: progresso } = useQuery({
    queryKey: ["progresso-aulas", user?.id, id, aulasIds.join(',')],
    queryFn: async () => {
      if (!user || !aulas || aulas.length === 0) return {};
      
      const { data, error } = await supabase
        .from("progresso_aulas")
        .select("aula_id, progresso, concluida")
        .eq("user_id", user.id)
        .in("aula_id", aulasIds);

      if (error) throw error;
      
      const progressoMap: Record<string, { progresso: number; concluida: boolean }> = {};
      data?.forEach(p => {
        progressoMap[p.aula_id] = { progresso: p.progresso, concluida: p.concluida };
      });
      
      return progressoMap;
    },
    enabled: !!user && !!aulas && aulas.length > 0 && aulasIds.length > 0,
  });

  // Função para extrair ID do YouTube
  const getYouTubeId = (url: string): string | null => {
    if (!url) return null;
    if (url.includes('youtu.be/')) {
      return url.split('youtu.be/')[1]?.split('?')[0] || null;
    }
    if (url.includes('youtube.com/watch?v=')) {
      return url.match(/youtube\.com\/watch\?v=([^&\n?#]+)/)?.[1] || null;
    }
    if (url.includes('youtube.com/embed/')) {
      return url.match(/youtube\.com\/embed\/([^&\n?#]+)/)?.[1] || null;
    }
    if (url.includes('youtube.com/v/')) {
      return url.match(/youtube\.com\/v\/([^&\n?#]+)/)?.[1] || null;
    }
    return null;
  };

  // Função para extrair ID do Vimeo
  const getVimeoId = (url: string): string | null => {
    if (!url) return null;
    const match = url.match(/vimeo\.com\/(\d+)/);
    return match?.[1] || null;
  };

  // Mutation para atualizar progresso
  const updateProgressMutation = useMutation({
    mutationFn: async ({ aulaId, progresso, concluida }: { aulaId: string; progresso: number; concluida: boolean }) => {
      if (!user) throw new Error("Usuário não autenticado");

      const { error } = await supabase
        .from("progresso_aulas")
        .upsert({
          user_id: user.id,
          aula_id: aulaId,
          progresso,
          concluida,
          ultima_visualizacao: new Date().toISOString(),
        }, {
          onConflict: "user_id,aula_id"
        });

      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["progresso-aulas", user?.id, id] });
      queryClient.invalidateQueries({ queryKey: ["progresso-modulos", user?.id] });
      queryClient.invalidateQueries({ queryKey: ["dashboard-modules", user?.id] });
    },
    onError: (error: any) => {
      console.error("Erro ao atualizar progresso:", error);
    },
  });

  // Selecionar primeira aula se nenhuma estiver selecionada
  useEffect(() => {
    if (aulas && aulas.length > 0 && !selectedAulaId) {
      setSelectedAulaId(aulas[0].id);
    }
  }, [aulas, selectedAulaId]);


  // Resetar estado quando trocar de aula
  useEffect(() => {
    setPlayerError(null);
    setPlayerReady(false);
  }, [selectedAulaId]);

  // Calcular progresso geral do módulo
  const progressoGeral = aulas && progresso ? (() => {
    const totalAulas = aulas.length;
    const aulasConcluidas = aulas.filter(a => progresso[a.id]?.concluida).length;
    return totalAulas > 0 ? Math.round((aulasConcluidas / totalAulas) * 100) : 0;
  })() : 0;

  const aulaAtual = aulas?.find(a => a.id === selectedAulaId);

  // Debug: Log da URL do vídeo quando a aula mudar
  useEffect(() => {
    if (aulaAtual?.video_url) {
      console.log('📹 URL do vídeo:', aulaAtual.video_url);
      const youtubeId = getYouTubeId(aulaAtual.video_url);
      const vimeoId = getVimeoId(aulaAtual.video_url);
      console.log('✅ YouTube ID:', youtubeId, 'Vimeo ID:', vimeoId);
    }
  }, [aulaAtual?.video_url]);

  if (moduloLoading || aulasLoading) {
    return (
      <Layout>
        <div className="text-center py-8 text-muted-foreground">
          Carregando módulo...
        </div>
      </Layout>
    );
  }

  if (!modulo || !aulas) {
    return (
      <Layout>
        <div className="text-center py-8 text-muted-foreground">
          Módulo não encontrado.
        </div>
      </Layout>
    );
  }

  return (
    <Layout>
      <div className="space-y-6">
        {/* Header */}
        <div className="flex items-start gap-4">
          <Button
            variant="ghost"
            size="sm"
            onClick={() => navigate("/modulos")}
          >
            <ArrowLeft className="h-4 w-4 mr-2" />
            Voltar
          </Button>
          <div className="flex-1">
            <h1 className="text-3xl font-bold">{modulo.titulo}</h1>
            <p className="text-muted-foreground mt-1">{modulo.descricao}</p>
            {progressoGeral > 0 && (
              <div className="mt-4 space-y-2">
                <div className="flex justify-between text-sm">
                  <span className="text-muted-foreground">Progresso do Módulo</span>
                  <span className="font-medium">{progressoGeral}%</span>
                </div>
                <Progress value={progressoGeral} className="h-2" />
              </div>
            )}
          </div>
        </div>

        <div className="grid lg:grid-cols-3 gap-6">
          {/* Lista de Aulas */}
          <div className="lg:col-span-1">
            <Card>
              <CardHeader>
                <CardTitle>Aulas</CardTitle>
                <CardDescription>
                  {aulas.length} aula(s) disponível(is)
                </CardDescription>
              </CardHeader>
              <CardContent className="space-y-2">
                {aulas.map((aula) => {
                  const aulaProgresso = progresso?.[aula.id];
                  const isSelected = selectedAulaId === aula.id;
                  
                  return (
                    <div
                      key={aula.id}
                      className={`p-3 border rounded-lg cursor-pointer transition-colors ${
                        isSelected
                          ? "border-primary bg-primary/5"
                          : "hover:bg-muted/50"
                      }`}
                      onClick={() => setSelectedAulaId(aula.id)}
                    >
                      <div className="flex items-start gap-2">
                        <div className="flex-1">
                          <div className="flex items-center gap-2 mb-1">
                            <h4 className="font-medium text-sm">{aula.titulo}</h4>
                            {aulaProgresso?.concluida && (
                              <CheckCircle2 className="h-4 w-4 text-green-500" />
                            )}
                          </div>
                          <div className="flex items-center gap-2 text-xs text-muted-foreground">
                            <Clock className="h-3 w-3" />
                            <span>{aula.duracao} min</span>
                          </div>
                          {aulaProgresso && aulaProgresso.progresso > 0 && !aulaProgresso.concluida && (
                            <Progress value={aulaProgresso.progresso} className="h-1 mt-2" />
                          )}
                        </div>
                        {isSelected && (
                          <Play className="h-4 w-4 text-primary" />
                        )}
                      </div>
                    </div>
                  );
                })}
              </CardContent>
            </Card>
          </div>

          {/* Player de Vídeo e Conteúdo */}
          <div className="lg:col-span-2">
            {aulaAtual ? (
              <Card>
                <CardHeader>
                  <CardTitle>{aulaAtual.titulo}</CardTitle>
                  {aulaAtual.descricao && (
                    <CardDescription>{aulaAtual.descricao}</CardDescription>
                  )}
                </CardHeader>
                <CardContent className="space-y-4">
                  {/* Player de Vídeo */}
                  <div className="aspect-video bg-black rounded-lg overflow-hidden relative group">
                    {!aulaAtual.video_url ? (
                      <div className="w-full h-full flex items-center justify-center text-white p-4">
                        <div className="text-center">
                          <p className="text-lg font-semibold mb-2">Vídeo não disponível</p>
                          <p className="text-sm text-gray-300">
                            Esta aula não possui URL de vídeo configurada.
                          </p>
                        </div>
                      </div>
                    ) : (() => {
                      const youtubeId = getYouTubeId(aulaAtual.video_url);
                      const vimeoId = getVimeoId(aulaAtual.video_url);
                      
                      if (youtubeId) {
                        return (
                          <>
                            <iframe
                              src={`https://www.youtube.com/embed/${youtubeId}?rel=0&modestbranding=1&showinfo=0&controls=1&fs=1&cc_load_policy=0&iv_load_policy=3`}
                              className="w-full h-full"
                              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                              allowFullScreen
                              title={aulaAtual.titulo}
                              onLoad={() => {
                                console.log('✅ Player YouTube carregado!');
                                setPlayerReady(true);
                                setPlayerError(null);
                              }}
                              onError={() => {
                                console.error('❌ Erro ao carregar iframe do YouTube');
                                setPlayerError('Erro ao carregar o vídeo do YouTube.');
                              }}
                            />
                            
                            {/* Overlay customizado com badge */}
                            <div className="absolute inset-0 pointer-events-none">
                              {/* Badge customizado no canto superior direito */}
                              <div className="absolute top-4 right-4 bg-primary/90 backdrop-blur-sm rounded-lg px-3 py-1.5 text-white text-xs font-medium pointer-events-none z-10">
                                Comunidade IA
                              </div>
                            </div>
                          </>
                        );
                      }
                      
                      if (vimeoId) {
                        return (
                          <iframe
                            src={`https://player.vimeo.com/video/${vimeoId}`}
                            className="w-full h-full"
                            allow="autoplay; fullscreen; picture-in-picture"
                            allowFullScreen
                            title={aulaAtual.titulo}
                            onLoad={() => {
                              console.log('✅ Player Vimeo carregado!');
                              setPlayerReady(true);
                              setPlayerError(null);
                            }}
                            onError={() => {
                              console.error('❌ Erro ao carregar iframe do Vimeo');
                              setPlayerError('Erro ao carregar o vídeo do Vimeo.');
                            }}
                          />
                        );
                      }
                      
                      return (
                        <div className="w-full h-full flex items-center justify-center text-white p-4">
                          <div className="text-center">
                            <p className="text-lg font-semibold mb-2">URL de vídeo não suportada</p>
                            <p className="text-sm text-gray-300 mb-4">
                              Por favor, use um link do YouTube ou Vimeo.
                            </p>
                            <p className="text-xs text-gray-400 mb-2">URL recebida:</p>
                            <p className="text-xs text-gray-500 break-all mb-4">{aulaAtual.video_url}</p>
                            <a
                              href={aulaAtual.video_url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="text-blue-400 hover:text-blue-300 underline inline-block"
                            >
                              Abrir link original
                            </a>
                          </div>
                        </div>
                      );
                    })()}
                    
                    {playerError && (
                      <div className="absolute inset-0 bg-black/80 flex items-center justify-center p-4 z-10">
                        <div className="text-center text-white">
                          <p className="text-lg font-semibold mb-2">Erro ao carregar vídeo</p>
                          <p className="text-sm text-gray-300 mb-4">{playerError}</p>
                          <a
                            href={aulaAtual.video_url}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="text-blue-400 hover:text-blue-300 underline inline-block"
                          >
                            Abrir vídeo em nova aba
                          </a>
                        </div>
                      </div>
                    )}
                    
                    {!playerReady && !playerError && (
                      <div className="absolute inset-0 bg-black/50 flex items-center justify-center">
                        <div className="text-white text-center">
                          <p className="text-sm">Carregando vídeo...</p>
                        </div>
                      </div>
                    )}
                  </div>

                  {/* Informações da Aula */}
                  <div className="flex items-center gap-4 text-sm text-muted-foreground">
                    <div className="flex items-center gap-1">
                      <Clock className="h-4 w-4" />
                      <span>{aulaAtual.duracao} minutos</span>
                    </div>
                    <div className="flex items-center gap-1">
                      <BookOpen className="h-4 w-4" />
                      <span>Aula {aulas.findIndex(a => a.id === aulaAtual.id) + 1} de {aulas.length}</span>
                    </div>
                  </div>

                  {/* Materiais */}
                  {aulaAtual.materiais && aulaAtual.materiais.length > 0 && (
                    <div className="space-y-2">
                      <h4 className="font-semibold">Materiais Complementares</h4>
                      <div className="space-y-2">
                        {aulaAtual.materiais.map((material, idx) => (
                          <a
                            key={idx}
                            href={material}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="flex items-center gap-2 p-2 border rounded-lg hover:bg-muted/50 transition-colors"
                          >
                            <Download className="h-4 w-4 text-muted-foreground" />
                            <span className="text-sm flex-1 truncate">{material}</span>
                            <ExternalLink className="h-4 w-4 text-muted-foreground" />
                          </a>
                        ))}
                      </div>
                    </div>
                  )}

                  {/* Botão de Concluir */}
                  <div className="pt-4 border-t">
                    <Button
                      className="w-full"
                      onClick={() => {
                        updateProgressMutation.mutate({
                          aulaId: aulaAtual.id,
                          progresso: 100,
                          concluida: true,
                        });
                        toast.success("Aula concluída!");
                      }}
                      disabled={progresso?.[aulaAtual.id]?.concluida || updateProgressMutation.isPending}
                    >
                      {progresso?.[aulaAtual.id]?.concluida ? (
                        <>
                          <CheckCircle2 className="mr-2 h-4 w-4" />
                          Aula Concluída
                        </>
                      ) : (
                        <>
                          <CheckCircle2 className="mr-2 h-4 w-4" />
                          Marcar como Concluída
                        </>
                      )}
                    </Button>
                  </div>
                </CardContent>
              </Card>
            ) : (
              <Card>
                <CardContent className="py-8 text-center text-muted-foreground">
                  Selecione uma aula para começar
                </CardContent>
              </Card>
            )}
          </div>
        </div>
      </div>
    </Layout>
  );
}

