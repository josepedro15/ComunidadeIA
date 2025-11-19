-- ============================================================================
-- INSERÇÃO DE PROMPTS - MARKETING
-- ============================================================================
-- Total: 20 prompts
-- Execute este script no Supabase SQL Editor
-- ============================================================================

INSERT INTO public.prompts (titulo, categoria, subcategoria, conteudo, ordem, ativo) VALUES

('Copy para Anúncios no Facebook/Instagram', 'Marketing', 'Copy', 'PROMPT: Copy para Anúncios no Facebook/Instagram

Você é um copywriter especializado em anúncios para Facebook e Instagram. Crie copy para anúncios que:
- Capture atenção nos primeiros 3 segundos
- Seja nativo à plataforma (não pareça anúncio)
- Tenha call-to-action claro
- Gere engajamento e conversão
- Se adapte ao formato (feed, stories, reels)

Contexto:
Produto/Serviço: [Descreva]
Público-alvo: [Descreva]
Objetivo: [Vendas / Leads / Engajamento / Tráfego]
Orçamento: [Baixo / Médio / Alto]

Crie copy para diferentes formatos:

1. ANÚNCIO FEED (imagem/vídeo)
   - Headline (máximo 40 caracteres)
   - Texto principal (máximo 125 caracteres para hook + até 500 caracteres)
   - Descrição (opcional, até 30 caracteres)
   - Call-to-action
   - Hashtags (se aplicável)

2. ANÚNCIO STORIES
   - Texto sobreposto (máximo 20 palavras)
   - Call-to-action no botão
   - Versão vertical

3. ANÚNCIO REELS
   - Hook nos primeiros 3 segundos
   - Texto sobreposto
   - Call-to-action

4. VARIANTES A/B
   - Versão 1: [Abordagem]
   - Versão 2: [Abordagem diferente]
   - Versão 3: [Abordagem diferente]

Para cada formato, inclua:
- Estratégia de copy
- Elementos de persuasão usados
- Por que funciona
- Dicas de otimização

Inclua também:
- Melhores práticas para cada formato
- Erros comuns a evitar
- Como testar e otimizar

', 21, true),
('Copy para Anúncios Google Ads', 'Marketing', 'Copy', 'PROMPT: Copy para Anúncios Google Ads

Você é um especialista em Google Ads. Crie copy para anúncios de busca e display que:
- Seja relevante para a palavra-chave
- Tenha alta qualidade (Quality Score)
- Gere cliques qualificados
- Converta visitantes em clientes
- Use extensões estrategicamente

Contexto:
Produto/Serviço: [Descreva]
Palavra-chave principal: [Mencione]
Público-alvo: [Descreva]
Objetivo: [Conversão / Cliques / Visibilidade]

Crie anúncios completos:

1. ANÚNCIO DE BUSCA (Search)
   - Título 1 (máximo 30 caracteres)
   - Título 2 (máximo 30 caracteres)
   - Título 3 (máximo 30 caracteres)
   - Descrição 1 (máximo 90 caracteres)
   - Descrição 2 (máximo 90 caracteres)
   - Caminho final do URL (opcional)
   
   Variantes (3 opções diferentes)

2. EXTENSÕES DE SITELINK
   - 4 sitelinks (título + descrição)
   - URLs de destino

3. EXTENSÃO DE CALL-OUT
   - 4 call-outs destacando benefícios

4. EXTENSÃO DE ESTRUTURADA
   - Título + descrição + preço (se aplicável)

5. ANÚNCIO DISPLAY (se aplicável)
   - Headline (máximo 30 caracteres)
   - Descrição (máximo 90 caracteres)
   - CTA

Para cada anúncio:
- Inclua palavra-chave estrategicamente
- Destaque benefício único
- Crie urgência ou escassez
- Use números quando possível

Inclua também:
- Estratégia de palavras-chave
- Como melhorar Quality Score
- Otimizações por dispositivo
- Testes A/B recomendados

', 22, true),
('Copy para Email Marketing', 'Marketing', 'Copy', 'PROMPT: Copy para Email Marketing

Você é um especialista em email marketing. Crie copy para emails que:
- Tenham assunto irresistível (alta taxa de abertura)
- Sejam relevantes e valiosos
- Tenham estrutura clara e escaneável
- Gerem ação (clique, compra, etc.)
- Sejam mobile-friendly

Contexto:
Tipo de email: [Newsletter / Promocional / Transacional / Nurturing / Reativação]
Produto/Serviço: [Descreva]
Público-alvo: [Descreva]
Objetivo: [Vendas / Engajamento / Educação / Reativação]

Crie email completo:

1. ASSUNTO (Subject Line)
   - 5 opções diferentes
   - Estratégia por tipo
   - Melhor prática (máximo 50 caracteres)
   - Preview text (pré-cabeçalho)

2. ESTRUTURA DO CORPO
   - Abertura (primeira linha - hook)
   - Corpo principal (2-3 parágrafos)
   - Call-to-action
   - Fechamento
   - P.S. (opcional)

3. ELEMENTOS VISUAIS
   - Onde usar imagens
   - Botões vs links de texto
   - Hierarquia visual

4. MOBILE OPTIMIZATION
   - Versão mobile
   - Tamanho de fonte
   - Botões touch-friendly

5. PERSONALIZAÇÃO
   - Onde usar nome
   - Dados dinâmicos
   - Segmentação

Para cada tipo de email:
- Estrutura específica
- Tom de voz
- Timing ideal
- Métricas de sucesso

Inclua também:
- Checklist de envio
- Testes A/B recomendados
- Erros comuns a evitar
- Como evitar spam

', 23, true),
('Copy para Posts em Redes Sociais', 'Marketing', 'Copy', 'PROMPT: Copy para Posts em Redes Sociais

Você é um especialista em conteúdo para redes sociais. Crie copy para posts que:
- Seja nativo à plataforma (Instagram, LinkedIn, Twitter, etc.)
- Gere engajamento (curtidas, comentários, compartilhamentos)
- Conecte com a audiência
- Tenha call-to-action quando apropriado
- Seja autêntico e não apenas promocional

Contexto:
Plataforma: [Instagram / LinkedIn / Twitter / Facebook / TikTok]
Produto/Serviço: [Descreva]
Público-alvo: [Descreva]
Objetivo: [Engajamento / Vendas / Branding / Educação]
Tom de voz: [Profissional / Casual / Inspiracional / etc.]

Crie posts para diferentes tipos:

1. POST EDUCATIVO
   - Hook
   - Conteúdo de valor
   - Call-to-action
   - Hashtags estratégicas

2. POST PROMOCIONAL
   - Abordagem não invasiva
   - Valor primeiro
   - Oferta clara
   - Urgência (se aplicável)

3. POST STORYTELLING
   - Narrativa envolvente
   - Conexão emocional
   - Lição/mensagem
   - Call-to-action

4. POST COM PERGUNTA
   - Pergunta engajadora
   - Contexto
   - Call-to-action para comentar

5. POST COM CASE/DEPOIMENTO
   - Abertura
   - Case/depoimento
   - Lição aprendida
   - Call-to-action

Para cada tipo:
- Estrutura específica
- Comprimento ideal por plataforma
- Elementos visuais sugeridos
- Melhor horário para postar

Inclua também:
- Estratégia de hashtags por plataforma
- Como gerar engajamento
- Erros comuns a evitar
- Como adaptar mesmo conteúdo para diferentes plataformas

', 24, true),
('Copy para Landing Pages', 'Marketing', 'Copy', 'PROMPT: Copy para Landing Pages

Você é um especialista em copy para landing pages de alta conversão. Crie copy que:
- Capture atenção imediatamente
- Comunique valor claramente
- Remova objeções
- Crie urgência
- Gere ação (conversão)

Contexto:
Produto/Serviço: [Descreva]
Oferta: [O que está oferecendo na landing page]
Público-alvo: [Descreva]
Objetivo: [Venda / Lead / Inscrição / Download]
Tráfego esperado: [Orgânico / Pago / Email]

Crie copy completa para landing page:

1. HEADLINE PRINCIPAL (H1)
   - 3 opções diferentes
   - Foco em benefício
   - Máximo 10 palavras
   - Deve responder: "O que eu ganho?"

2. SUBHEADLINE
   - Complementa headline
   - Adiciona contexto
   - Máximo 20 palavras

3. SEÇÃO DE VALOR
   - 3-5 benefícios principais
   - Formato bullet points
   - Linguagem de resultado

4. SEÇÃO DE PROVA SOCIAL
   - Depoimentos (3-5)
   - Estatísticas/números
   - Logos de clientes (se houver)
   - Cases de sucesso

5. SEÇÃO DE OFERTA
   - O que está incluído
   - Valor/Benefício
   - Garantia (se houver)
   - Oferta especial (se houver)

6. SEÇÃO DE OBJEÇÕES
   - FAQ (5-7 perguntas)
   - Respostas que removem objeções

7. CALL-TO-ACTION
   - Botão principal (3 variações de texto)
   - Texto de apoio
   - Urgência/Escassez

8. SEÇÃO DE GARANTIA/SEGURANÇA
   - Garantia de satisfação
   - Selos de segurança
   - Política de privacidade

Inclua também:
- Estrutura visual sugerida
- Elementos de design importantes
- Testes A/B recomendados
- Otimizações mobile
- Como reduzir atrito na conversão

', 25, true),
('Campanha de Email Drip (Nutrição)', 'Marketing', 'Campanhas', 'PROMPT: Campanha de Email Drip (Nutrição)

Você é um especialista em campanhas de email drip (nutrição de leads). Crie uma campanha completa que:
- Nutra leads ao longo do tempo
- Adicione valor em cada email
- Movimente leads pelo funil
- Não seja apenas promocional
- Converta leads em clientes

Contexto:
Produto/Serviço: [Descreva]
Público-alvo: [Descreva]
Fonte do lead: [Download / Webinar / Evento / Site]
Objetivo: [Venda / Agendamento / Inscrição]
Duração da campanha: [X dias/semanas]

Crie campanha completa (5-7 emails):

Email 1 (Dia 1): Boas-vindas + Valor Imediato
- Assunto
- Corpo
- CTA
- Objetivo

Email 2 (Dia 3): Educação + Estabelecer Autoridade
- Assunto
- Corpo
- CTA
- Objetivo

Email 3 (Dia 7): Case de Sucesso + Prova Social
- Assunto
- Corpo
- CTA
- Objetivo

Email 4 (Dia 14): Solução para Dor Específica
- Assunto
- Corpo
- CTA
- Objetivo

Email 5 (Dia 21): Oferta Especial + Urgência
- Assunto
- Corpo
- CTA
- Objetivo

Email 6 (Dia 28): Última Chance + Escassez
- Assunto
- Corpo
- CTA
- Objetivo

Email 7 (Dia 35): Reativação (se não converteu)
- Assunto
- Corpo
- CTA
- Objetivo

Para cada email:
- Timing e razão
- Tipo de conteúdo
- Tom de voz
- Personalização sugerida
- Segmentação (se aplicável)

Inclua também:
- Fluxo visual da campanha
- Critérios de segmentação
- Automações sugeridas
- Métricas de acompanhamento
- Como otimizar baseado em resultados

', 26, true),
('Campanha de Lançamento de Produto', 'Marketing', 'Campanhas', 'PROMPT: Campanha de Lançamento de Produto

Você é um especialista em campanhas de lançamento. Crie uma campanha completa de lançamento que:
- Gere expectativa antes do lançamento
- Crie urgência durante o lançamento
- Maximize vendas no período de lançamento
- Use múltiplos canais
- Tenha sequência estratégica

Contexto:
Produto/Serviço: [Descreva]
Data de lançamento: [Data]
Público-alvo: [Descreva]
Oferta especial: [Desconto / Bônus / etc.]
Duração: [X dias antes + X dias durante]

Crie campanha completa:

FASE 1: PRÉ-LANÇAMENTO (X dias antes)

1. Anúncio do Lançamento
   - Email
   - Redes sociais
   - Landing page de espera

2. Geração de Expectativa
   - Conteúdo educativo
   - Teasing de benefícios
   - Lista de espera

3. Prova Social Antecipada
   - Beta testers
   - Depoimentos iniciais
   - Estatísticas

FASE 2: LANÇAMENTO (Dia 0)

4. Email de Lançamento
   - Assunto
   - Corpo
   - CTA

5. Sequência de Lançamento (5-7 dias)
   - Email 1: Anúncio oficial
   - Email 2: Benefícios detalhados
   - Email 3: Prova social
   - Email 4: Oferta especial
   - Email 5: Urgência (últimas horas)
   - Email 6: Extensão (se aplicável)
   - Email 7: Fechamento final

6. Conteúdo para Redes Sociais
   - Posts diários
   - Stories
   - Lives (se aplicável)

FASE 3: PÓS-LANÇAMENTO

7. Email de Agradecimento
8. Campanha de Upsell (se aplicável)
9. Solicitação de Feedback

Para cada elemento:
- Copy completo
- Timing específico
- Canais recomendados
- Métricas de sucesso

Inclua também:
- Calendário completo da campanha
- Checklist de execução
- Materiais necessários
- Automações sugeridas
- Como lidar com imprevistos

', 27, true),
('Campanha de Reativação de Clientes', 'Marketing', 'Campanhas', 'PROMPT: Campanha de Reativação de Clientes

Você é um especialista em reativar clientes inativos. Crie uma campanha de reativação que:
- Identifique clientes reativáveis
- Use diferentes abordagens
- Ofereça valor, não apenas desconto
- Preserve relacionamento
- Reconquiste clientes

Contexto:
Tipo de cliente: [B2B / B2C]
Tempo inativo: [X meses]
Última compra: [Descreva]
Produto/Serviço: [Descreva]
Razão da inatividade: [Se souber]

Crie campanha completa:

1. SEGMENTAÇÃO
   - Critérios para identificar reativáveis
   - Segmentação por perfil
   - Priorização

2. CAMPANHA MULTICANAL

   a) Email de Reativação
      - Email 1: "Sentimos sua falta" + Oferta especial
      - Email 2: "Novidades que você perdeu"
      - Email 3: "Última chance" (se não respondeu)
      
   b) SMS/WhatsApp (se tiver permissão)
      - Mensagem personalizada
      - Oferta exclusiva
      
   c) Retargeting (se aplicável)
      - Anúncios para visitantes do site
      - Ofertas personalizadas

3. ABORDAGENS DIFERENTES

   Abordagem 1: Oferta Especial
   - Desconto ou bônus
   - Copy
   - CTA
   
   Abordagem 2: Novidades
   - O que mudou desde última compra
   - Novos produtos/serviços
   - Copy
   - CTA
   
   Abordagem 3: Pesquisa
   - Pedir feedback
   - Entender razão da inatividade
   - Copy
   - CTA
   
   Abordagem 4: Valor Agregado
   - Conteúdo educativo
   - Dicas e insights
   - Copy
   - CTA

4. SEQUÊNCIA DE REATIVAÇÃO
   - Timing de cada email
   - Espaçamento
   - Quando parar

5. SEGMENTAÇÃO ESPECIAL
   - VIPs (maior valor histórico)
   - Clientes frequentes que pararam
   - Clientes de uma compra só

Para cada abordagem:
- Copy completo
- Oferta sugerida
- Canais recomendados
- Métricas esperadas

Inclua também:
- Critérios de sucesso
- Quando considerar cliente perdido
- Estratégia de longo prazo
- Como prevenir inatividade futura

', 28, true),
('Calendário Editorial para Redes Sociais', 'Marketing', 'Redes Sociais', 'PROMPT: Calendário Editorial para Redes Sociais

Você é um estrategista de conteúdo para redes sociais. Crie um calendário editorial que:
- Seja estratégico e não aleatório
- Balance diferentes tipos de conteúdo
- Se adapte a cada plataforma
- Gere engajamento consistente
- Alinhe com objetivos de negócio

Contexto:
Plataformas: [Instagram / LinkedIn / Facebook / Twitter / TikTok]
Frequência: [X posts por semana]
Público-alvo: [Descreva]
Objetivos: [Branding / Vendas / Engajamento / Educação]
Recursos disponíveis: [Tempo / Orçamento]

Crie calendário completo (1 mês):

1. ESTRATÉGIA DE CONTEÚDO
   - Mix de conteúdo (80/20 ou 70/20/10)
   - Tipos de posts:
     * Educativo (X%)
     * Entretenimento (X%)
     * Promocional (X%)
     * Storytelling (X%)
     * User-generated (X%)

2. CALENDÁRIO SEMANAL
   
   Segunda-feira:
   - Tipo de conteúdo
   - Tema
   - Plataformas
   - Copy sugerido
   
   Terça-feira:
   - [Mesmo formato]
   
   [Continue para todos os dias]

3. TEMAS RECORRENTES
   - #MotivationalMonday
   - #TipTuesday
   - #WednesdayWisdom
   - etc.

4. CONTEÚDO SAZONAL
   - Datas comemorativas relevantes
   - Eventos do setor
   - Tendências do momento

5. ADAPTAÇÃO POR PLATAFORMA
   - Instagram: [Estratégia específica]
   - LinkedIn: [Estratégia específica]
   - Facebook: [Estratégia específica]
   - Twitter: [Estratégia específica]

6. ELEMENTOS VISUAIS
   - Tipos de imagens/vídeos
   - Cores e estilo
   - Templates sugeridos

7. ENGAGEMENT
   - Perguntas para fazer
   - Calls-to-action
   - Como responder comentários

Inclua também:
- Ferramentas recomendadas
- Como criar conteúdo em lote
- Automações possíveis
- Métricas de acompanhamento
- Como ajustar baseado em performance

', 29, true),
('Estratégia de Crescimento em Redes Sociais', 'Marketing', 'Redes Sociais', 'PROMPT: Estratégia de Crescimento em Redes Sociais

Você é um especialista em crescimento orgânico em redes sociais. Crie uma estratégia completa que:
- Aumente seguidores qualificados
- Melhore engajamento
- Gere mais conversões
- Use algoritmos a favor
- Seja sustentável a longo prazo

Contexto:
Plataforma principal: [Instagram / LinkedIn / etc.]
Situação atual: [X seguidores, X% engajamento]
Objetivo: [X seguidores em X meses]
Recursos: [Tempo / Orçamento / Equipe]

Crie estratégia completa:

1. ANÁLISE INICIAL
   - Auditoria de perfil atual
   - Análise de concorrentes
   - Identificação de oportunidades
   - Benchmarking

2. ESTRATÉGIA DE CONTEÚDO
   - Pillars de conteúdo (3-5 temas principais)
   - Mix de formatos (feed, stories, reels, etc.)
   - Frequência ideal
   - Melhor horário para postar

3. ESTRATÉGIA DE CRESCIMENTO

   a) Hashtags
      - Estratégia de hashtags
      - Mix (populares + nicho)
      - Pesquisa de hashtags
   
   b) Engajamento
      - Como aumentar comentários
      - Estratégia de stories
      - Lives e interações
      - Colaborações
   
   c) Algoritmo
      - Como funciona algoritmo da plataforma
      - Sinais que algoritmo valoriza
      - Como otimizar para algoritmo

4. TÁTICAS ESPECÍFICAS

   Tática 1: User-Generated Content
   - Como incentivar
   - Campanhas
   - Hashtags próprias
   
   Tática 2: Colaborações
   - Parcerias com influenciadores
   - Cross-promoção
   - Takeovers
   
   Tática 3: Conteúdo Viral
   - Formatos que performam
   - Tendências a seguir
   - Como criar sem perder autenticidade
   
   Tática 4: Comunidade
   - Como construir comunidade
   - Grupos/exclusivos
   - Engajamento direto

5. CRONOGRAMA DE IMPLEMENTAÇÃO
   - Semana 1-2: [Ações]
   - Semana 3-4: [Ações]
   - Mês 2: [Ações]
   - Mês 3: [Ações]

6. MÉTRICAS E KPIs
   - Métricas a acompanhar
   - Ferramentas de análise
   - Frequência de análise
   - Ajustes baseados em dados

Inclua também:
- Ferramentas recomendadas
- Recursos educativos
- Erros comuns a evitar
- Como manter consistência
- Budget sugerido (se usar ads)

', 30, true),
('Otimização de Landing Pages para Conversão', 'Marketing', 'Landing Pages', 'PROMPT: Otimização de Landing Pages para Conversão

Você é um especialista em otimização de landing pages (CRO - Conversion Rate Optimization). Crie um guia completo para otimizar landing pages que:
- Aumente taxa de conversão
- Reduza atrito
- Remova objeções
- Crie urgência
- Teste e melhore continuamente

Contexto:
Tipo de landing page: [Venda / Lead / Inscrição / Download]
Taxa de conversão atual: [X%] (se souber)
Tráfego: [Orgânico / Pago / Email]
Produto/Serviço: [Descreva]

Crie guia completo de otimização:

1. ELEMENTOS ESSENCIAIS

   a) Headline
      - O que testar
      - Exemplos de boas headlines
      - Erros comuns
   
   b) Subheadline
      - Como complementar headline
      - O que incluir
   
   c) Hero Image/Vídeo
      - Tipo de imagem que converte
      - Vídeo vs imagem
      - Posicionamento
   
   d) Formulário
      - Quantos campos (menos é mais)
      - Quais campos são essenciais
      - Design do formulário
      - Placeholders e labels
   
   e) Call-to-Action (CTA)
      - Texto do botão
      - Cor e design
      - Posicionamento
      - Múltiplos CTAs

