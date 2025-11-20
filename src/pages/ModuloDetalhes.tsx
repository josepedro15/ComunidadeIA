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
import { useState, useEffect, useRef } from "react";
import { toast } from "sonner";

export default function ModuloDetalhes() {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const { user } = useAuth();
  const queryClient = useQueryClient();
  const [selectedAulaId, setSelectedAulaId] = useState<string | null>(null);
  const [playerError, setPlayerError] = useState<string | null>(null);
  const [playerReady, setPlayerReady] = useState(false);
  const [supabaseVideoUrl, setSupabaseVideoUrl] = useState<string | null>(null);
  const [videoCurrentTime, setVideoCurrentTime] = useState(0);
  const [videoDuration, setVideoDuration] = useState(0);
  const [youtubeEmbedUrl, setYoutubeEmbedUrl] = useState<string | null>(null);
  const videoRef = useRef<HTMLVideoElement>(null);
  const iframeRef = useRef<HTMLIFrameElement>(null);

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

  // Verificar se é vídeo do Supabase Storage
  const isSupabaseVideo = (url: string): boolean => {
    if (!url) return false;
    return url.includes('supabase.co/storage') || url.startsWith('videos/');
  };

  // Verificar se é vídeo do Google Drive
  const isGoogleDriveVideo = (url: string): boolean => {
    if (!url) return false;
    return url.includes('drive.google.com') || url.includes('docs.google.com');
  };

  // Extrair File ID do Google Drive
  const getGoogleDriveFileId = (url: string): string | null => {
    if (!url) return null;
    
    // Formato: https://drive.google.com/file/d/FILE_ID/view
    const match1 = url.match(/drive\.google\.com\/file\/d\/([a-zA-Z0-9_-]+)/);
    if (match1) return match1[1];
    
    // Formato: https://drive.google.com/open?id=FILE_ID
    const match2 = url.match(/[?&]id=([a-zA-Z0-9_-]+)/);
    if (match2) return match2[1];
    
    // Formato: https://docs.google.com/uc?export=download&id=FILE_ID
    const match3 = url.match(/docs\.google\.com\/uc\?[^&]*&id=([a-zA-Z0-9_-]+)/);
    if (match3) return match3[1];
    
    return null;
  };

  // Converter link do Google Drive para link de streaming
  const getGoogleDriveStreamUrl = (fileId: string): string => {
    // Google Drive permite streaming via URL específica
    // Formato: https://drive.google.com/uc?export=download&id=FILE_ID
    // Para vídeos, podemos usar o viewer do Google Drive
    return `https://drive.google.com/file/d/${fileId}/preview`;
  };

  // Gerar signed URL para vídeo do Supabase Storage
  const getSupabaseVideoUrl = async (videoPath: string): Promise<string | null> => {
    try {
      // Se já é uma URL completa do Supabase, extrair o path
      let path = videoPath;
      if (videoPath.includes('supabase.co/storage/v1/object/public/')) {
        const match = videoPath.match(/\/storage\/v1\/object\/public\/videos\/(.+)/);
        if (match) path = match[1];
      } else if (videoPath.startsWith('videos/')) {
        path = videoPath.replace('videos/', '');
      }

      // Gerar signed URL válida por 1 hora
      const { data, error } = await supabase.storage
        .from('videos')
        .createSignedUrl(path, 3600);

      if (error) {
        console.error('Erro ao gerar signed URL:', error);
        return null;
      }

      return data.signedUrl;
    } catch (error) {
      console.error('Erro ao processar vídeo do Supabase:', error);
      return null;
    }
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

  // Calcular progresso geral do módulo
  const progressoGeral = aulas && progresso ? (() => {
    const totalAulas = aulas.length;
    const aulasConcluidas = aulas.filter(a => progresso[a.id]?.concluida).length;
    return totalAulas > 0 ? Math.round((aulasConcluidas / totalAulas) * 100) : 0;
  })() : 0;

  const aulaAtual = aulas?.find(a => a.id === selectedAulaId);

  // Selecionar primeira aula se nenhuma estiver selecionada
  useEffect(() => {
    if (aulas && aulas.length > 0 && !selectedAulaId) {
      setSelectedAulaId(aulas[0].id);
    }
  }, [aulas, selectedAulaId]);

  // Carregar signed URL para vídeos do Supabase
  useEffect(() => {
    const loadSupabaseVideo = async () => {
      if (aulaAtual?.video_url && isSupabaseVideo(aulaAtual.video_url)) {
        setSupabaseVideoUrl(null);
        const signedUrl = await getSupabaseVideoUrl(aulaAtual.video_url);
        if (signedUrl) {
          setSupabaseVideoUrl(signedUrl);
          setPlayerReady(true);
        } else {
          setPlayerError('Erro ao carregar vídeo privado. Verifique suas permissões.');
        }
      } else {
        setSupabaseVideoUrl(null);
      }
    };

    loadSupabaseVideo();
  }, [aulaAtual?.video_url, selectedAulaId]);

  // Processar vídeos do Google Drive
  const [googleDriveUrl, setGoogleDriveUrl] = useState<string | null>(null);
  
  useEffect(() => {
    if (aulaAtual?.video_url && isGoogleDriveVideo(aulaAtual.video_url)) {
      const fileId = getGoogleDriveFileId(aulaAtual.video_url);
      if (fileId) {
        const streamUrl = getGoogleDriveStreamUrl(fileId);
        setGoogleDriveUrl(streamUrl);
        setPlayerReady(true);
      } else {
        setPlayerError('Erro ao processar link do Google Drive. Verifique o formato da URL.');
        setGoogleDriveUrl(null);
      }
    } else {
      setGoogleDriveUrl(null);
    }
  }, [aulaAtual?.video_url, selectedAulaId]);

  // Carregar URL embed do YouTube através de Edge Function (oculta URL direta)
  useEffect(() => {
    const loadYouTubeEmbed = async () => {
      if (!aulaAtual?.video_url) {
        setYoutubeEmbedUrl(null);
        return;
      }
      
      const youtubeId = getYouTubeId(aulaAtual.video_url);
      if (!youtubeId) {
        setYoutubeEmbedUrl(null);
        return;
      }

      try {
        // Verificar autenticação
        const { data: { session } } = await supabase.auth.getSession();
        if (!session) {
          setPlayerError('Você precisa estar autenticado para assistir vídeos.');
          return;
        }

        // Chamar Edge Function para obter URL embed (valida acesso e oculta URL)
        const { data, error } = await supabase.functions.invoke('youtube-proxy', {
          body: { youtubeId },
        });

        if (error) {
          console.error('Erro ao chamar Edge Function:', error);
          // Fallback: gerar URL embed diretamente (menos seguro, mas funciona)
          const embedUrl = `https://www.youtube.com/embed/${youtubeId}?rel=0&modestbranding=1&showinfo=0&controls=1&fs=1&cc_load_policy=0&iv_load_policy=3&enablejsapi=1&origin=${window.location.origin}`;
          setYoutubeEmbedUrl(embedUrl);
          setPlayerReady(true);
        } else if (data?.embedUrl) {
          setYoutubeEmbedUrl(data.embedUrl);
          setPlayerReady(true);
        } else {
          // Fallback se Edge Function não retornar URL
          const embedUrl = `https://www.youtube.com/embed/${youtubeId}?rel=0&modestbranding=1&showinfo=0&controls=1&fs=1&cc_load_policy=0&iv_load_policy=3&enablejsapi=1&origin=${window.location.origin}`;
          setYoutubeEmbedUrl(embedUrl);
          setPlayerReady(true);
        }
      } catch (error) {
        console.error('Erro ao carregar YouTube embed:', error);
        // Fallback em caso de erro
        const youtubeId = getYouTubeId(aulaAtual.video_url);
        if (youtubeId) {
          const embedUrl = `https://www.youtube.com/embed/${youtubeId}?rel=0&modestbranding=1&showinfo=0&controls=1&fs=1&cc_load_policy=0&iv_load_policy=3&enablejsapi=1&origin=${window.location.origin}`;
          setYoutubeEmbedUrl(embedUrl);
          setPlayerReady(true);
        } else {
          setPlayerError('Erro ao carregar vídeo do YouTube.');
        }
      }
    };

    loadYouTubeEmbed();
  }, [aulaAtual?.video_url, selectedAulaId]);

  // Bloquear ações de compartilhamento e proteção
  useEffect(() => {
    // Bloquear clique direito
    const handleContextMenu = (e: MouseEvent) => {
      e.preventDefault();
      return false;
    };

    // Bloquear F12, Ctrl+Shift+I, Ctrl+U, etc.
    const handleKeyDown = (e: KeyboardEvent) => {
      // F12
      if (e.key === 'F12') {
        e.preventDefault();
        return false;
      }
      // Ctrl+Shift+I (DevTools)
      if (e.ctrlKey && e.shiftKey && e.key === 'I') {
        e.preventDefault();
        return false;
      }
      // Ctrl+Shift+J (Console)
      if (e.ctrlKey && e.shiftKey && e.key === 'J') {
        e.preventDefault();
        return false;
      }
      // Ctrl+U (View Source)
      if (e.ctrlKey && e.key === 'u') {
        e.preventDefault();
        return false;
      }
      // Ctrl+S (Save)
      if (e.ctrlKey && e.key === 's') {
        e.preventDefault();
        return false;
      }
    };

    // Bloquear seleção de texto no player
    const handleSelectStart = (e: Event) => {
      const target = e.target as HTMLElement;
      if (target.closest('.video-player-container')) {
        e.preventDefault();
        return false;
      }
    };

    // Bloquear drag and drop
    const handleDragStart = (e: DragEvent) => {
      const target = e.target as HTMLElement;
      if (target.closest('.video-player-container')) {
        e.preventDefault();
        return false;
      }
    };

    document.addEventListener('contextmenu', handleContextMenu);
    document.addEventListener('keydown', handleKeyDown);
    document.addEventListener('selectstart', handleSelectStart);
    document.addEventListener('dragstart', handleDragStart);

    return () => {
      document.removeEventListener('contextmenu', handleContextMenu);
      document.removeEventListener('keydown', handleKeyDown);
      document.removeEventListener('selectstart', handleSelectStart);
      document.removeEventListener('dragstart', handleDragStart);
    };
  }, []);

  // Resetar estado quando trocar de aula
  useEffect(() => {
    setPlayerError(null);
    setPlayerReady(false);
    setVideoCurrentTime(0);
    setVideoDuration(0);
    setYoutubeEmbedUrl(null);
    setGoogleDriveUrl(null);
  }, [selectedAulaId]);

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
                  <div className="aspect-video bg-black rounded-lg overflow-hidden relative group video-player-container">
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
                      // Prioridade 1: Supabase Storage (vídeos privados)
                      if (isSupabaseVideo(aulaAtual.video_url)) {
                        if (!supabaseVideoUrl) {
                          return (
                            <div className="w-full h-full flex items-center justify-center text-white p-4">
                              <div className="text-center">
                                <p className="text-sm">Carregando vídeo privado...</p>
                              </div>
                            </div>
                          );
                        }

                        return (
                          <>
                            <video
                              ref={videoRef}
                              src={supabaseVideoUrl}
                              className="w-full h-full"
                              controls
                              controlsList="nodownload noplaybackrate"
                              disablePictureInPicture
                              onLoadedMetadata={() => {
                                if (videoRef.current) {
                                  setVideoDuration(videoRef.current.duration);
                                  setPlayerReady(true);
                                }
                              }}
                              onTimeUpdate={() => {
                                if (videoRef.current) {
                                  const time = videoRef.current.currentTime;
                                  setVideoCurrentTime(time);
                                  
                                  // Atualizar progresso
                                  if (user && aulaAtual && videoDuration > 0) {
                                    const progressPercent = Math.round((time / videoDuration) * 100);
                                    const currentProgress = progresso?.[aulaAtual.id]?.progresso || 0;
                                    
                                    if (progressPercent > currentProgress + 10) {
                                      updateProgressMutation.mutate({
                                        aulaId: aulaAtual.id,
                                        progresso: progressPercent,
                                        concluida: progressPercent >= 90,
                                      });
                                    }
                                  }
                                }
                              }}
                              onEnded={() => {
                                if (user && aulaAtual) {
                                  updateProgressMutation.mutate({
                                    aulaId: aulaAtual.id,
                                    progresso: 100,
                                    concluida: true,
                                  });
                                  toast.success("Aula concluída!");
                                }
                              }}
                              onPlay={() => {
                                if (user && aulaAtual && !progresso?.[aulaAtual.id]) {
                                  updateProgressMutation.mutate({
                                    aulaId: aulaAtual.id,
                                    progresso: 5,
                                    concluida: false,
                                  });
                                }
                              }}
                              onContextMenu={(e) => e.preventDefault()}
                              style={{ userSelect: 'none' }}
                            />
                            
                            {/* Overlay de proteção */}
                            <div 
                              className="absolute inset-0 pointer-events-none z-10"
                              onContextMenu={(e) => e.preventDefault()}
                              style={{ userSelect: 'none' }}
                            >
                              <div className="absolute top-4 right-4 bg-primary/90 backdrop-blur-sm rounded-lg px-3 py-1.5 text-white text-xs font-medium">
                                Comunidade IA - Conteúdo Privado
                              </div>
                            </div>
                          </>
                        );
                      }

                      // Prioridade 2: Google Drive
                      if (isGoogleDriveVideo(aulaAtual.video_url)) {
                        if (!googleDriveUrl) {
                          return (
                            <div className="w-full h-full flex items-center justify-center text-white p-4">
                              <div className="text-center">
                                <p className="text-sm">Carregando vídeo do Google Drive...</p>
                              </div>
                            </div>
                          );
                        }

                        return (
                          <>
                            <iframe
                              src={googleDriveUrl}
                              className="w-full h-full"
                              allow="autoplay; fullscreen"
                              allowFullScreen
                              title={aulaAtual.titulo}
                              onLoad={() => {
                                setPlayerReady(true);
                                setPlayerError(null);
                              }}
                              onError={() => {
                                setPlayerError('Erro ao carregar o vídeo do Google Drive. Verifique se o arquivo está compartilhado corretamente.');
                              }}
                              style={{
                                userSelect: 'none',
                                WebkitUserSelect: 'none',
                              }}
                            />
                            
                            {/* Overlay de proteção */}
                            <div 
                              className="absolute inset-0 pointer-events-none z-10"
                              onContextMenu={(e) => {
                                e.preventDefault();
                                toast.error("Compartilhamento não permitido. Este é conteúdo privado da comunidade.");
                              }}
                              style={{ userSelect: 'none' }}
                            >
                              <div className="absolute top-4 right-4 bg-primary/90 backdrop-blur-sm rounded-lg px-3 py-1.5 text-white text-xs font-medium">
                                Comunidade IA - Google Drive
                              </div>
                            </div>
                          </>
                        );
                      }

                      // Prioridade 3: YouTube e Vimeo
                      const youtubeId = getYouTubeId(aulaAtual.video_url);
                      const vimeoId = getVimeoId(aulaAtual.video_url);
                      
                      if (youtubeId) {
                        if (!youtubeEmbedUrl) {
                          return (
                            <div className="w-full h-full flex items-center justify-center text-white p-4">
                              <div className="text-center">
                                <p className="text-sm">Carregando vídeo...</p>
                              </div>
                            </div>
                          );
                        }

                        return (
                          <>
                            {/* Aviso sobre YouTube */}
                            <div className="absolute top-0 left-0 right-0 bg-yellow-500/90 text-black text-xs p-2 z-20 text-center font-semibold">
                              ⚠️ ATENÇÃO: Vídeos do YouTube podem ser compartilhados. Para conteúdo privado, use Supabase Storage.
                            </div>
                            
                            {/* Container com proteções */}
                            <div className="relative w-full h-full" style={{ isolation: 'isolate' }}>
                              <iframe
                                ref={iframeRef}
                                src={youtubeEmbedUrl}
                                className="w-full h-full"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowFullScreen
                                title={aulaAtual.titulo}
                                sandbox="allow-same-origin allow-scripts allow-popups allow-presentation"
                                style={{
                                  pointerEvents: 'auto',
                                  userSelect: 'none',
                                  WebkitUserSelect: 'none',
                                }}
                                onLoad={() => {
                                  console.log('✅ Player YouTube carregado!');
                                  setPlayerReady(true);
                                  setPlayerError(null);
                                  
                                  // Tentar ocultar elementos do YouTube via CSS (limitado)
                                  if (iframeRef.current?.contentWindow) {
                                    try {
                                      // Não podemos acessar conteúdo do iframe por segurança
                                      // Mas podemos adicionar overlay
                                    } catch (e) {
                                      // Cross-origin, não podemos acessar
                                    }
                                  }
                                }}
                                onError={() => {
                                  console.error('❌ Erro ao carregar iframe do YouTube');
                                  setPlayerError('Erro ao carregar o vídeo do YouTube.');
                                }}
                              />
                              
                              {/* Overlay de proteção que bloqueia algumas interações */}
                              <div 
                                className="absolute inset-0 pointer-events-none z-10"
                                onContextMenu={(e) => {
                                  e.preventDefault();
                                  toast.error("Compartilhamento não permitido. Este é conteúdo privado da comunidade.");
                                }}
                                style={{
                                  pointerEvents: 'auto',
                                  cursor: 'default',
                                }}
                                onClick={(e) => {
                                  // Permitir cliques no player, mas bloquear menu de contexto
                                  if (e.target === e.currentTarget) {
                                    e.stopPropagation();
                                  }
                                }}
                              >
                                {/* Badge customizado */}
                                <div className="absolute top-12 right-4 bg-primary/90 backdrop-blur-sm rounded-lg px-3 py-1.5 text-white text-xs font-medium pointer-events-none">
                                  Comunidade IA
                                </div>
                                
                                {/* Overlay invisível que bloqueia algumas ações */}
                                <div 
                                  className="absolute top-0 left-0 w-full h-12 pointer-events-auto"
                                  style={{
                                    background: 'transparent',
                                    cursor: 'default',
                                  }}
                                  onContextMenu={(e) => {
                                    e.preventDefault();
                                    e.stopPropagation();
                                    return false;
                                  }}
                                />
                              </div>
                            </div>
                          </>
                        );
                      }
                      
                      if (vimeoId) {
                        return (
                          <iframe
                            src={`https://player.vimeo.com/video/${vimeoId}?badge=0&byline=0&portrait=0&title=0`}
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
                              Para conteúdo privado, use Supabase Storage. Para público, use YouTube ou Vimeo.
                            </p>
                            <p className="text-xs text-gray-400 mb-2">URL recebida:</p>
                            <p className="text-xs text-gray-500 break-all mb-4">{aulaAtual.video_url}</p>
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

