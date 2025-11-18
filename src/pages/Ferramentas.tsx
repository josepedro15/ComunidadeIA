import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { ExternalLink } from "lucide-react";
import { Input } from "@/components/ui/input";
import { useState } from "react";

export default function Ferramentas() {
  const [searchTerm, setSearchTerm] = useState("");

  const ferramentas = [
    {
      id: 1,
      nome: "ChatGPT",
      categoria: "Chat IA",
      descricao: "Assistente de IA conversacional da OpenAI",
      preco: "Freemium",
      link: "https://chat.openai.com",
      casos: ["Escrita", "Programação", "Análise"],
    },
    {
      id: 2,
      nome: "Midjourney",
      categoria: "Geração de Imagens",
      descricao: "Crie imagens incríveis com IA",
      preco: "Pago",
      link: "https://midjourney.com",
      casos: ["Arte", "Design", "Marketing"],
    },
    {
      id: 3,
      nome: "Claude",
      categoria: "Chat IA",
      descricao: "IA conversacional da Anthropic",
      preco: "Freemium",
      link: "https://claude.ai",
      casos: ["Escrita", "Análise", "Pesquisa"],
    },
    {
      id: 4,
      nome: "GitHub Copilot",
      categoria: "Programação",
      descricao: "Assistente de código com IA",
      preco: "Pago",
      link: "https://copilot.github.com",
      casos: ["Desenvolvimento", "Automação"],
    },
    {
      id: 5,
      nome: "Runway ML",
      categoria: "Vídeo",
      descricao: "Edição e geração de vídeos com IA",
      preco: "Freemium",
      link: "https://runwayml.com",
      casos: ["Vídeo", "Edição", "Criação"],
    },
    {
      id: 6,
      nome: "Notion AI",
      categoria: "Produtividade",
      descricao: "IA integrada ao Notion",
      preco: "Freemium",
      link: "https://notion.so",
      casos: ["Organização", "Escrita", "Resumos"],
    },
  ];

  const categorias = ["Todas", ...new Set(ferramentas.map((f) => f.categoria))];

  const filteredFerramentas = ferramentas.filter((f) =>
    f.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
    f.descricao.toLowerCase().includes(searchTerm.toLowerCase())
  );

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
                <div className="flex flex-wrap gap-2">
                  {ferramenta.casos.map((caso, idx) => (
                    <Badge key={idx} variant="secondary">
                      {caso}
                    </Badge>
                  ))}
                </div>
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
      </div>
    </Layout>
  );
}