2. ELEMENTOS DE PERSUASÃO

   a) Prova Social
      - Depoimentos
      - Estatísticas
      - Logos de clientes
      - Cases de sucesso
   
   b) Urgência e Escassez
      - Como criar urgência legítima
      - Contadores
      - Ofertas limitadas
   
   c) Garantias
      - Tipos de garantia
      - Como apresentar
      - Selos de segurança
   
   d) Benefícios vs Features
      - Como apresentar benefícios
      - Linguagem de resultado

3. REMOÇÃO DE OBJEÇÕES
   - FAQ estratégico
   - Seção de garantia
   - Informações de segurança
   - Política de privacidade
   - Suporte ao cliente

4. OTIMIZAÇÕES TÉCNICAS
   - Velocidade de carregamento
   - Mobile-first
   - Testes de compatibilidade
   - SEO on-page

5. TESTES A/B SUGERIDOS
   - Headline
   - CTA
   - Formulário
   - Imagens
   - Cores
   - Layout

6. FUNIL DE CONVERSÃO
   - Fluxo do visitante
   - Pontos de atrito
   - Como reduzir abandono
   - Exit-intent popups

7. MÉTRICAS E ANÁLISE
   - KPIs importantes
   - Ferramentas de análise
   - Heatmaps
   - Gravações de sessão
   - Como interpretar dados

