import { ReactNode } from "react";
import { Navigate } from "react-router-dom";
import { useAuth } from "@/hooks/useAuth";
import { Loader2 } from "lucide-react";

interface AdminProtectedRouteProps {
  children: ReactNode;
}

export function AdminProtectedRoute({ children }: AdminProtectedRouteProps) {
  const { user, isAdmin, loading } = useAuth();

  // Debug logs
  console.log("AdminProtectedRoute:", { user: !!user, isAdmin, loading });

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
      </div>
    );
  }

  if (!user) {
    console.log("AdminProtectedRoute: Redirecionando para /auth (sem usuário)");
    return <Navigate to="/auth" replace />;
  }

  if (!isAdmin) {
    console.log("AdminProtectedRoute: Redirecionando para /dashboard (não é admin)");
    return <Navigate to="/dashboard" replace />;
  }

  console.log("AdminProtectedRoute: Permitindo acesso admin");
  return <>{children}</>;
}

