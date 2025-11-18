import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { toast } from "sonner";

export default function Perfil() {
  const handleSave = () => {
    toast.success("Perfil atualizado com sucesso!");
  };

  return (
    <Layout>
      <div className="space-y-6 max-w-2xl">
        <div>
          <h1 className="text-3xl font-bold">Meu Perfil</h1>
          <p className="text-muted-foreground">
            Gerencie suas informações pessoais e preferências
          </p>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Informações Pessoais</CardTitle>
            <CardDescription>Atualize seus dados pessoais</CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="flex items-center gap-4">
              <Avatar className="h-20 w-20">
                <AvatarImage src="https://github.com/shadcn.png" />
                <AvatarFallback>JD</AvatarFallback>
              </Avatar>
              <Button variant="outline">Alterar Foto</Button>
            </div>

            <div className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="nome">Nome Completo</Label>
                <Input id="nome" defaultValue="João da Silva" />
              </div>

              <div className="space-y-2">
                <Label htmlFor="email">Email</Label>
                <Input id="email" type="email" defaultValue="joao@email.com" />
              </div>

              <div className="space-y-2">
                <Label htmlFor="telefone">Telefone</Label>
                <Input id="telefone" type="tel" defaultValue="(11) 98765-4321" />
              </div>

              <Button onClick={handleSave}>Salvar Alterações</Button>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Plano Atual</CardTitle>
            <CardDescription>Informações sobre sua assinatura</CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="font-semibold">Plano Essencial</p>
                <p className="text-sm text-muted-foreground">Acesso a módulos básicos</p>
              </div>
              <Badge className="bg-green-500">Ativo</Badge>
            </div>

            <div className="space-y-2 pt-4 border-t">
              <p className="text-sm font-medium">Benefícios incluídos:</p>
              <ul className="text-sm text-muted-foreground space-y-1">
                <li>✓ Acesso a módulos essenciais</li>
                <li>✓ Biblioteca de prompts básica</li>
                <li>✓ Ferramentas de IA gratuitas</li>
                <li>✓ Gravações de lives</li>
              </ul>
            </div>

            <Button variant="outline" className="w-full">
              Fazer Upgrade
            </Button>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Estatísticas</CardTitle>
            <CardDescription>Seu progresso na plataforma</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid gap-4 md:grid-cols-2">
              <div className="space-y-1">
                <p className="text-sm text-muted-foreground">Total de Aulas</p>
                <p className="text-2xl font-bold">45/120</p>
              </div>
              <div className="space-y-1">
                <p className="text-sm text-muted-foreground">Horas de Estudo</p>
                <p className="text-2xl font-bold">24h</p>
              </div>
              <div className="space-y-1">
                <p className="text-sm text-muted-foreground">Módulos Completos</p>
                <p className="text-2xl font-bold">3/10</p>
              </div>
              <div className="space-y-1">
                <p className="text-sm text-muted-foreground">Certificados</p>
                <p className="text-2xl font-bold">2</p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
}