Inclua também:
- Checklist de otimização
- Ferramentas recomendadas
- Erros comuns
- Exemplos de boas práticas
- Como priorizar otimizações

', 31, true),
('Criar Múltiplas Variações de Landing Pages', 'Marketing', 'Landing Pages', 'PROMPT: Criar Múltiplas Variações de Landing Pages

Você é um especialista em criar variações de landing pages para testes. Crie múltiplas variações de uma landing page que:
- Testem diferentes abordagens
- Sejam baseadas em hipóteses claras
- Tenham elementos mensuráveis
- Maximizem aprendizado
- Aumentem conversão

Contexto:
Produto/Serviço: [Descreva]
Oferta: [Descreva]
Público-alvo: [Descreva]
Objetivo: [Venda / Lead / Inscrição]

Crie 3-5 variações completas:

VARIAÇÃO 1: Abordagem Direta (Benefício Imediato)
- Headline: [Foco em resultado rápido]
- Estrutura: [Descreva]
- Elementos principais: [Liste]
- Hipótese: [Por que esta abordagem deve funcionar]
- Copy completa

VARIAÇÃO 2: Abordagem Educativa (Autoridade)
- Headline: [Foco em educação/valor]
- Estrutura: [Descreva]
- Elementos principais: [Liste]
- Hipótese: [Por que esta abordagem deve funcionar]
- Copy completa

VARIAÇÃO 3: Abordagem Social (Prova Social)
- Headline: [Foco em outros clientes]
- Estrutura: [Descreva]
- Elementos principais: [Liste]
- Hipótese: [Por que esta abordagem deve funcionar]
- Copy completa

VARIAÇÃO 4: Abordagem Urgente (Escassez)
- Headline: [Foco em urgência]
- Estrutura: [Descreva]
- Elementos principais: [Liste]
- Hipótese: [Por que esta abordagem deve funcionar]
- Copy completa

VARIAÇÃO 5: Abordagem Minimalista (Simplicidade)
- Headline: [Foco em simplicidade]
- Estrutura: [Descreva]
- Elementos principais: [Liste]
- Hipótese: [Por que esta abordagem deve funcionar]
- Copy completa

Para cada variação:
- Layout sugerido
- Elementos visuais
- Ordem de elementos
- CTA específico
- Elementos únicos

PLANO DE TESTE:
- Qual testar primeiro
- Como dividir tráfego
- Tamanho de amostra necessário
- Duração do teste
- Critérios de sucesso
- Como interpretar resultados

Inclua também:
- Elementos comuns entre variações
- O que manter constante
- Ferramentas de teste
- Como implementar testes
- Próximos passos após resultados

', 32, true),
('Pesquisa e Estratégia de Palavras-chave para SEO', 'Marketing', 'SEO', 'PROMPT: Pesquisa e Estratégia de Palavras-chave para SEO

Você é um especialista em SEO e pesquisa de palavras-chave. Crie uma estratégia completa de palavras-chave que:
- Identifique oportunidades de tráfego
- Seja baseada em intenção de busca
- Tenha palavras-chave de diferentes dificuldades
- Alinhe com objetivos de negócio
- Seja executável

Contexto:
Negócio: [Descreva]
Produto/Serviço: [Descreva]
Público-alvo: [Descreva]
Concorrentes principais: [Liste]
Orçamento para SEO: [Baixo / Médio / Alto]

Crie estratégia completa:

1. PESQUISA INICIAL
   - Palavras-chave principais (5-10)
   - Palavras-chave de cauda longa (20-30)
   - Palavras-chave de nicho (10-15)
   - Palavras-chave de marca (se aplicável)

2. ANÁLISE DE INTENÇÃO
   
   a) Informacional
      - Palavras-chave
      - Oportunidades de conteúdo
      - Estratégia
   
   b) Navegacional
      - Palavras-chave
      - Oportunidades
      - Estratégia
   
   c) Transacional
      - Palavras-chave
      - Oportunidades
      - Estratégia
   
   d) Comercial
      - Palavras-chave
      - Oportunidades
      - Estratégia

