import { Layout } from "@/components/Layout";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Copy, Check, Search, Eye } from "lucide-react";
import { Input } from "@/components/ui/input";
import { Tabs, TabsList, TabsTrigger, TabsContent } from "@/components/ui/tabs";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { useState, useMemo, useEffect } from "react";
import { toast } from "sonner";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

const ITEMS_PER_PAGE = 12;

export default function Prompts() {
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedCategory, setSelectedCategory] = useState<string>("Todas");
  const [selectedSubcategory, setSelectedSubcategory] = useState<string>("Todas");
  const [currentPage, setCurrentPage] = useState(1);
  const [copiedId, setCopiedId] = useState<string | null>(null);
  const [selectedPrompt, setSelectedPrompt] = useState<any>(null);
  const [sortBy, setSortBy] = useState<"ordem" | "titulo" | "categoria">("ordem");

  // Buscar prompts do banco
  const { data: prompts, isLoading } = useQuery({
    queryKey: ["prompts"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("prompts")
        .select("*")
        .eq("ativo", true)
        .order("ordem", { ascending: true });

      if (error) throw error;
      return data;
    },
  });

  // Calcular categorias e subcategorias disponíveis
  const categorias = useMemo(() => {
    if (!prompts) return [];
    const cats = new Set(prompts.map((p) => p.categoria));
    return ["Todas", ...Array.from(cats).sort()];
  }, [prompts]);

  const subcategorias = useMemo(() => {
    if (!prompts || selectedCategory === "Todas") return [];
    const filtered = prompts.filter((p) => p.categoria === selectedCategory);
    const subs = new Set(
      filtered
        .map((p) => p.subcategoria)
        .filter((s): s is string => s !== null && s !== undefined)
    );
    return ["Todas", ...Array.from(subs).sort()];
  }, [prompts, selectedCategory]);

  // Filtrar e ordenar prompts
  const filteredAndSortedPrompts = useMemo(() => {
    if (!prompts) return [];

    let filtered = prompts.filter((p) => {
      // Filtro por categoria
      if (selectedCategory !== "Todas" && p.categoria !== selectedCategory) {
        return false;
      }

      // Filtro por subcategoria
      if (selectedSubcategory !== "Todas") {
        if (!p.subcategoria || p.subcategoria !== selectedSubcategory) {
          return false;
        }
      }

      // Filtro por busca
      if (searchTerm) {
        const searchLower = searchTerm.toLowerCase();
        return (
          p.titulo.toLowerCase().includes(searchLower) ||
          p.categoria.toLowerCase().includes(searchLower) ||
          (p.subcategoria && p.subcategoria.toLowerCase().includes(searchLower)) ||
          p.conteudo.toLowerCase().includes(searchLower)
        );
      }

      return true;
    });

    // Ordenar
    filtered.sort((a, b) => {
      switch (sortBy) {
        case "titulo":
          return a.titulo.localeCompare(b.titulo);
        case "categoria":
          return a.categoria.localeCompare(b.categoria) || a.ordem - b.ordem;
        case "ordem":
        default:
          return a.ordem - b.ordem;
      }
    });

    return filtered;
  }, [prompts, selectedCategory, selectedSubcategory, searchTerm, sortBy]);

  // Paginação
  const totalPages = Math.ceil(filteredAndSortedPrompts.length / ITEMS_PER_PAGE);
  const paginatedPrompts = useMemo(() => {
    const start = (currentPage - 1) * ITEMS_PER_PAGE;
    const end = start + ITEMS_PER_PAGE;
    return filteredAndSortedPrompts.slice(start, end);
  }, [filteredAndSortedPrompts, currentPage]);

  // Resetar página quando filtros mudarem
  useEffect(() => {
    setCurrentPage(1);
  }, [selectedCategory, selectedSubcategory, searchTerm]);

  // Contar prompts por categoria
  const countByCategory = useMemo(() => {
    if (!prompts) return {};
    const counts: Record<string, number> = {};
    prompts.forEach((p) => {
      counts[p.categoria] = (counts[p.categoria] || 0) + 1;
    });
    return counts;
  }, [prompts]);

  const copyToClipboard = (texto: string, id: string) => {
    navigator.clipboard.writeText(texto);
    setCopiedId(id);
    toast.success("Prompt copiado!");
    setTimeout(() => setCopiedId(null), 2000);
  };

  const getPreview = (conteudo: string, maxLength: number = 150) => {
    if (conteudo.length <= maxLength) return conteudo;
    return conteudo.substring(0, maxLength).trim() + "...";
  };

  return (
    <Layout>
      <div className="space-y-6">
        {/* Header */}
        <div>
          <h1 className="text-3xl font-bold">Biblioteca de Prompts</h1>
          <p className="text-muted-foreground">
            {filteredAndSortedPrompts.length} prompt(s) encontrado(s)
            {selectedCategory !== "Todas" && ` em ${selectedCategory}`}
          </p>
        </div>

        {/* Busca e Filtros */}
        <div className="flex flex-col sm:flex-row gap-4">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              placeholder="Buscar por título, categoria ou conteúdo..."
              value={searchTerm}
              onChange={(e) => {
                setSearchTerm(e.target.value);
                setCurrentPage(1);
              }}
              className="pl-10"
            />
          </div>
          <Select value={sortBy} onValueChange={(v: any) => setSortBy(v)}>
            <SelectTrigger className="w-[180px]">
              <SelectValue placeholder="Ordenar por" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="ordem">Ordem (padrão)</SelectItem>
              <SelectItem value="titulo">Título (A-Z)</SelectItem>
              <SelectItem value="categoria">Categoria</SelectItem>
            </SelectContent>
          </Select>
        </div>

        {/* Tabs de Categorias */}
        <Tabs value={selectedCategory} onValueChange={(v) => {
          setSelectedCategory(v);
          setSelectedSubcategory("Todas");
          setCurrentPage(1);
        }}>
          <TabsList className="grid w-full grid-cols-3 sm:grid-cols-6">
            {categorias.map((cat) => (
              <TabsTrigger key={cat} value={cat} className="text-xs sm:text-sm">
                {cat}
                {cat !== "Todas" && (
                  <Badge variant="secondary" className="ml-2 text-xs">
                    {countByCategory[cat] || 0}
                  </Badge>
                )}
              </TabsTrigger>
            ))}
          </TabsList>

          {/* Filtro de Subcategoria */}
          {selectedCategory !== "Todas" && subcategorias.length > 1 && (
            <div className="mt-4">
              <Select
                value={selectedSubcategory}
                onValueChange={(v) => {
                  setSelectedSubcategory(v);
                  setCurrentPage(1);
                }}
              >
                <SelectTrigger className="w-[200px]">
                  <SelectValue placeholder="Subcategoria" />
                </SelectTrigger>
                <SelectContent>
                  {subcategorias.map((sub) => (
                    <SelectItem key={sub} value={sub}>
                      {sub}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          )}
        </Tabs>

        {/* Grid de Prompts */}
        {isLoading ? (
          <div className="text-center py-12 text-muted-foreground">
            Carregando prompts...
          </div>
        ) : paginatedPrompts.length > 0 ? (
          <>
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
              {paginatedPrompts.map((prompt) => (
                <Card key={prompt.id} className="flex flex-col hover:shadow-md transition-shadow">
                  <CardHeader className="pb-3">
                    <div className="flex items-start justify-between gap-2">
                      <CardTitle className="text-base line-clamp-2">{prompt.titulo}</CardTitle>
                    </div>
                    <div className="flex gap-2 flex-wrap mt-2">
                      <Badge variant="default" className="text-xs">
                        {prompt.categoria}
                      </Badge>
                      {prompt.subcategoria && (
                        <Badge variant="outline" className="text-xs">
                          {prompt.subcategoria}
                        </Badge>
                      )}
                    </div>
                  </CardHeader>
                  <CardContent className="flex-1 flex flex-col space-y-3">
                    <p className="text-sm text-muted-foreground line-clamp-3 flex-1">
                      {getPreview(prompt.conteudo)}
                    </p>
                    <div className="flex gap-2">
                      <Dialog>
                        <DialogTrigger asChild>
                          <Button
                            variant="outline"
                            size="sm"
                            className="flex-1"
                            onClick={() => setSelectedPrompt(prompt)}
                          >
                            <Eye className="mr-2 h-4 w-4" />
                            Ver mais
                          </Button>
                        </DialogTrigger>
                        <DialogContent className="max-w-2xl max-h-[80vh] overflow-y-auto">
                          <DialogHeader>
                            <DialogTitle>{selectedPrompt?.titulo || prompt.titulo}</DialogTitle>
                            <DialogDescription>
                              <div className="flex gap-2 mt-2">
                                <Badge>{selectedPrompt?.categoria || prompt.categoria}</Badge>
                                {(selectedPrompt?.subcategoria || prompt.subcategoria) && (
                                  <Badge variant="outline">
                                    {selectedPrompt?.subcategoria || prompt.subcategoria}
                                  </Badge>
                                )}
                              </div>
                            </DialogDescription>
                          </DialogHeader>
                          <div className="rounded-lg bg-muted p-4 text-sm font-mono whitespace-pre-wrap my-4">
                            {(selectedPrompt?.conteudo || prompt.conteudo)}
                          </div>
                          <DialogFooter>
                            <Button
                              onClick={() => {
                                copyToClipboard(
                                  selectedPrompt?.conteudo || prompt.conteudo,
                                  selectedPrompt?.id || prompt.id
                                );
                              }}
                              className="w-full sm:w-auto"
                            >
                              {copiedId === (selectedPrompt?.id || prompt.id) ? (
                                <>
                                  <Check className="mr-2 h-4 w-4" />
                                  Copiado!
                                </>
                              ) : (
                                <>
                                  <Copy className="mr-2 h-4 w-4" />
                                  Copiar Prompt
                                </>
                              )}
                            </Button>
                          </DialogFooter>
                        </DialogContent>
                      </Dialog>
                      <Button
                        size="sm"
                        variant="outline"
                        onClick={() => copyToClipboard(prompt.conteudo, prompt.id)}
                        className="px-3"
                      >
                        {copiedId === prompt.id ? (
                          <Check className="h-4 w-4" />
                        ) : (
                          <Copy className="h-4 w-4" />
                        )}
                      </Button>
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>

            {/* Paginação */}
            {totalPages > 1 && (
              <div className="flex items-center justify-center gap-2 pt-4">
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => setCurrentPage((p) => Math.max(1, p - 1))}
                  disabled={currentPage === 1}
                >
                  Anterior
                </Button>
                <span className="text-sm text-muted-foreground">
                  Página {currentPage} de {totalPages}
                </span>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => setCurrentPage((p) => Math.min(totalPages, p + 1))}
                  disabled={currentPage === totalPages}
                >
                  Próxima
                </Button>
              </div>
            )}
          </>
        ) : (
          <div className="text-center py-12 text-muted-foreground">
            <p className="text-lg font-semibold mb-2">Nenhum prompt encontrado</p>
            <p className="text-sm">
              Tente ajustar os filtros ou a busca para encontrar o que procura.
            </p>
          </div>
        )}
      </div>
    </Layout>
  );
}
