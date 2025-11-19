import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { ProtectedRoute } from "@/components/auth/ProtectedRoute";
import { AdminProtectedRoute } from "@/components/auth/AdminProtectedRoute";
import Index from "./pages/Index";
import Auth from "./pages/Auth";
import Dashboard from "./pages/Dashboard";
import Modulos from "./pages/Modulos";
import Ferramentas from "./pages/Ferramentas";
import Prompts from "./pages/Prompts";
import Lives from "./pages/Lives";
import Perfil from "./pages/Perfil";
import NotFound from "./pages/NotFound";
import AdminDashboard from "./pages/admin/Dashboard";
import MembrosAdmin from "./pages/admin/Membros";
import PromptsAdmin from "./pages/admin/Prompts";
import LivesAdmin from "./pages/admin/Lives";
import FerramentasAdmin from "./pages/admin/Ferramentas";
import ModulosAdmin from "./pages/admin/Modulos";

const queryClient = new QueryClient();

const App = () => (
  <QueryClientProvider client={queryClient}>
    <TooltipProvider>
      <Toaster />
      <Sonner />
      <BrowserRouter>
        <Routes>
          {/* Rotas públicas */}
          <Route path="/" element={<Index />} />
          <Route path="/auth" element={<Auth />} />
          
          {/* Rotas protegidas (apenas membros) */}
          <Route
            path="/dashboard"
            element={
              <ProtectedRoute>
                <Dashboard />
              </ProtectedRoute>
            }
          />
          <Route
            path="/modulos"
            element={
              <ProtectedRoute>
                <Modulos />
              </ProtectedRoute>
            }
          />
          <Route
            path="/ferramentas"
            element={
              <ProtectedRoute>
                <Ferramentas />
              </ProtectedRoute>
            }
          />
          <Route
            path="/prompts"
            element={
              <ProtectedRoute>
                <Prompts />
              </ProtectedRoute>
            }
          />
          <Route
            path="/lives"
            element={
              <ProtectedRoute>
                <Lives />
              </ProtectedRoute>
            }
          />
          <Route
            path="/perfil"
            element={
              <ProtectedRoute>
                <Perfil />
              </ProtectedRoute>
            }
          />
          
          {/* Rotas administrativas (apenas admins) */}
          <Route
            path="/admin/dashboard"
            element={
              <AdminProtectedRoute>
                <AdminDashboard />
              </AdminProtectedRoute>
            }
          />
          <Route
            path="/admin/membros"
            element={
              <AdminProtectedRoute>
                <MembrosAdmin />
              </AdminProtectedRoute>
            }
          />
          <Route
            path="/admin/prompts"
            element={
              <AdminProtectedRoute>
                <PromptsAdmin />
              </AdminProtectedRoute>
            }
          />
          <Route
            path="/admin/lives"
            element={
              <AdminProtectedRoute>
                <LivesAdmin />
              </AdminProtectedRoute>
            }
          />
          <Route
            path="/admin/ferramentas"
            element={
              <AdminProtectedRoute>
                <FerramentasAdmin />
              </AdminProtectedRoute>
            }
          />
          <Route
            path="/admin/modulos"
            element={
              <AdminProtectedRoute>
                <ModulosAdmin />
              </AdminProtectedRoute>
            }
          />
          
          {/* 404 */}
          <Route path="*" element={<NotFound />} />
        </Routes>
      </BrowserRouter>
    </TooltipProvider>
  </QueryClientProvider>
);

export default App;