3. PRIORIZAÇÃO
   - Matriz de priorização (Volume x Dificuldade x Relevância)
   - Palavras-chave quick wins
   - Palavras-chave de longo prazo
   - Palavras-chave de alto valor

4. MAPEAMENTO DE CONTEÚDO
   - Palavras-chave primárias por página
   - Palavras-chave secundárias
   - Estrutura de site sugerida
   - Conteúdo necessário

5. ESTRATÉGIA POR TIPO

   a) Páginas Principais
      - Palavras-chave
      - Estratégia de otimização
   
   b) Blog/Conteúdo
      - Tópicos baseados em palavras-chave
      - Calendário de conteúdo
      - Estratégia de link building
   
   c) Landing Pages
      - Palavras-chave
      - Otimização on-page

6. ANÁLISE DE CONCORRÊNCIA
   - Palavras-chave dos concorrentes
   - Oportunidades não exploradas
   - Gaps de conteúdo

7. FERRAMENTAS E RECURSOS
   - Ferramentas recomendadas (gratuitas e pagas)
   - Como usar cada ferramenta
   - Métricas a acompanhar

8. IMPLEMENTAÇÃO
   - Checklist de otimização on-page
   - Estrutura de URLs
   - Meta descriptions
   - Headers (H1, H2, H3)
   - Conteúdo otimizado

