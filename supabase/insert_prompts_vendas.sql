-- ============================================================================
-- INSERÇÃO DE PROMPTS - VENDAS
-- ============================================================================
-- Total: 20 prompts
-- Execute este script no Supabase SQL Editor
-- ============================================================================

INSERT INTO public.prompts (titulo, categoria, subcategoria, conteudo, ordem, ativo) VALUES

('Mensagem de Prospecção no LinkedIn', 'Vendas', 'Prospecção', 'PROMPT: Mensagem de Prospecção no LinkedIn

Você é um especialista em vendas B2B. Crie uma mensagem de prospecção fria para LinkedIn que seja:
- Personalizada e não genérica
- Curta (máximo 150 palavras)
- Focada em valor para o prospect
- Com call-to-action claro

Contexto do meu negócio:
[Descreva seu negócio, produto/serviço e público-alvo]

Informações do prospect:
[Nome da empresa, setor, cargo da pessoa]

Objetivo: Gerar interesse para uma conversa de 15 minutos

Crie a mensagem seguindo este formato:
1. Abertura personalizada (mencione algo específico da empresa/pessoa)
2. Apresentação breve do valor que você oferece
3. Pergunta que gera curiosidade
4. Call-to-action suave

', 1, true),
('Email de Prospecção Fria', 'Vendas', 'Prospecção', 'PROMPT: Email de Prospecção Fria

Você é um copywriter especializado em emails de vendas. Crie um email de prospecção fria que:
- Tenha assunto irresistível (máximo 50 caracteres)
- Seja curto e direto (máximo 100 palavras no corpo)
- Foque em problemas/dores do prospect
- Não seja promocional demais
- Tenha call-to-action claro

Contexto:
Produto/Serviço: [Descreva]
Público-alvo: [Descreva]
Dores que resolvemos: [Liste 3-5 dores principais]

Crie:
1. Assunto do email (3 opções)
2. Corpo do email (linha de abertura + 2-3 parágrafos + CTA)
3. P.S. opcional (para aumentar abertura)

', 2, true),
('Roteiro de Ligação para Prospecção', 'Vendas', 'Prospecção', 'PROMPT: Roteiro de Ligação para Prospecção

Você é um consultor de vendas. Crie um roteiro de ligação de prospecção (cold call) que:
- Tenha abertura poderosa (primeiros 30 segundos)
- Inclua perguntas de qualificação
- Identifique dores e necessidades
- Gere interesse sem ser pushy
- Feche com próximo passo claro

Duração total: 3-5 minutos

Estrutura necessária:
1. Abertura (15-30 segundos)
   - Apresentação
   - Razão da ligação
   - Permissão para continuar

2. Qualificação (1-2 minutos)
   - 3-5 perguntas estratégicas
   - Identificar tomador de decisão
   - Entender situação atual

3. Descoberta de Necessidades (1-2 minutos)
   - Perguntas sobre desafios
   - Impacto dos problemas
   - Urgência

4. Apresentação de Valor (30 segundos)
   - Solução breve
   - Benefício principal

5. Fechamento (30 segundos)
   - Próximo passo
   - Agendamento

Crie o roteiro completo com scripts para cada etapa.

', 3, true),
('Perguntas Estratégicas para Qualificar Leads', 'Vendas', 'Prospecção', 'PROMPT: Perguntas Estratégicas para Qualificar Leads

Você é um especialista em qualificação de leads (BANT - Budget, Authority, Need, Timeline). Crie uma lista de perguntas estratégicas para qualificar leads que:
- Identifiquem necessidade real
- Descubram orçamento disponível
- Confirmem autoridade de decisão
- Estabeleçam timeline
- Não sejam invasivas

Contexto do meu negócio:
[Descreva seu produto/serviço e investimento médio]

Crie 15-20 perguntas organizadas por categoria:

1. NECESSIDADE (Need)
   - Perguntas sobre situação atual
   - Desafios enfrentados
   - Impacto dos problemas

2. AUTORIDADE (Authority)
   - Perguntas sobre processo de decisão
   - Quem está envolvido
   - Nível de influência

3. ORÇAMENTO (Budget)
   - Perguntas sobre investimento
   - Aprovações necessárias
   - Recursos disponíveis

4. TIMELINE (Timeline)
   - Urgência
   - Prazos
   - Eventos que aceleram decisão

Formato: Pergunta + Objetivo da pergunta + O que fazer com a resposta

', 4, true),
('Mensagem de Prospecção via WhatsApp', 'Vendas', 'Prospecção', 'PROMPT: Mensagem de Prospecção via WhatsApp

Você é um especialista em comunicação via WhatsApp para vendas. Crie uma mensagem de prospecção para WhatsApp que:
- Seja respeitosa e não invasiva
- Curta e objetiva (máximo 2-3 mensagens)
- Use linguagem natural e conversacional
- Tenha emojis estratégicos (sem exagero)
- Gere resposta positiva

Contexto:
[Descreva como você obteve o contato - referência, evento, LinkedIn, etc.]

Produto/Serviço: [Descreva brevemente]

Crie:
1. Primeira mensagem (apresentação + razão do contato)
2. Segunda mensagem (valor + pergunta)
3. Terceira mensagem opcional (se não houver resposta em 24h)

Inclua também:
- Melhor horário para enviar
- O que fazer se não houver resposta
- Como seguir após resposta positiva

', 5, true),
('Apresentação de Valor para Vendas', 'Vendas', 'Argumentos de Venda', 'PROMPT: Apresentação de Valor para Vendas

Você é um consultor de vendas consultivas. Crie uma apresentação de valor (value proposition) que:
- Foque em benefícios, não em features
- Seja personalizada para o cliente
- Use linguagem simples e direta
- Conecte solução com dores do cliente
- Seja memorável e diferenciada

Contexto:
Produto/Serviço: [Descreva]
Principais features: [Liste 3-5]
Dores do cliente identificadas: [Liste]
Concorrentes principais: [Mencione]

Crie uma apresentação de valor seguindo a estrutura:

1. SITUAÇÃO ATUAL (o que o cliente tem hoje)
   - Desafios identificados
   - Impacto negativo

2. SOLUÇÃO (o que você oferece)
   - Benefício principal (1 frase poderosa)
   - 3 benefícios secundários

3. DIFERENCIAÇÃO (por que você é único)
   - O que te diferencia dos concorrentes
   - Prova social (se houver)

4. RESULTADO ESPERADO (o que o cliente ganha)
   - Transformação/resultado final
   - Métricas/impacto mensurável

Formato: Máximo 2 minutos de apresentação verbal ou 1 página escrita.

', 6, true),
('Cálculo e Apresentação de ROI', 'Vendas', 'Argumentos de Venda', 'PROMPT: Cálculo e Apresentação de ROI

Você é um especialista em demonstrar retorno sobre investimento (ROI). Crie uma apresentação de ROI que:
- Seja baseada em dados reais ou estimativas conservadoras
- Mostre ganhos financeiros claros
- Calcule payback period
- Compare com custo de não fazer nada
- Seja visual e fácil de entender

Contexto:
Investimento necessário: R$ [valor]
Produto/Serviço: [Descreva]
Benefícios quantificáveis: [Liste com valores estimados]
- Ex: Economia de tempo = X horas/mês = R$ Y
- Ex: Aumento de vendas = X% = R$ Y
- Ex: Redução de custos = R$ X/mês

Crie:
1. Cálculo de ROI detalhado
   - Investimento inicial
   - Ganhos mensais/anuais
   - ROI em % e em reais
   - Payback period (tempo para recuperar investimento)

2. Comparação de Cenários
   - Cenário 1: Com sua solução
   - Cenário 2: Sem sua solução (custo de não fazer nada)

3. Apresentação Visual
   - Formato de slide ou documento
   - Gráficos simples
   - Números destacados

4. Argumentos de Venda
   - Como apresentar esses números
   - Respostas para objeções comuns sobre ROI

', 7, true),
('Usar Prova Social em Vendas', 'Vendas', 'Argumentos de Venda', 'PROMPT: Usar Prova Social em Vendas

Você é um especialista em usar prova social para aumentar conversões. Crie estratégias e scripts para usar prova social que:
- Sejam específicas e credíveis
- Mostrem resultados similares
- Usem diferentes tipos de prova social
- Sejam aplicáveis em diferentes momentos da venda

Contexto:
Produto/Serviço: [Descreva]
Cases de sucesso disponíveis: [Descreva brevemente]
Clientes de destaque: [Mencione se houver]
Métricas de sucesso: [Números, estatísticas]

Crie estratégias para usar prova social em:

1. PROSPECÇÃO
   - Como mencionar cases na primeira abordagem
   - Scripts para email/LinkedIn

2. APRESENTAÇÃO
   - Como inserir cases na apresentação
   - Quais cases usar para cada tipo de cliente

3. OBJEÇÕES
   - Como usar prova social para superar objeções
   - Scripts específicos

4. FECHAMENTO
   - Como usar prova social para acelerar decisão
   - Técnicas de urgência social

Tipos de prova social a incluir:
- Depoimentos de clientes
- Cases de sucesso com números
- Logos de clientes
- Estatísticas e métricas
- Certificações e prêmios
- Número de clientes atendidos

', 8, true),
('Argumentos de Diferenciação Competitiva', 'Vendas', 'Argumentos de Venda', 'PROMPT: Argumentos de Diferenciação Competitiva

Você é um estrategista de vendas. Crie argumentos de diferenciação que:
- Destachem o que te torna único
- Sejam baseados em fatos, não opiniões
- Conectem diferenciação com benefícios para o cliente
- Sejam difíceis de copiar
- Funcionem contra concorrentes específicos

Contexto:
Seu produto/serviço: [Descreva]
Principais concorrentes: [Liste 3-5]
Suas vantagens reais: [Liste]
Pontos fracos dos concorrentes: [Mencione se souber]

Crie argumentos de diferenciação organizados por:

1. DIFERENCIAÇÃO POR RECURSO/TECNOLOGIA
   - O que você tem que outros não têm
   - Como isso beneficia o cliente

2. DIFERENCIAÇÃO POR PROCESSO/METODOLOGIA
   - Como você faz diferente
   - Por que isso é melhor

3. DIFERENCIAÇÃO POR ATENDIMENTO/SUPORTE
   - Nível de suporte oferecido
   - Experiência do cliente

4. DIFERENCIAÇÃO POR RESULTADOS
   - Resultados únicos que você entrega
   - Métricas de sucesso

5. COMPARAÇÃO DIRETA COM CONCORRENTES
   - Tabela comparativa (se aplicável)
   - Argumentos para cada concorrente

Formato: Scripts prontos para usar em reuniões + documento comparativo.

', 9, true),
('Sequência de Emails de Follow-up', 'Vendas', 'Follow-up', 'PROMPT: Sequência de Emails de Follow-up

Você é um especialista em email marketing e nutrição de leads. Crie uma sequência de follow-up (drip campaign) que:
- Tenha 5-7 emails
- Seja espaçada estrategicamente
- Adicione valor em cada email
- Não seja apenas "você ainda está interessado?"
- Tenha diferentes abordagens

Contexto:
Situação: [Lead que não respondeu após primeira abordagem / Cliente que recebeu proposta / etc.]
Produto/Serviço: [Descreva]
Objetivo: [Reagendar reunião / Fechar venda / Gerar interesse]

Crie uma sequência completa:

Email 1 (Dia 3): [Tema e objetivo]
- Assunto
- Corpo
- CTA

Email 2 (Dia 7): [Tema e objetivo]
- Assunto
- Corpo
- CTA

Email 3 (Dia 14): [Tema e objetivo]
- Assunto
- Corpo
- CTA

Email 4 (Dia 21): [Tema e objetivo]
- Assunto
- Corpo
- CTA

Email 5 (Dia 30): [Tema e objetivo - último]
- Assunto
- Corpo
- CTA

Para cada email, inclua:
- Razão do timing
- Tipo de conteúdo (educativo, case, oferta, etc.)
- Tom de voz
- O que fazer se houver resposta

', 10, true),
('Script de Ligação de Follow-up', 'Vendas', 'Follow-up', 'PROMPT: Script de Ligação de Follow-up

Você é um consultor de vendas. Crie um script de ligação de follow-up que:
- Tenha abertura que gere reconhecimento
- Adicione valor na conversa
- Não seja apenas "você viu minha proposta?"
- Crie urgência sem ser pushy
- Feche com próximo passo claro

Contexto:
Situação anterior: [Última interação - reunião, proposta enviada, etc.]
Tempo desde último contato: [X dias/semanas]
Produto/Serviço: [Descreva]
Objetivo da ligação: [Reagendar / Fechar / Qualificar mais]

Crie o script completo:

1. ABERTURA (30 segundos)
   - Reconhecimento da última conversa
   - Razão da ligação
   - Permissão para continuar

2. VALOR ADICIONADO (1-2 minutos)
   - Compartilhar algo útil (case, insight, novidade)
   - Pergunta que gera interesse

3. DESCOBERTA (1-2 minutos)
   - Onde está no processo de decisão
   - O que precisa para avançar
   - Objeções ou preocupações

4. FECHAMENTO (30 segundos - 1 minuto)
   - Próximo passo claro
   - Compromisso específico
   - Confirmação de data/hora

Inclua também:
- O que fazer se não atender
- O que fazer se disser "não estou interessado"
- O que fazer se pedir mais tempo

', 11, true),
('Estratégia de Reengajamento de Leads Frios', 'Vendas', 'Follow-up', 'PROMPT: Estratégia de Reengajamento de Leads Frios

Você é um especialista em reativar leads que ficaram frios. Crie uma estratégia de reengajamento que:
- Identifique leads que valem a pena reativar
- Use diferentes abordagens e canais
- Adicione valor novo
- Não seja apenas "lembra de mim?"
- Tenha critérios claros de quando parar

Contexto:
Tempo sem contato: [X meses]
Última interação: [Descreva]
Razão do esfriamento: [Se souber - orçamento, timing, etc.]
Produto/Serviço: [Descreva]

Crie uma estratégia completa:

1. ANÁLISE E SEGMENTAÇÃO
   - Critérios para identificar leads reativáveis
   - Segmentação por perfil
   - Priorização

2. ABORDAGENS POR CANAL
   - Email de reengajamento (3 opções diferentes)
   - Mensagem LinkedIn
   - Ligação (se aplicável)
   - WhatsApp (se tiver contato)

3. GATILHOS DE REATIVAÇÃO
   - Novidades do produto
   - Cases de sucesso recentes
   - Ofertas especiais (se aplicável)
   - Conteúdo educativo relevante

4. SEQUÊNCIA DE REATIVAÇÃO
   - Email 1: [Tema]
   - Email 2: [Tema] (se não responder)
   - Email 3: [Tema] (última tentativa)

5. CRITÉRIOS DE PARADA
   - Quando considerar lead perdido
   - Quando manter em nutrição leve

6. MÉTRICAS DE SUCESSO
   - Taxa de resposta esperada
   - Taxa de reativação

', 12, true),
('Como Lidar com Objeção de Preço', 'Vendas', 'Objeções', 'PROMPT: Como Lidar com Objeção de Preço

Você é um especialista em superar objeções de preço. Crie estratégias e scripts para lidar com objeções de preço que:
- Não desvalorizem seu produto
- Mostrem valor antes de falar de preço
- Usem diferentes técnicas conforme a situação
- Preservem o relacionamento
- Fechem a venda quando possível

Contexto:
Produto/Serviço: [Descreva]
Preço: R$ [valor]
Investimento médio do mercado: [Se souber]
Principais concorrentes e preços: [Se souber]

Crie estratégias para diferentes situações:

1. "É MUITO CARO" (objeção genérica)
   - Técnica: Reframing de valor
   - Script completo
   - Perguntas para descobrir o que "caro" significa

2. "NÃO TENHO ORÇAMENTO" (sem dinheiro)
   - Técnica: Descobrir se é falta de dinheiro ou prioridade
   - Script completo
   - Alternativas (parcelamento, menor investimento, etc.)

3. "CONCORRENTE X É MAIS BARATO" (comparação)
   - Técnica: Diferenciação de valor
   - Script completo
   - Comparação justa

4. "PRECISO PENSAR POR CAUSA DO PREÇO" (timing)
   - Técnica: Criar urgência com valor
   - Script completo
   - Ofertas de incentivo (se aplicável)

5. "NÃO VALE ESSE INVESTIMENTO" (valor não percebido)
   - Técnica: Reapresentar ROI
   - Script completo
   - Cálculo de ROI personalizado

Para cada situação, inclua:
- O que NÃO fazer
- Perguntas poderosas
- Script passo a passo
- Quando oferecer desconto (se aplicável)
- Como fechar após superar objeção

', 13, true),
('Como Lidar com Objeção de Timing', 'Vendas', 'Objeções', 'PROMPT: Como Lidar com Objeção de Timing

Você é um especialista em criar urgência e lidar com objeções de timing. Crie estratégias para quando o cliente diz "não é o momento certo" que:
- Descubram se é timing real ou desculpa
- Criem urgência legítima
- Não sejam manipulativas
- Preservem o relacionamento
- Mantenham o lead quente

Contexto:
Produto/Serviço: [Descreva]
Ciclo de venda típico: [X dias/semanas]
Sazonalidade: [Se houver]

Crie estratégias para diferentes situações:

1. "VAMOS DEIXAR PARA O PRÓXIMO ANO/TRIMESTRE" (adiamento)
   - Perguntas para descobrir razão real
   - Script para criar urgência
   - Alternativas (começar menor, piloto, etc.)

2. "PRECISO CONSULTAR MINHA EQUIPE" (aprovação)
   - Como acelerar processo de aprovação
   - Script para envolver outras pessoas
   - Materiais para ajudar na apresentação interna

3. "ESTAMOS EM REORGANIZAÇÃO" (mudança interna)
   - Como manter relacionamento
   - Quando voltar a abordar
   - Estratégia de nutrição

4. "VAMOS ESPERAR O ORÇAMENTO DO PRÓXIMO ANO" (orçamento)
   - Como conectar com urgência de resolver problema
   - Custo de esperar
   - Alternativas de investimento

5. "NÃO É PRIORIDADE AGORA" (priorização)
   - Como elevar prioridade
   - Perguntas sobre impacto de não resolver
   - Script para reposicionar urgência

Para cada situação:
- Perguntas de descoberta
- Script completo
- Quando aceitar o "não agora"
- Estratégia de follow-up
- Como manter lead quente

', 14, true),
('Como Lidar com Objeções sobre Concorrência', 'Vendas', 'Objeções', 'PROMPT: Como Lidar com Objeções sobre Concorrência

Você é um estrategista de vendas. Crie estratégias para quando o cliente menciona concorrentes que:
- Não desqualifiquem concorrentes diretamente
- Destaquem suas diferenças de forma positiva
- Usem perguntas para descobrir o que o cliente realmente quer
- Preservem relacionamento
- Fechem a venda quando possível

Contexto:
Seu produto/serviço: [Descreva]
Principais concorrentes: [Liste]
Suas principais vantagens: [Liste]

Crie estratégias para diferentes situações:

1. "ESTAMOS AVALIANDO CONCORRENTE X" (comparação ativa)
   - Perguntas para entender critérios de decisão
   - Script para destacar diferenças
   - Como oferecer comparação justa

2. "CONCORRENTE X JÁ NOS ATENDE" (cliente atual)
   - Como abordar sem ser agressivo
   - Perguntas sobre satisfação atual
   - Quando e como fazer migração

3. "CONCORRENTE X É MAIS CONHECIDO" (marca)
   - Como competir com marca maior
   - Vantagens de ser menor/especializado
   - Script de diferenciação

4. "CONCORRENTE X TEM MAIS RECURSOS" (features)
   - Como focar em valor vs features
   - Perguntas sobre uso real de recursos
   - Script de benefícios vs recursos

5. "JÁ TRABALHAMOS COM CONCORRENTE X" (relacionamento)
   - Como quebrar inércia
   - Perguntas sobre gaps na solução atual
   - Quando propor complemento vs substituição

Para cada situação:
- O que NÃO fazer
- Perguntas poderosas
- Script passo a passo
- Materiais de apoio (comparativos, cases)
- Como fechar

', 15, true),
('Técnicas de Fechamento de Venda', 'Vendas', 'Fechamento', 'PROMPT: Técnicas de Fechamento de Venda

Você é um mestre em fechamento de vendas. Crie um guia completo de técnicas de fechamento que:
- Sejam éticas e consultivas
- Funcionem para diferentes personalidades
- Tenham scripts prontos
- Incluam quando usar cada técnica
- Preservem relacionamento mesmo se não fechar

Contexto:
Tipo de venda: [B2B / B2C / Consultoria / Produto / Serviço]
Ciclo de venda: [Curto / Médio / Longo]
Valor médio: [Baixo / Médio / Alto]

Crie um guia com 10-12 técnicas de fechamento:

1. FECHAMENTO POR ASSUMIR (Assumptive Close)
   - Quando usar
   - Script
   - Exemplo prático

2. FECHAMENTO POR ALTERNATIVA (Alternative Close)
   - Quando usar
   - Script
   - Exemplo prático

3. FECHAMENTO POR URGÊNCIA (Urgency Close)
   - Quando usar
   - Script
   - Exemplo prático

4. FECHAMENTO POR RESUMO (Summary Close)
   - Quando usar
   - Script
   - Exemplo prático

5. FECHAMENTO POR PERGUNTA (Question Close)
   - Quando usar
   - Script
   - Exemplo prático

6. FECHAMENTO POR OBJEÇÃO FINAL (Final Objection Close)
   - Quando usar
   - Script
   - Exemplo prático

7. FECHAMENTO POR TESTE (Trial Close)
   - Quando usar
   - Script
   - Exemplo prático

8. FECHAMENTO POR SILÊNCIO (Silence Close)
   - Quando usar
   - Como fazer
   - Exemplo prático

Para cada técnica:
- Definição clara
- Quando é mais efetiva
- Script completo
- Exemplo de diálogo
- Sinais de que está funcionando
- O que fazer se não funcionar

Inclua também:
- Sinais de que o cliente está pronto para fechar
- Como lidar com "preciso pensar"
- Quando NÃO tentar fechar
- Como manter relacionamento se não fechar agora

', 16, true),
('Como Apresentar e Fechar uma Proposta Comercial', 'Vendas', 'Fechamento', 'PROMPT: Como Apresentar e Fechar uma Proposta Comercial

Você é um especialista em apresentação de propostas comerciais. Crie um guia completo para apresentar e fechar propostas que:
- Estruturem a proposta de forma persuasiva
- Incluam scripts de apresentação
- Tenham técnicas de fechamento integradas
- Lidem com objeções comuns
- Aumentem taxa de fechamento

Contexto:
Tipo de proposta: [Produto / Serviço / Projeto / Contrato recorrente]
Valor: R$ [valor]
Concorrentes envolvidos: [Se houver]

Crie um guia completo:

1. ESTRUTURA DA PROPOSTA
   - Elementos essenciais
   - Ordem de apresentação
   - O que destacar

2. PREPARAÇÃO PARA APRESENTAÇÃO
   - Checklist pré-apresentação
   - Materiais necessários
   - Como ensaiar

3. SCRIPT DE APRESENTAÇÃO
   - Abertura (5 min)
   - Revisão de necessidades (10 min)
   - Apresentação da solução (15-20 min)
   - Apresentação de investimento (5 min)
   - Fechamento (5-10 min)

4. TÉCNICAS DE APRESENTAÇÃO
   - Como apresentar preço
   - Como usar prova social
   - Como criar urgência
   - Como lidar com interrupções

5. FECHAMENTO DURANTE APRESENTAÇÃO
   - Sinais de que pode fechar
   - Perguntas de fechamento
   - Como pedir o "sim"

6. PÓS-APRESENTAÇÃO
   - Follow-up imediato
   - Como lidar com "vou pensar"
   - Sequência de follow-up
   - Quando e como fazer follow-up

7. OBJEÇÕES COMUNS E RESPOSTAS
   - "Preciso consultar equipe"
   - "Preciso pensar"
   - "Está caro"
   - "Vamos fazer depois"
   - Scripts de resposta

Inclua também:
- Template de proposta (estrutura)
- Email de envio de proposta
- Script de ligação após envio
- Como negociar sem desvalorizar

', 17, true),
('Template de Proposta Comercial Persuasiva', 'Vendas', 'Propostas', 'PROMPT: Template de Proposta Comercial Persuasiva

Você é um especialista em criar propostas comerciais que convertem. Crie um template de proposta comercial que:
- Seja profissional e visualmente atraente
- Foque em valor, não apenas em preço
- Seja personalizada e relevante
- Tenha estrutura persuasiva
- Facilite a decisão do cliente

Contexto:
Tipo de negócio: [Descreva]
Produto/Serviço: [Descreva]
Público-alvo: [Descreva]

Crie um template completo com:

1. CAPA
   - Elementos essenciais
   - Design sugerido
   - Informações a incluir

2. SUMÁRIO EXECUTIVO
   - O que incluir
   - Como estruturar
   - Exemplo

3. SITUAÇÃO ATUAL / DESAFIOS
   - Como apresentar problemas identificados
   - Formato sugerido

4. SOLUÇÃO PROPOSTA
   - Como apresentar sua solução
   - Estrutura de benefícios
   - Diferenciação

5. METODOLOGIA / PROCESSO
   - Como apresentar como você trabalha
   - Etapas e cronograma
   - O que incluir

6. RESULTADOS ESPERADOS
   - Como apresentar ROI
   - Métricas e KPIs
   - Prova social

7. INVESTIMENTO
   - Como apresentar preço
   - Estrutura de valores
   - Formas de pagamento
   - Garantias (se houver)

8. PRÓXIMOS PASSOS
   - Como facilitar a decisão
   - Call-to-action claro
   - Prazos e urgência

9. ANEXOS
   - O que incluir
   - Cases de sucesso
   - Certificações
   - Contrato/termos

Para cada seção:
- Conteúdo sugerido
- Formato/design
- Exemplos de texto
- O que destacar visualmente
- Comprimento sugerido

Inclua também:
- Checklist de revisão
- Dicas de design visual
- Como personalizar o template
- Erros comuns a evitar

', 18, true),
('Como Personalizar Propostas Comerciais', 'Vendas', 'Propostas', 'PROMPT: Como Personalizar Propostas Comerciais

Você é um consultor de vendas consultivas. Crie um guia para personalizar propostas comerciais que:
- Mostrem que você entendeu o cliente
- Destaquem relevância específica
- Aumentem taxa de aceitação
- Economizem tempo na criação
- Mantenham qualidade profissional

Contexto:
Template base disponível: [Sim/Não]
Tempo médio para criar proposta: [X horas]
Volume de propostas: [X por mês]

Crie um guia completo:

1. INFORMAÇÕES A COLETAR ANTES
   - Checklist de descoberta
   - Perguntas essenciais
   - Onde encontrar informações

2. ELEMENTOS DE PERSONALIZAÇÃO
   - O que SEMPRE personalizar
   - O que pode ser template
   - Nível de personalização por tipo de cliente

3. PERSONALIZAÇÃO POR SEÇÃO
   - Capa: [Como personalizar]
   - Situação atual: [Como personalizar]
   - Solução: [Como personalizar]
   - Investimento: [Como personalizar]
   - Próximos passos: [Como personalizar]

4. USO DE CASES E PROVA SOCIAL
   - Como escolher cases relevantes
   - Como adaptar cases para o cliente
   - Onde inserir na proposta

5. LINGUAGEM E TOM
   - Como adaptar linguagem ao cliente
   - Tom formal vs informal
   - Jargões do setor

6. VALORES E BENEFÍCIOS
   - Como destacar benefícios mais relevantes
   - Como calcular ROI específico
   - Como conectar com objetivos do cliente

7. PROCESSO EFICIENTE
   - Template base + personalização
   - Checklist rápido
   - Tempo estimado por seção
   - Ferramentas recomendadas

8. EXEMPLOS PRÁTICOS
   - Exemplo 1: Cliente pequeno, proposta simples
   - Exemplo 2: Cliente grande, proposta detalhada
   - Exemplo 3: Proposta urgente, personalização mínima

Inclua também:
- Template de checklist de personalização
- Script de perguntas para descoberta
- Quando NÃO personalizar demais
- Como balancear tempo vs personalização

', 19, true),
('Como Negociar Propostas Comerciais', 'Vendas', 'Propostas', 'PROMPT: Como Negociar Propostas Comerciais

Você é um especialista em negociação comercial. Crie um guia para negociar propostas que:
- Preservem valor e margem
- Mantenham relacionamento positivo
- Sejam win-win
- Tenham alternativas preparadas
- Fechem vendas quando possível

Contexto:
Margem típica: [X%]
Flexibilidade de preço: [Alta / Média / Baixa]
Concorrência: [Alta / Média / Baixa]

Crie um guia completo:

1. PREPARAÇÃO PARA NEGOCIAÇÃO
   - O que definir antes de negociar
   - Limites claros (preço mínimo, condições, etc.)
   - Alternativas preparadas
   - BATNA (Best Alternative to Negotiated Agreement)

2. TÉCNICAS DE NEGOCIAÇÃO
   - Ancoragem (como apresentar preço)
   - Concessões (quando e como fazer)
   - Pacotes (como criar opções)
   - Valor agregado (como adicionar sem custo)

3. SITUAÇÕES COMUNS E ESTRATÉGIAS
   
   a) "PODE FAZER DESCONTO?"
      - Como responder
      - Alternativas a desconto
      - Quando oferecer desconto
      - Como estruturar desconto

   b) "PRECISO DE CONDIÇÕES DIFERENTES"
      - Como negociar condições
      - O que é negociável vs não negociável
      - Scripts

   c) "ORÇAMENTO É MENOR"
      - Como adaptar proposta
      - O que remover/adicionar
      - Como manter valor

   d) "PRECISO APROVAÇÃO DE SUPERIOR"
      - Como facilitar aprovação
      - Materiais para apresentação interna
      - Como envolver decisor

4. SCRIPTS DE NEGOCIAÇÃO
   - Abertura de negociação
   - Como fazer perguntas
   - Como fazer ofertas
   - Como responder contra-ofertas
   - Como fechar acordo

5. PSICOLOGIA DA NEGOCIAÇÃO
   - Leis de influência aplicadas
   - Como criar urgência
   - Como usar escassez
   - Como criar reciprocidade

6. ERROS COMUNS
   - O que evitar
   - Como recuperar de erro
   - Sinais de que está indo mal

7. FECHAMENTO DA NEGOCIAÇÃO
   - Como confirmar acordo
   - Como documentar
   - Próximos passos
   - Como celebrar sem exagerar

Inclua também:
- Quando dizer "não" à negociação
- Como manter margem
- Técnicas de negociação por email vs pessoal
- Como negociar com diferentes personalidades

', 20, true);