// Supabase Edge Function para fazer proxy de vídeos do YouTube
// Isso oculta a URL real do YouTube do frontend

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Verificar autenticação
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: req.headers.get('Authorization')! },
        },
      }
    )

    const {
      data: { user },
    } = await supabaseClient.auth.getUser()

    if (!user) {
      return new Response(
        JSON.stringify({ error: 'Unauthorized' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Extrair YouTube ID da query
    const url = new URL(req.url)
    const youtubeId = url.searchParams.get('id')

    if (!youtubeId) {
      return new Response(
        JSON.stringify({ error: 'YouTube ID is required' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Buscar informações do vídeo via YouTube oEmbed API (legal e permitido)
    const oembedUrl = `https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=${youtubeId}&format=json`
    const oembedResponse = await fetch(oembedUrl)
    
    if (!oembedResponse.ok) {
      return new Response(
        JSON.stringify({ error: 'Video not found' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const oembedData = await oembedResponse.json()

    // Retornar URL embed do YouTube (ainda é YouTube, mas oculta a URL direta)
    // Nota: Esta é uma solução parcial - o iframe ainda aponta para YouTube
    // Para solução completa, seria necessário fazer download/stream (viola ToS)
    
    return new Response(
      JSON.stringify({
        embedUrl: `https://www.youtube.com/embed/${youtubeId}?rel=0&modestbranding=1&showinfo=0&controls=1&fs=1&cc_load_policy=0&iv_load_policy=3&enablejsapi=1`,
        title: oembedData.title,
        thumbnail: oembedData.thumbnail_url,
        // Para solução completa com proxy de stream, seria necessário:
        // 1. Usar yt-dlp ou similar (viola ToS do YouTube)
        // 2. Fazer proxy do stream através do servidor
        // 3. Isso consome muito bandwidth e pode ser bloqueado
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    )
  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})