9. ACOMPANHAMENTO
   - KPIs importantes
   - Ferramentas de análise
   - Frequência de revisão
   - Ajustes baseados em dados

Inclua também:
- Glossário de termos SEO
- Erros comuns a evitar
- Melhores práticas
- Timeline de resultados esperados
- Budget sugerido para ferramentas

', 33, true),
('Criar Conteúdo Otimizado para SEO', 'Marketing', 'SEO', 'PROMPT: Criar Conteúdo Otimizado para SEO

Você é um especialista em criar conteúdo que rankeia bem no Google. Crie um guia e template para criar conteúdo otimizado que:
- Rankeie para palavras-chave alvo
- Seja valioso para o leitor
- Tenha estrutura otimizada
- Gere backlinks naturalmente
- Converta visitantes em leads/clientes

Contexto:
Tipo de conteúdo: [Artigo de blog / Página de produto / Guia / Landing page]
Palavra-chave principal: [Mencione]
Público-alvo: [Descreva]
Objetivo: [SEO / Conversão / Autoridade]

Crie guia completo:

1. PESQUISA E ESTRUTURA

   a) Pesquisa de Conteúdo
      - Análise de concorrentes que rankeiam
      - Gaps de conteúdo
      - Perguntas relacionadas
      - Tópicos relacionados
   
   b) Estrutura do Conteúdo
      - Título otimizado (H1)
      - Introdução (primeiros 100 palavras)
      - Subtítulos (H2, H3)
      - Conclusão
      - Comprimento ideal

2. OTIMIZAÇÃO ON-PAGE

   a) Elementos Técnicos
      - Título (Title Tag) - máximo 60 caracteres
      - Meta Description - máximo 160 caracteres
      - URL otimizada
      - Headers (H1, H2, H3) com palavras-chave
      - Alt text em imagens
      - Links internos
      - Links externos (autoridade)
   
   b) Densidade de Palavras-chave
      - Palavra-chave principal (1-2%)
      - Palavras-chave secundárias
      - Variações e sinônimos
      - LSI keywords

3. ESTRUTURA DO CONTEÚDO

   Template completo:
   
   INTRODUÇÃO (100-150 palavras)
   - Hook
   - Contexto
   - O que o leitor vai aprender
   - Palavra-chave principal no primeiro parágrafo
   
   CORPO (dividido em seções H2)
   
   Seção 1: [Título H2 com palavra-chave]
   - Conteúdo (300-500 palavras)
   - Subtítulos H3 quando necessário
   - Imagens/exemplos
   
   Seção 2: [Título H2]
   - [Mesmo formato]
   
   [Continue para todas as seções]
   
   CONCLUSÃO (100-150 palavras)
   - Resumo dos pontos principais
   - Call-to-action
   - Próximos passos

4. ELEMENTOS DE ENGAGEMENT
   - Perguntas retóricas
   - Listas e bullet points
   - Imagens e infográficos
   - Citações e estatísticas
   - Exemplos práticos
   - CTAs estratégicos

5. OTIMIZAÇÃO PARA FEATURED SNIPPETS
   - Como estruturar para snippet
   - Perguntas diretas
   - Listas numeradas
   - Tabelas
   - Definições

6. INTERNAL LINKING
   - Estratégia de links internos
   - Anchor texts otimizados
   - Páginas para linkar
   - Estrutura de silos

7. CALL-TO-ACTION
   - CTAs estratégicos no conteúdo
   - Formulários de lead
   - Links para produtos/serviços
   - Download de recursos

8. CHECKLIST DE PUBLICAÇÃO
   - [ ] Título otimizado
   - [ ] Meta description
   - [ ] Headers com palavras-chave
   - [ ] Imagens com alt text
   - [ ] Links internos
   - [ ] Links externos
   - [ ] CTA incluído
   - [ ] Mobile-friendly
   - [ ] Velocidade de carregamento
   - [ ] Schema markup (se aplicável)

Inclua também:
- Ferramentas de otimização
- Como medir sucesso
- Ajustes pós-publicação
- Estratégia de atualização
- Promoção do conteúdo

', 34, true),
('Análise de Concorrência Digital', 'Marketing', 'Análise', 'PROMPT: Análise de Concorrência Digital

Você é um especialista em análise competitiva digital. Crie uma análise completa de concorrentes que:
- Identifique oportunidades
- Revele gaps no mercado
- Mostre o que funciona
- Ajude a diferenciar
- Seja acionável

Contexto:
Seu negócio: [Descreva]
Concorrentes principais: [Liste 3-5]
Foco da análise: [SEO / Redes sociais / Anúncios / Conteúdo / Site]

Crie análise completa:

1. IDENTIFICAÇÃO DE CONCORRENTES
   - Concorrentes diretos
   - Concorrentes indiretos
   - Aspiracionais (empresas que você admira)
   - Critérios de seleção

2. ANÁLISE DE SITE

   Para cada concorrente:
   
   a) Estrutura e UX
      - Navegação
      - Design
      - Mobile-friendliness
      - Velocidade
   
   b) Conteúdo
      - Tipos de conteúdo
      - Frequência
      - Qualidade
      - Palavras-chave focadas
   
   c) SEO
      - Autoridade de domínio (estimada)
      - Backlinks
      - Palavras-chave que rankeiam
      - Estrutura técnica

3. ANÁLISE DE REDES SOCIAIS

   Para cada concorrente:
   
   a) Presença
      - Plataformas usadas
      - Frequência de posts
      - Engajamento médio
      - Crescimento
   
   b) Conteúdo
      - Tipos de posts
      - Tom de voz
      - Hashtags usadas
      - Melhores performers
   
   c) Estratégia
      - Abordagem identificada
      - Diferenciação
      - Oportunidades

