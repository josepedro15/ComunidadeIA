import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Copy, Check } from "lucide-react";
import { Input } from "@/components/ui/input";
import { useState } from "react";
import { toast } from "sonner";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

export default function Prompts() {
  const [searchTerm, setSearchTerm] = useState("");
  const [copiedId, setCopiedId] = useState<string | null>(null);

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

  const categorias = ["Todas", ...new Set(prompts?.map((p) => p.categoria) || [])];

  const filteredPrompts = prompts?.filter((p) =>
    p.titulo.toLowerCase().includes(searchTerm.toLowerCase()) ||
    p.categoria.toLowerCase().includes(searchTerm.toLowerCase()) ||
    p.conteudo.toLowerCase().includes(searchTerm.toLowerCase())
  ) || [];

  const copyToClipboard = (texto: string, id: string) => {
    navigator.clipboard.writeText(texto);
    setCopiedId(id);
    toast.success("Prompt copiado!");
    setTimeout(() => setCopiedId(null), 2000);
  };

  return (
    <Layout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold">Biblioteca de Prompts</h1>
          <p className="text-muted-foreground">
            Prompts testados e otimizados para diferentes casos de uso
          </p>
        </div>

        <div className="flex flex-col sm:flex-row gap-4">
          <Input
            placeholder="Buscar prompts..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="max-w-sm"
          />
        </div>

        {isLoading ? (
          <div className="text-center py-8 text-muted-foreground">
            Carregando prompts...
          </div>
        ) : filteredPrompts.length > 0 ? (
          <div className="grid gap-6 md:grid-cols-2">
            {filteredPrompts.map((prompt) => (
              <Card key={prompt.id}>
                <CardHeader>
                  <div className="flex items-start justify-between gap-2">
                    <CardTitle>{prompt.titulo}</CardTitle>
                    <div className="flex gap-2">
                      <Badge>{prompt.categoria}</Badge>
                      {prompt.subcategoria && (
                        <Badge variant="outline">{prompt.subcategoria}</Badge>
                      )}
                    </div>
                  </div>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="rounded-lg bg-muted p-4 text-sm font-mono whitespace-pre-wrap max-h-48 overflow-y-auto">
                    {prompt.conteudo}
                  </div>
                  <Button
                    size="sm"
                    variant="outline"
                    className="w-full"
                    onClick={() => copyToClipboard(prompt.conteudo, prompt.id)}
                  >
                    {copiedId === prompt.id ? (
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
                </CardContent>
              </Card>
            ))}
          </div>
        ) : (
          <div className="text-center py-8 text-muted-foreground">
            Nenhum prompt encontrado.
          </div>
        )}
      </div>
    </Layout>
  );
}
