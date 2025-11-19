import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { ExternalLink } from "lucide-react";
import { Input } from "@/components/ui/input";
import { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

export default function Ferramentas() {
  const [searchTerm, setSearchTerm] = useState("");

  // Buscar ferramentas do banco
  const { data: ferramentas, isLoading } = useQuery({
    queryKey: ["ferramentas"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("ferramentas")
        .select("*")
        .eq("ativo", true)
        .order("ordem", { ascending: true });

      if (error) throw error;
      return data;
    },
  });

  const categorias = ["Todas", ...new Set(ferramentas?.map((f) => f.categoria) || [])];

  const filteredFerramentas = ferramentas?.filter((f) =>
    f.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
    f.descricao.toLowerCase().includes(searchTerm.toLowerCase())
  ) || [];

  return (
    <Layout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold">Ferramentas de IA</h1>
          <p className="text-muted-foreground">
            Descubra as melhores ferramentas de IA para seu trabalho
          </p>
        </div>

        <div className="flex flex-col sm:flex-row gap-4">
          <Input
            placeholder="Buscar ferramentas..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="max-w-sm"
          />
        </div>

        {isLoading ? (
          <div className="text-center py-8 text-muted-foreground">
            Carregando ferramentas...
          </div>
        ) : filteredFerramentas.length > 0 ? (
          <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
            {filteredFerramentas.map((ferramenta) => (
              <Card key={ferramenta.id}>
                <CardHeader>
                  <div className="flex items-start justify-between gap-2">
                    <CardTitle>{ferramenta.nome}</CardTitle>
                    <Badge variant="outline">{ferramenta.categoria}</Badge>
                  </div>
                  <CardDescription>{ferramenta.descricao}</CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                  {ferramenta.casos_uso && ferramenta.casos_uso.length > 0 && (
                    <div className="flex flex-wrap gap-2">
                      {ferramenta.casos_uso.map((caso, idx) => (
                        <Badge key={idx} variant="secondary">
                          {caso}
                        </Badge>
                      ))}
                    </div>
                  )}
                  <div className="flex items-center justify-between">
                    <span className="text-sm font-medium">{ferramenta.preco}</span>
                    <Button size="sm" asChild>
                      <a href={ferramenta.link} target="_blank" rel="noopener noreferrer">
                        Acessar
                        <ExternalLink className="ml-2 h-4 w-4" />
                      </a>
                    </Button>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        ) : (
          <div className="text-center py-8 text-muted-foreground">
            Nenhuma ferramenta encontrada.
          </div>
        )}
      </div>
    </Layout>
  );
}