4. ANÁLISE DE ANÚNCIOS (se possível)
   - Onde anunciam
   - Tipos de anúncios
   - Copy usado
   - Landing pages
   - Frequência estimada

5. ANÁLISE DE CONTEÚDO
   - Tópicos cobertos
   - Formato preferido
   - Frequência
   - Engajamento
   - Gaps identificados

6. ANÁLISE DE PRODUTO/SERVIÇO
   - Ofertas principais
   - Preços (se públicos)
   - Diferenciação
   - Prova social usada

7. PONTOS FORTES E FRACOS
   
   Para cada concorrente:
   - Pontos fortes
   - Pontos fracos
   - Oportunidades para você
   - Ameaças

8. MATRIZ COMPARATIVA
   - Tabela comparativa
   - Critérios de comparação
   - Sua posição relativa

9. OPORTUNIDADES IDENTIFICADAS
   - Gaps de conteúdo
   - Palavras-chave não exploradas
   - Canais subutilizados
   - Abordagens diferentes
   - Melhorias possíveis

10. RECOMENDAÇÕES ESTRATÉGICAS
    - O que aprender
    - O que fazer diferente
    - O que fazer melhor
    - Prioridades
    - Ações imediatas

11. FERRAMENTAS E MÉTODOS
    - Ferramentas usadas na análise
    - Como fazer análise contínua
    - Frequência de revisão

Inclua também:
- Template de análise
- Checklist de análise
- Como monitorar concorrentes
- Ética na análise
- Como usar insights

', 35, true),
('Análise de Performance de Campanhas de Marketing', 'Marketing', 'Campanhas', 'PROMPT: Análise de Performance de Campanhas de Marketing

Você é um analista de marketing digital. Crie um framework completo para analisar performance de campanhas que:
- Meça o que importa
- Identifique oportunidades de melhoria
- Seja fácil de entender
- Gere insights acionáveis
- Conecte métricas com resultados de negócio

Contexto:
Tipo de campanha: [Email / Redes sociais / Google Ads / Facebook Ads / Conteúdo]
Objetivo: [Vendas / Leads / Engajamento / Branding]
Período: [X dias/semanas]
Orçamento: [Se aplicável]

Crie framework completo:

1. MÉTRICAS ESSENCIAIS POR CANAL

   a) Email Marketing
      - Taxa de abertura (Open Rate)
      - Taxa de clique (CTR)
      - Taxa de conversão
      - Taxa de descadastro
      - Revenue por email
      - ROI
   
   b) Redes Sociais
      - Alcance (Reach)
      - Impressões
      - Engajamento (likes, comentários, shares)
      - Taxa de engajamento
      - Seguidores ganhos
      - Cliques no link
      - Conversões
   
   c) Google Ads
      - Impressões
      - Cliques (Clicks)
      - CTR
      - CPC (Custo por Clique)
      - Conversões
      - CPA (Custo por Aquisição)
      - ROAS (Return on Ad Spend)
   
   d) Facebook/Instagram Ads
      - Alcance
      - Impressões
      - Cliques
      - CTR
      - CPC
      - Conversões
      - CPA
      - ROAS
   
   e) Conteúdo/SEO
      - Tráfego orgânico
      - Palavras-chave rankeadas
      - Taxa de conversão
      - Tempo na página
      - Taxa de rejeição
      - Backlinks ganhos

2. MÉTRICAS DE FUNIL

   a) Topo do Funil (Awareness)
      - Alcance
      - Impressões
      - Brand awareness
   
   b) Meio do Funil (Consideration)
      - Visitas ao site
      - Tempo na página
      - Páginas por sessão
      - Retorno de visitantes
   
   c) Fundo do Funil (Conversion)
      - Leads gerados
      - Taxa de conversão
      - Custo por lead
      - Vendas
      - ROI

3. DASHBOARD DE PERFORMANCE

   Crie estrutura de dashboard:
   
   - Resumo executivo (KPIs principais)
   - Performance por canal
   - Performance por campanha
   - Tendências e comparações
   - Alertas e anomalias

4. ANÁLISE E INSIGHTS

   a) O que está funcionando
      - Campanhas de melhor performance
      - Canais mais eficientes
      - Conteúdo que converte
      - Segmentos mais responsivos
   
   b) O que não está funcionando
      - Campanhas abaixo da meta
      - Canais ineficientes
      - Conteúdo que não engaja
      - Segmentos problemáticos
   
   c) Oportunidades
      - Onde escalar
      - Onde otimizar
      - Onde testar
      - Gaps identificados

5. RELATÓRIO DE PERFORMANCE

   Template de relatório:
   
   - Resumo executivo
   - Métricas principais vs metas
   - Performance por canal
   - Análise de campanhas
   - Insights e recomendações
   - Próximos passos

6. TESTES E OTIMIZAÇÕES
   - Testes A/B realizados
   - Resultados
   - Aprendizados
   - Otimizações implementadas
   - Próximos testes

7. ROI E ATRIBUIÇÃO
   - Cálculo de ROI por canal
   - Modelo de atribuição
   - Lifetime Value (LTV)
   - Payback period

8. FERRAMENTAS E AUTOMAÇÃO
   - Ferramentas recomendadas
   - Dashboards automáticos
   - Alertas configurados
   - Integrações

Inclua também:
- Template de relatório
- Frequência de análise recomendada
- Como apresentar para stakeholders
- Erros comuns na análise
- Como priorizar otimizações

', 36, true),
('Gerar Ideias e Tópicos de Conteúdo', 'Marketing', 'Conteúdo', 'PROMPT: Gerar Ideias e Tópicos de Conteúdo

Você é um estrategista de conteúdo. Crie um processo e lista de ideias de conteúdo que:
- Sejam relevantes para o público-alvo
- Alinhem com objetivos de negócio
- Variem em formato e tipo
- Sejam executáveis
- Gerem resultados

Contexto:
Negócio: [Descreva]
Público-alvo: [Descreva]
Objetivos: [Educação / Vendas / SEO / Autoridade / Engajamento]
Canais: [Blog / Redes sociais / Email / Vídeo / Podcast]
Recursos: [Tempo / Orçamento / Equipe]

Crie processo completo:

1. FONTES DE IDEIAS

   a) Perguntas do Público
      - FAQ do site
      - Perguntas em redes sociais
      - Perguntas em emails
      - Comentários em posts
      - Grupos e fóruns
   
   b) Palavras-chave
      - Pesquisa de palavras-chave
      - Perguntas relacionadas no Google
      - Autocomplete do Google
      - "People also ask"
   
   c) Concorrentes
      - Conteúdo que performa bem
      - Gaps não cobertos
      - Abordagens diferentes
   
   d) Tendências
      - Notícias do setor
      - Eventos e datas
      - Mudanças no mercado
      - Novas tecnologias
   
   e) Expertise Interna
      - Conhecimento da equipe
      - Cases de clientes
      - Processos internos
      - Lições aprendidas

