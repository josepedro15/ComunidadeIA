// Supabase Edge Function para fazer proxy de vídeos do YouTube
// Isso oculta a URL real do YouTube do frontend e valida acesso

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
    const authHeader = req.headers.get('Authorization')
    if (!authHeader) {
      return new Response(
        JSON.stringify({ error: 'Unauthorized - No token provided' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: authHeader },
        },
      }
    )

    const {
      data: { user },
      error: authError,
    } = await supabaseClient.auth.getUser()

    if (authError || !user) {
      return new Response(
        JSON.stringify({ error: 'Unauthorized - Invalid token' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Extrair YouTube ID do body
    const body = await req.json().catch(() => ({}))
    const youtubeId = body.youtubeId

    if (!youtubeId) {
      return new Response(
        JSON.stringify({ error: 'YouTube ID is required' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Validar formato do YouTube ID
    if (!/^[a-zA-Z0-9_-]{11}$/.test(youtubeId)) {
      return new Response(
        JSON.stringify({ error: 'Invalid YouTube ID format' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    // Buscar informações do vídeo via YouTube oEmbed API (legal e permitido)
    const oembedUrl = `https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=${youtubeId}&format=json`
    const oembedResponse = await fetch(oembedUrl)
    
    if (!oembedResponse.ok) {
      return new Response(
        JSON.stringify({ error: 'Video not found or not accessible' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      )
    }

    const oembedData = await oembedResponse.json()

    // Retornar URL embed do YouTube com validação de acesso
    // A URL é gerada no backend, ocultando do frontend
    const origin = req.headers.get('origin') || req.headers.get('referer') || '*'
    const embedUrl = `https://www.youtube.com/embed/${youtubeId}?rel=0&modestbranding=1&showinfo=0&controls=1&fs=1&cc_load_policy=0&iv_load_policy=3&enablejsapi=1&origin=${origin}`
    
    return new Response(
      JSON.stringify({
        embedUrl,
        title: oembedData.title,
        thumbnail: oembedData.thumbnail_url,
        author: oembedData.author_name,
        // Nota: Esta solução oculta a URL do frontend, mas o iframe ainda aponta para YouTube
        // Para solução completa com stream proxy, seria necessário violar ToS do YouTube
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    )
  } catch (error) {
    console.error('Error in youtube-proxy function:', error)
    return new Response(
      JSON.stringify({ error: error.message || 'Internal server error' }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    )
  }
})

