import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Copy, Check } from "lucide-react";
import { Input } from "@/components/ui/input";
import { useState } from "react";
import { toast } from "sonner";

export default function Prompts() {
  const [searchTerm, setSearchTerm] = useState("");
  const [copiedId, setCopiedId] = useState<number | null>(null);

  const prompts = [
    {
      id: 1,
      titulo: "Análise de Código",
      categoria: "Programação",
      subcategoria: "Review",
      conteudo: "Analise o seguinte código e sugira melhorias em termos de performance, legibilidade e boas práticas:\n\n[Cole seu código aqui]",
    },
    {
      id: 2,
      titulo: "Criação de Conteúdo para Blog",
      categoria: "Marketing",
      subcategoria: "Conteúdo",
      conteudo: "Crie um artigo de blog completo sobre [TEMA] com os seguintes requisitos:\n- Tom: [profissional/casual]\n- Público-alvo: [descreva]\n- Palavras-chave: [liste]\n- Tamanho: [número de palavras]",
    },
    {
      id: 3,
      titulo: "Geração de Ideias de Produto",
      categoria: "Negócios",
      subcategoria: "Inovação",
      conteudo: "Gere 10 ideias inovadoras de produtos ou serviços para o setor de [SETOR], considerando:\n- Tendências atuais\n- Problemas não resolvidos\n- Oportunidades de mercado\n- Viabilidade técnica",
    },
    {
      id: 4,
      titulo: "Otimização de Prompts",
      categoria: "IA",
      subcategoria: "Engenharia",
      conteudo: "Analise e otimize o seguinte prompt para obter resultados mais precisos e relevantes:\n\n[Cole seu prompt aqui]\n\nSugira melhorias em:\n- Clareza\n- Estrutura\n- Especificidade\n- Contexto",
    },
    {
      id: 5,
      titulo: "Resumo de Documentos",
      categoria: "Produtividade",
      subcategoria: "Análise",
      conteudo: "Faça um resumo executivo do seguinte documento, destacando:\n- Principais pontos\n- Conclusões importantes\n- Ações recomendadas\n- Métricas relevantes\n\n[Cole o documento aqui]",
    },
    {
      id: 6,
      titulo: "Criação de Personas",
      categoria: "Marketing",
      subcategoria: "Estratégia",
      conteudo: "Crie 3 personas detalhadas para [PRODUTO/SERVIÇO] incluindo:\n- Demografia\n- Comportamento\n- Objetivos\n- Dores\n- Canais preferidos\n- Jornada de compra",
    },
  ];

  const categorias = ["Todas", ...new Set(prompts.map((p) => p.categoria))];

  const filteredPrompts = prompts.filter((p) =>
    p.titulo.toLowerCase().includes(searchTerm.toLowerCase()) ||
    p.categoria.toLowerCase().includes(searchTerm.toLowerCase()) ||
    p.conteudo.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const copyToClipboard = (texto: string, id: number) => {
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
      </div>
    </Layout>
  );
}
