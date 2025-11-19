import { useState, useEffect } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Alert, AlertDescription } from "@/components/ui/alert";
import { useAuth } from "@/hooks/useAuth";
import { toast } from "sonner";
import { Loader2, AlertCircle, Mail } from "lucide-react";
import { Link } from "react-router-dom";

export default function Auth() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const { user, signIn, resetPassword, loading } = useAuth();
  const [isLoading, setIsLoading] = useState(false);
  const [isRecovering, setIsRecovering] = useState(false);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [recoverEmail, setRecoverEmail] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const type = searchParams.get("type");

  useEffect(() => {
    // Se já estiver logado, redireciona
    if (user && !loading) {
      navigate("/dashboard", { replace: true });
    }
  }, [user, loading, navigate]);

  const handleLogin = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError(null);
    setIsLoading(true);

    try {
      const { error } = await signIn(email, password);

      if (error) {
        // Mensagens de erro mais amigáveis
        let errorMessage = error.message;
        
        if (error.message === "Invalid login credentials") {
          errorMessage = "Email ou senha incorretos";
        } else if (error.message.includes("Invalid API key") || error.message.includes("401")) {
          errorMessage = "Erro de configuração: Verifique as variáveis de ambiente do Supabase na Vercel";
          console.error("❌ Erro de API Key:", error);
        } else if (error.message.includes("Network") || error.message.includes("fetch")) {
          errorMessage = "Erro de conexão. Verifique sua internet e tente novamente";
        }
        
        setError(errorMessage);
        toast.error("Erro ao fazer login");
      } else {
        toast.success("Login realizado com sucesso!");
        navigate("/dashboard");
      }
    } catch (err: any) {
      console.error("Erro inesperado no login:", err);
      setError("Erro inesperado. Tente novamente ou entre em contato com o suporte.");
      toast.error("Erro ao fazer login");
    } finally {
      setIsLoading(false);
    }
  };

  const handleRecoverPassword = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError(null);
    setSuccess(null);
    setIsRecovering(true);

    const { error } = await resetPassword(recoverEmail);

    if (error) {
      setError(error.message);
      toast.error("Erro ao enviar email de recuperação");
    } else {
      setSuccess("Email de recuperação enviado! Verifique sua caixa de entrada.");
      toast.success("Email enviado com sucesso!");
      setRecoverEmail("");
    }

    setIsRecovering(false);
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-primary/10 via-background to-accent/10">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
      </div>
    );
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-primary/10 via-background to-accent/10 p-4">
      <Card className="w-full max-w-md">
        <CardHeader className="space-y-1">
          <CardTitle className="text-2xl font-bold text-center">Comunidade IA</CardTitle>
          <CardDescription className="text-center">
            {type === "reset" 
              ? "Recupere sua senha" 
              : "Acesse sua conta"}
          </CardDescription>
        </CardHeader>
        <CardContent>
          {type === "reset" ? (
            // Formulário de recuperação de senha
            <form onSubmit={handleRecoverPassword} className="space-y-4">
              {error && (
                <Alert variant="destructive">
                  <AlertCircle className="h-4 w-4" />
                  <AlertDescription>{error}</AlertDescription>
                </Alert>
              )}
              {success && (
                <Alert>
                  <Mail className="h-4 w-4" />
                  <AlertDescription>{success}</AlertDescription>
                </Alert>
              )}
              <div className="space-y-2">
                <Label htmlFor="recover-email">Email</Label>
                <Input
                  id="recover-email"
                  type="email"
                  placeholder="seu@email.com"
                  value={recoverEmail}
                  onChange={(e) => setRecoverEmail(e.target.value)}
                  required
                />
              </div>
              <Button type="submit" className="w-full" disabled={isRecovering}>
                {isRecovering ? (
                  <>
                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                    Enviando...
                  </>
                ) : (
                  "Enviar email de recuperação"
                )}
              </Button>
              <div className="text-center text-sm">
                <Link
                  to="/auth"
                  className="text-primary hover:underline"
                >
                  Voltar para login
                </Link>
              </div>
            </form>
          ) : (
            // Formulário de login
            <form onSubmit={handleLogin} className="space-y-4">
              {error && (
                <Alert variant="destructive">
                  <AlertCircle className="h-4 w-4" />
                  <AlertDescription>{error}</AlertDescription>
                </Alert>
              )}
              <div className="space-y-2">
                <Label htmlFor="login-email">Email</Label>
                <Input
                  id="login-email"
                  type="email"
                  placeholder="seu@email.com"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
                />
              </div>
              <div className="space-y-2">
                <div className="flex items-center justify-between">
                  <Label htmlFor="login-password">Senha</Label>
                  <Link
                    to="/auth?type=reset"
                    className="text-sm text-primary hover:underline"
                  >
                    Esqueceu a senha?
                  </Link>
                </div>
                <Input
                  id="login-password"
                  type="password"
                  placeholder="••••••••"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                />
              </div>
              <Button type="submit" className="w-full" disabled={isLoading}>
                {isLoading ? (
                  <>
                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                    Entrando...
                  </>
                ) : (
                  "Entrar"
                )}
              </Button>
              <div className="text-center text-sm text-muted-foreground">
                <p>
                  Não tem uma conta?{" "}
                  <span className="text-primary font-medium">
                    Entre em contato para adquirir acesso
                  </span>
                </p>
              </div>
            </form>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