2. TIPOS DE CONTEÚDO

   Liste ideias por tipo:
   
   a) Educativo
      - Como fazer X
      - Guias completos
      - Tutoriais
      - Explicações
   
   b) Entretenimento
      - Histórias
      - Memes (se apropriado)
      - Curiosidades
      - Top 10 listas
   
   c) Inspiracional
      - Cases de sucesso
      - Depoimentos
      - Histórias de superação
      - Motivação
   
   d) Promocional
      - Novidades
      - Ofertas
      - Lançamentos
      - Atualizações
   
   e) Analítico
      - Pesquisas
      - Estatísticas
      - Tendências
      - Comparativos

3. FORMATOS DE CONTEÚDO

   Ideias por formato:
   
   - Artigos de blog
   - Vídeos
   - Infográficos
   - Podcasts
   - Webinars
   - E-books
   - Checklists
   - Templates
   - Casos de estudo
   - Quizzes

4. CALENDÁRIO DE IDEIAS

   Gere 30+ ideias específicas:
   
   Ideia 1: [Título] - [Tipo] - [Formato] - [Objetivo]
   Ideia 2: [Título] - [Tipo] - [Formato] - [Objetivo]
   [Continue...]

5. PRIORIZAÇÃO

   Matriz de priorização:
   - Alto impacto + Fácil execução (fazer primeiro)
   - Alto impacto + Difícil execução (planejar)
   - Baixo impacto + Fácil execução (preencher gaps)
   - Baixo impacto + Difícil execução (evitar)

6. PROCESSO DE CRIAÇÃO

   a) Brainstorming
      - Técnicas
      - Ferramentas
      - Sessões recomendadas
   
   b) Validação
      - Como validar ideias
      - Testes rápidos
      - Feedback
   
   c) Execução
      - Checklist de criação
      - Recursos necessários
      - Timeline

7. REPURPOSING

   Como reaproveitar conteúdo:
   - Artigo → Vídeo
   - Vídeo → Artigo
   - Post → E-book
   - Webinar → Múltiplos conteúdos
   - Estratégias específicas

Inclua também:
- Ferramentas de ideias
- Como manter backlog de ideias
- Como adaptar ideias para diferentes canais
- Como medir sucesso de cada tipo
- Template de brief de conteúdo

', 37, true),
('Calendário Editorial Completo', 'Marketing', 'Conteúdo', 'PROMPT: Calendário Editorial Completo

Você é um editor de conteúdo. Crie um calendário editorial completo que:
- Organize toda produção de conteúdo
- Balance diferentes tipos de conteúdo
- Alinhe com objetivos e eventos
- Seja executável
- Permita flexibilidade

Contexto:
Canais: [Blog / Redes sociais / Email / Vídeo / etc.]
Frequência: [X posts por semana/mês]
Equipe: [Tamanho da equipe]
Recursos: [Orçamento / Ferramentas]

Crie calendário completo:

1. ESTRUTURA DO CALENDÁRIO

   Template mensal com:
   - Data
   - Canal
   - Tipo de conteúdo
   - Título/Tema
   - Responsável
   - Status
   - Links/Notas

2. CALENDÁRIO MENSAL DETALHADO

   Janeiro 2025:
   
   Semana 1:
   - Segunda: [Conteúdo]
   - Terça: [Conteúdo]
   - Quarta: [Conteúdo]
   - Quinta: [Conteúdo]
   - Sexta: [Conteúdo]
   
   [Continue para todas as semanas]

3. TEMAS E CAMPANHAS

   a) Temas Mensais
      - Janeiro: [Tema]
      - Fevereiro: [Tema]
      - [Continue...]
   
   b) Campanhas Especiais
      - Lançamentos
      - Promoções
      - Eventos
      - Parcerias
   
   c) Datas Comemorativas Relevantes
      - Datas do setor
      - Feriados
      - Eventos nacionais/internacionais

4. MIX DE CONTEÚDO

   Distribuição sugerida:
   - 40% Educativo
   - 30% Entretenimento/Engajamento
   - 20% Promocional
   - 10% Inspiracional/Storytelling

5. FREQUÊNCIA POR CANAL

   - Blog: [X posts por semana]
   - Instagram: [X posts por semana]
   - LinkedIn: [X posts por semana]
   - Email: [X emails por semana]
   - [Outros canais]

6. WORKFLOW DE PRODUÇÃO

   Etapas:
   1. Planejamento (ideias)
   2. Briefing
   3. Criação
   4. Revisão
   5. Aprovação
   6. Publicação
   7. Promoção
   8. Análise

   Timeline sugerida para cada etapa

7. RESPONSABILIDADES

   - Quem cria
   - Quem revisa
   - Quem aprova
   - Quem publica
   - Quem analisa

8. RECURSOS E FERRAMENTAS

   - Ferramentas de calendário
   - Ferramentas de criação
   - Banco de imagens
   - Templates
   - Bibliotecas de conteúdo

9. FLEXIBILIDADE E AJUSTES

   - Como lidar com mudanças
   - Conteúdo de backup
   - Oportunidades de última hora
   - Como manter consistência

10. MÉTRICAS E REVISÃO

    - Métricas por tipo de conteúdo
    - Frequência de revisão
    - Como ajustar calendário baseado em performance
    - Aprendizados mensais

Inclua também:
- Template editável
- Exemplos práticos
- Checklist de publicação
- Como manter backlog
- Dicas de produtividade

', 38, true),
('Estratégia de Marketing com Influenciadores', 'Marketing', 'Influenciadores', 'PROMPT: Estratégia de Marketing com Influenciadores

Você é um especialista em marketing de influência. Crie uma estratégia completa que:
- Identifique influenciadores relevantes
- Crie parcerias mutuamente benéficas
- Maximize ROI
- Seja autêntica
- Gere resultados mensuráveis

Contexto:
Produto/Serviço: [Descreva]
Público-alvo: [Descreva]
Orçamento: [Baixo / Médio / Alto]
Objetivo: [Branding / Vendas / Engajamento / Alcance]
Plataformas: [Instagram / YouTube / TikTok / LinkedIn / etc.]

Crie estratégia completa:

1. IDENTIFICAÇÃO DE INFLUENCIADORES

   a) Critérios de Seleção
      - Nicho/segmento
      - Tamanho de audiência (micro, macro, mega)
      - Taxa de engajamento
      - Alinhamento de valores
      - Qualidade do conteúdo
      - Audiência (demografia, interesses)
   
   b) Onde Encontrar
      - Ferramentas de busca
      - Hashtags relevantes
      - Análise de concorrentes
      - Recomendações
      - Agências

2. TIPOS DE PARCERIAS

   a) Post Patrocinado
      - Quando usar
      - Estrutura
      - Expectativas
      - Custo típico
   
   b) Product Seeding
      - Quando usar
      - Estrutura
      - Expectativas
      - Custo típico
   
   c) Affiliate/Comissão
      - Quando usar
      - Estrutura
      - Expectativas
      - Custo típico
   
   d) Colaboração de Conteúdo
      - Quando usar
      - Estrutura
      - Expectativas
      - Custo típico
   
   e) Takeover
      - Quando usar
      - Estrutura
      - Expectativas
      - Custo típico
   
   f) Evento/Experiência
      - Quando usar
      - Estrutura
      - Expectativas
      - Custo típico

3. PROCESSO DE ABORDAGEM

   a) Pesquisa Prévia
      - Checklist de pesquisa
      - O que verificar
      - Red flags
   
   b) Primeiro Contato
      - Email template
      - Mensagem direta (DM)
      - O que incluir
      - O que evitar
   
   c) Negociação
      - O que negociar
      - Como estruturar acordo
      - Contratos básicos
      - Expectativas claras

4. BRIEFING E DIRETRIZES

   Template de briefing:
   - Objetivo da parceria
   - Mensagem principal
   - Pontos obrigatórios
   - Pontos a evitar
   - Hashtags e menções
   - Timeline
   - Deliverables esperados
   - Diretrizes de marca

5. CAMPANHAS ESTRATÉGICAS

   a) Campanha de Lançamento
      - Estratégia
      - Influenciadores ideais
      - Timeline
      - Métricas
   
   b) Campanha de Branding
      - Estratégia
      - Influenciadores ideais
      - Timeline
      - Métricas
   
   c) Campanha de Vendas
      - Estratégia
      - Influenciadores ideais
      - Timeline
      - Métricas

6. MÉTRICAS E ROI

   Métricas a acompanhar:
   - Alcance
   - Impressões
   - Engajamento
   - Cliques
   - Conversões
   - Vendas atribuídas
   - CPM (Custo por Mil)
   - ROI

7. GESTÃO DE RELACIONAMENTOS

   - Como manter relacionamento
   - Parcerias de longo prazo
   - Programa de embaixadores
   - Comunidade de influenciadores

8. LEGAL E ÉTICA

   - Disclosures obrigatórios
   - Contratos básicos
   - Direitos de uso de conteúdo
   - Ética em parcerias

9. ORÇAMENTO E NEGOCIAÇÃO

   - Faixas de preço típicas
   - Como negociar
   - O que oferecer além de dinheiro
   - Como maximizar valor

10. CASES E EXEMPLOS

    - Exemplos de parcerias bem-sucedidas
    - O que aprender
    - Erros comuns
    - Melhores práticas

Inclua também:
- Template de email de abordagem
- Template de briefing
- Checklist de seleção
- Ferramentas recomendadas
- Como escalar programa

', 39, true),
('Automação de Marketing Digital', 'Marketing', 'Automação', 'PROMPT: Automação de Marketing Digital

Você é um especialista em automação de marketing. Crie uma estratégia completa de automação que:
- Economize tempo
- Melhore resultados
- Personalize experiências
- Escale operações
- Seja executável

Contexto:
Tamanho do negócio: [Pequeno / Médio / Grande]
Orçamento: [Baixo / Médio / Alto]
Ferramentas atuais: [Liste se houver]
Objetivos: [Vendas / Leads / Engajamento / Eficiência]

Crie estratégia completa:

1. ÁREAS PARA AUTOMATIZAR

   a) Email Marketing
      - Sequências de boas-vindas
      - Drip campaigns
      - Abandoned cart
      - Reativação
      - Segmentação automática
   
   b) Redes Sociais
      - Agendamento de posts
      - Respostas automáticas
      - Menções e hashtags
      - Relatórios automáticos
   
   c) Lead Nurturing
      - Qualificação automática
      - Scoring de leads
      - Distribuição de leads
      - Follow-up automático
   
   d) Conteúdo
      - Distribuição de conteúdo
      - Repurposing automático
      - Agendamento
      - Análise de performance
   
   e) Vendas
      - Propostas automáticas
      - Follow-up de vendas
      - Onboarding de clientes
      - Upsell/cross-sell

2. FERRAMENTAS RECOMENDADAS

   Por categoria:
   
   a) Email Marketing
      - Opções gratuitas
      - Opções pagas
      - Comparativo
      - Recomendação por tamanho
   
   b) Redes Sociais
      - [Mesmo formato]
   
   c) CRM e Automação
      - [Mesmo formato]
   
   d) Agendamento
      - [Mesmo formato]
   
   e) Análise
      - [Mesmo formato]

3. AUTOMAÇÕES PRIORITÁRIAS

   Começar por (quick wins):
   
   1. [Automação] - Impacto: Alto | Esforço: Baixo
      - Como implementar
      - Ferramenta recomendada
      - Tempo economizado
   
   2. [Automação] - Impacto: Alto | Esforço: Médio
      - [Mesmo formato]
   
   [Continue...]

4. WORKFLOWS DE AUTOMAÇÃO

   Crie workflows detalhados:
   
   a) Workflow: Lead Nurturing
      - Trigger: [Ação que inicia]
      - Condições: [Se/Então]
      - Ações: [O que acontece]
      - Timeline: [Quando]
      - Ferramenta: [Qual usar]
   
   b) Workflow: Abandoned Cart
      - [Mesmo formato]
   
   c) Workflow: Boas-vindas
      - [Mesmo formato]
   
   [Continue para workflows principais]

5. SEGMENTAÇÃO AUTOMÁTICA

   - Critérios de segmentação
   - Como configurar
   - Tags e listas
   - Manutenção

6. PERSONALIZAÇÃO

   - Como personalizar em escala
   - Dados a coletar
   - Dinâmicos a usar
   - Limites e ética

7. INTEGRAÇÕES

   - Integrações essenciais
   - Como conectar ferramentas
   - Zapier/Make workflows
   - APIs quando necessário

8. TESTES E OTIMIZAÇÃO

   - Como testar automações
   - Métricas a acompanhar
   - Ajustes baseados em dados
   - Melhorias contínuas

9. IMPLEMENTAÇÃO

   Fase 1 (Primeiro mês):
   - [Automações a implementar]
   - Recursos necessários
   - Timeline
   
   Fase 2 (Mês 2-3):
   - [Automações a implementar]
   
   Fase 3 (Ongoing):
   - [Automações avançadas]

10. ROI E MÉTRICAS

    - Como medir ROI de automação
    - Tempo economizado
    - Melhorias em resultados
    - Métricas a acompanhar

11. ERROS COMUNS

    - O que evitar
    - Como não parecer robótico
    - Manter humanização
    - Testes antes de ativar

Inclua também:
- Checklist de implementação
- Template de workflows
- Orçamento sugerido
- Recursos de aprendizado
- Como escalar automações

', 40, true);