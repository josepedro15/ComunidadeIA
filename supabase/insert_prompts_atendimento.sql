-- ============================================================================
-- INSERÇÃO DE PROMPTS - ATENDIMENTO
-- ============================================================================
-- Total: 20 prompts
-- Execute este script no Supabase SQL Editor
-- ============================================================================

INSERT INTO public.prompts (titulo, categoria, subcategoria, conteudo, ordem, ativo) VALUES

('Respostas Padrão para Dúvidas Frequentes', 'Atendimento', 'Respostas Padrão', 'PROMPT: Respostas Padrão para Dúvidas Frequentes

Você é um especialista em atendimento ao cliente. Crie respostas padrão para dúvidas frequentes que:
- Sejam claras e objetivas
- Resolvam o problema completamente
- Tenham tom empático e profissional
- Economizem tempo da equipe
- Melhorem satisfação do cliente

Contexto:
Produto/Serviço: [Descreva]
Canais de atendimento: [Email / Chat / WhatsApp / Telefone]
Principais dúvidas: [Liste 10-15 dúvidas mais comuns]

Crie respostas padrão para cada dúvida:

DUVIDA 1: [Título da dúvida]
- Resposta curta (para chat/WhatsApp - máximo 200 palavras)
- Resposta completa (para email - até 400 palavras)
- Tom: [Empático / Técnico / Simples]
- Anexos/links úteis: [Se houver]
- Próximos passos: [O que o cliente deve fazer]

DUVIDA 2: [Título da dúvida]
- [Mesmo formato]

[Continue para todas as dúvidas]

Para cada resposta, inclua também:
- Variações da resposta (diferentes tons)
- Quando usar cada versão
- Perguntas de follow-up sugeridas
- Como personalizar a resposta
- Sinais de que precisa escalar

Inclua também:
- Template de resposta genérica (quando não há resposta padrão)
- Como identificar novas dúvidas frequentes
- Como atualizar respostas baseado em feedback
- Banco de recursos (links, vídeos, guias)

', 41, true),
('Respostas Padrão para Reclamações', 'Atendimento', 'Respostas Padrão', 'PROMPT: Respostas Padrão para Reclamações

Você é um especialista em gestão de reclamações. Crie respostas padrão para diferentes tipos de reclamações que:
- Demonstrem empatia
- Reconheçam o problema
- Ofereçam solução clara
- Restaurem confiança
- Transformem experiência negativa em positiva

Contexto:
Tipo de negócio: [B2B / B2C / E-commerce / Serviços]
Principais tipos de reclamação: [Liste 8-10 tipos mais comuns]
Política de reembolso: [Descreva]
Nível de autoridade da equipe: [O que podem resolver / O que precisa escalar]

Crie respostas para cada tipo:

RECLAMAÇÃO 1: [Tipo - ex: Atraso na entrega]
- Abertura empática
- Reconhecimento do problema
- Explicação (sem desculpas)
- Solução oferecida
- Compensação (se aplicável)
- Próximos passos
- Fechamento
- Tom: [Empático / Profissional]

RECLAMAÇÃO 2: [Tipo - ex: Produto com defeito]
- [Mesmo formato]

[Continue para todos os tipos]

Para cada tipo, inclua também:
- Nível de urgência
- Quando escalar
- O que NÃO dizer
- Como personalizar
- Follow-up necessário

TIPOS ESPECIAIS:

1. Cliente Muito Irritado
   - Abordagem específica
   - Técnicas de desescalar
   - Resposta modelo

2. Reclamação Repetida
   - Como abordar
   - Resposta modelo
   - Ações preventivas

3. Reclamação Não Resolvível Imediatamente
   - Como comunicar
   - Timeline
   - Resposta modelo

Inclua também:
- Princípios de gestão de reclamações
- Erros comuns a evitar
- Como transformar em oportunidade
- Métricas de satisfação pós-reclamação
- Template de follow-up

', 42, true),
('Respostas Padrão para Solicitações Comuns', 'Atendimento', 'Respostas Padrão', 'PROMPT: Respostas Padrão para Solicitações Comuns

Você é um especialista em atendimento ao cliente. Crie respostas padrão para solicitações comuns que:
- Sejam eficientes
- Forneçam informação completa
- Guiem o cliente no processo
- Reduzam idas e vindas
- Melhorem experiência

Contexto:
Produto/Serviço: [Descreva]
Tipos de solicitações: [Liste 10-12 solicitações mais comuns]
Processos internos: [Descreva processos relevantes]

Crie respostas para cada solicitação:

SOLICITAÇÃO 1: [Tipo - ex: Solicitar reembolso]
- Resposta afirmativa (quando pode atender)
- Resposta negativa (quando não pode, mas educada)
- Informações necessárias do cliente
- Processo passo a passo
- Prazos
- Próximos passos
- Contatos úteis

SOLICITAÇÃO 2: [Tipo - ex: Alterar dados cadastrais]
- [Mesmo formato]

[Continue para todas as solicitações]

TIPOS DE SOLICITAÇÕES COMUNS:

1. Alterações de Cadastro
   - Mudança de email
   - Mudança de endereço
   - Mudança de plano
   - Cancelamento

2. Informações sobre Produto/Serviço
   - Especificações técnicas
   - Disponibilidade
   - Preços
   - Comparativos

3. Suporte Técnico
   - Problemas de acesso
   - Configurações
   - Integrações
   - Troubleshooting

4. Financeiro
   - Faturas
   - Pagamentos
   - Reembolsos
   - Descontos

5. Entrega/Logística
   - Rastreamento
   - Alteração de endereço
   - Prazos
   - Devoluções

Para cada tipo:
- Resposta completa
- Checklist de informações necessárias
- Processo interno (para equipe)
- Como verificar identidade do cliente
- Quando escalar

Inclua também:
- Template genérico para solicitações não previstas
- Como coletar informações necessárias
- Automações possíveis
- Como melhorar processos baseado em solicitações

', 43, true),
('Protocolo de Escalação de Problemas', 'Atendimento', 'Escalação', 'PROMPT: Protocolo de Escalação de Problemas

Você é um especialista em gestão de escalação de atendimento. Crie um protocolo completo de escalação que:
- Identifique quando escalar
- Defina níveis de escalação
- Tenha processos claros
- Seja eficiente
- Mantenha cliente informado

Contexto:
Estrutura da equipe: [Descreva níveis/hierarquia]
Tipos de problemas: [Técnicos / Comerciais / Financeiros / Reclamações]
Autoridades por nível: [O que cada nível pode resolver]
Canais: [Email / Chat / Telefone / Presencial]

Crie protocolo completo:

1. NÍVEIS DE ESCALAÇÃO

   Nível 1: Atendimento Inicial
   - Responsabilidades
   - Tipos de problemas que resolve
   - Quando escalar
   - Tempo máximo de tentativa
   
   Nível 2: Especialista/Supervisor
   - Responsabilidades
   - Tipos de problemas que resolve
   - Quando escalar
   - Tempo máximo de tentativa
   
   Nível 3: Gerência
   - Responsabilidades
   - Tipos de problemas que resolve
   - Quando escalar
   
   Nível 4: Diretoria (se aplicável)
   - Responsabilidades
   - Quando escalar

2. CRITÉRIOS DE ESCALAÇÃO

   Escalar quando:
   - Problema fora do escopo
   - Cliente insatisfeito após tentativas
   - Problema técnico complexo
   - Solicitação de desconto/reembolso acima do limite
   - Cliente VIP
   - Problema recorrente
   - Urgência alta
   - [Outros critérios específicos]

3. PROCESSO DE ESCALAÇÃO

   Passo a passo:
   1. Identificar necessidade de escalação
   2. Coletar informações necessárias
   3. Documentar tentativas anteriores
   4. Escalar com contexto completo
   5. Informar cliente
   6. Acompanhar resolução
   7. Follow-up com cliente

4. TEMPLATE DE ESCALAÇÃO

   Para equipe (informações a incluir):
   - ID do ticket/caso
   - Cliente (nome, ID, histórico)
   - Problema resumido
   - Tentativas já realizadas
   - Informações coletadas
   - Urgência
   - Prazo do cliente
   - Por que precisa escalar
   - Sugestão de solução (se tiver)

5. COMUNICAÇÃO COM CLIENTE

   Template de mensagem ao cliente:
   - Reconhecimento
   - O que foi feito até agora
   - O que será feito
   - Quem vai resolver
   - Prazo esperado
   - Como será contatado
   - Contato para dúvidas

6. TIPOS ESPECÍFICOS DE ESCALAÇÃO

   a) Escalação Técnica
      - Quando escalar
      - Para quem
      - Informações necessárias
      - Processo
   
   b) Escalação Comercial
      - [Mesmo formato]
   
   c) Escalação de Reclamação
      - [Mesmo formato]
   
   d) Escalação Urgente
      - [Mesmo formato]

7. ACOMPANHAMENTO

   - Como acompanhar caso escalado
   - Prazos de resposta
   - Quando cobrar atualização
   - Como manter cliente informado
   - Como fechar caso

8. MÉTRICAS E MELHORIAS

   - Métricas de escalação
   - Taxa de escalação por tipo
   - Tempo médio de resolução
   - Como reduzir escalações
   - Treinamento necessário

Inclua também:
- Checklist de escalação
- Erros comuns
- Como evitar escalações desnecessárias
- Quando NÃO escalar
- Ferramentas de gestão

', 44, true),
('Como Lidar com Cliente Muito Irritado', 'Atendimento', 'Escalação', 'PROMPT: Como Lidar com Cliente Muito Irritado

Você é um especialista em gestão de conflitos e atendimento a clientes irritados. Crie um guia completo que:
- Desescalar a situação
- Resolva o problema efetivamente
- Preserve relacionamento
- Proteja a equipe
- Transforme experiência negativa

Contexto:
Canais: [Telefone / Email / Chat / Presencial]
Nível de autoridade da equipe: [O que podem resolver]
Políticas da empresa: [Limites e flexibilidades]

Crie guia completo:

1. PRINCÍPIOS FUNDAMENTAIS

   - Não levar para o pessoal
   - Cliente está irritado com situação, não com você
   - Objetivo: resolver problema, não "ganhar" discussão
   - Empatia genuína
   - Manter calma

2. TÉCNICAS DE DESESCALAÇÃO

   a) Escuta Ativa
      - Deixar cliente desabafar
      - Não interromper
      - Demonstrar que está ouvindo
      - Resumir o que entendeu
   
   b) Validação
      - Reconhecer frustração
      - Validar sentimentos (sem admitir culpa se não houver)
      - Frases poderosas
   
   c) Empatia
      - Demonstrar compreensão
      - Colocar-se no lugar do cliente
      - Tom de voz (se telefone)
   
   d) Foco em Solução
      - Mudar foco de problema para solução
      - Perguntas que direcionam
      - Opções de resolução

3. SCRIPTS POR SITUAÇÃO

   a) Cliente Gritando/Ofendendo
      - O que fazer
      - O que dizer
      - Quando pausar conversa
      - Como retomar
   
   b) Cliente Exigindo Algo Impossível
      - Como comunicar limites
      - Alternativas a oferecer
      - Script
   
   c) Cliente Repetindo Mesma Reclamação
      - Como abordar
      - Script
      - Quando escalar
   
   d) Cliente Ameaçando (cancelar, processo, etc.)
      - Como lidar
      - Script
      - Quando escalar urgentemente

4. FRASES PODEROSAS

   Frases que ajudam:
   - "Entendo sua frustração..."
   - "Você tem razão em estar..."
   - "Vamos resolver isso juntos..."
   - "O que posso fazer para..."
   - "Vou fazer o possível para..."
   - [Mais frases]

   Frases a EVITAR:
   - "Calma..."
   - "Não foi nossa culpa..."
   - "É política da empresa..."
   - "Não posso fazer nada..."
   - [Mais frases]

5. PROCESSO PASSO A PASSO

   1. Respirar e manter calma
   2. Escutar completamente
   3. Validar e demonstrar empatia
   4. Resumir problema
   5. Oferecer solução
   6. Confirmar entendimento
   7. Agir imediatamente
   8. Follow-up

6. QUANDO ESCALAR

   Escalar imediatamente quando:
   - Cliente ameaçando legalmente
   - Cliente sendo abusivo com equipe
   - Situação fora de controle
   - Necessita autorização superior
   - Cliente VIP com problema grave

7. COMUNICAÇÃO POR CANAL

   a) Telefone
      - Tom de voz
      - Pausas estratégicas
      - Técnicas específicas
   
   b) Email/Chat
      - Linguagem escrita
      - Emojis (usar com cuidado)
      - Formatação
   
   c) Presencial
      - Linguagem corporal
      - Espaço pessoal
      - Quando chamar segurança

8. PÓS-RESOLUÇÃO

   - Follow-up obrigatório
   - Verificar satisfação
   - Aprender com situação
   - Documentar para melhorias
   - Cuidar da equipe (debriefing)

9. CUIDADO COM A EQUIPE

   - Como lidar com estresse
   - Debriefing após situação difícil
   - Suporte emocional
   - Quando fazer pausa
   - Recursos disponíveis

10. CASOS ESPECÍFICOS

    - Cliente com histórico de problemas
    - Cliente que sempre reclama
    - Cliente sob influência
    - Cliente com necessidades especiais
    - Situações extremas

Inclua também:
- Checklist de ação
- Quando transferir para supervisor
- Política de "firing" de clientes (se aplicável)
- Métricas de sucesso
- Treinamento recomendado

', 45, true),
('Criar FAQ Automatizado Eficaz', 'Atendimento', 'FAQ Automatizado', 'PROMPT: Criar FAQ Automatizado Eficaz

Você é um especialista em criar FAQs que realmente ajudam clientes. Crie um guia completo para criar FAQ automatizado que:
- Resolva dúvidas reais dos clientes
- Reduza volume de atendimento
- Seja fácil de encontrar e usar
- Seja atualizado regularmente
- Melhore experiência do cliente

Contexto:
Produto/Serviço: [Descreva]
Canais: [Site / App / Chatbot / Email]
Público-alvo: [Descreva]
Principais dúvidas: [Liste se souber]

Crie guia completo:

1. PESQUISA DE DÚVIDAS REAIS

   Fontes de dúvidas:
   - Histórico de atendimento
   - Perguntas em redes sociais
   - Comentários e reviews
   - Pesquisas com clientes
   - Análise de busca no site
   - Equipe de vendas
   - Suporte técnico

2. ESTRUTURA DO FAQ

   a) Organização por Categoria
      - Categorias principais
      - Subcategorias
      - Tags
      - Busca
   
   b) Ordem de Importância
      - Dúvidas mais frequentes primeiro
      - Ordem lógica
      - Relacionadas agrupadas

3. FORMATAÇÃO DE PERGUNTAS E RESPOSTAS

   Template:
   
   PERGUNTA: [Clara, direta, em linguagem do cliente]
   
   RESPOSTA:
   - Resposta curta (1-2 parágrafos)
   - Resposta expandida (se necessário)
   - Passos numerados (quando aplicável)
   - Imagens/vídeos (quando útil)
   - Links relacionados
   - Próximos passos

4. TIPOS DE CONTEÚDO NO FAQ

   a) Como Fazer (Tutoriais)
      - Passo a passo
      - Screenshots
      - Vídeos
   
   b) Informações Gerais
      - O que é
      - Como funciona
      - Especificações
   
   c) Troubleshooting
      - Problemas comuns
      - Soluções
      - Quando contatar suporte
   
   d) Políticas
      - Reembolsos
      - Cancelamentos
      - Privacidade
      - Termos

5. OTIMIZAÇÃO PARA BUSCA

   - Palavras-chave nas perguntas
   - SEO básico
   - Busca interna
   - Autocomplete
   - Perguntas relacionadas

6. INTEGRAÇÃO COM CHATBOT

   - Como chatbot usa FAQ
   - Respostas sugeridas
   - Escalação quando não resolve
   - Aprendizado contínuo

7. DESIGN E UX

   - Layout amigável
   - Busca destacada
   - Categorias visuais
   - Mobile-friendly
   - Acessibilidade

8. ATUALIZAÇÃO CONTÍNUA

   - Frequência de revisão
   - Como identificar novas dúvidas
   - Processo de atualização
   - Remoção de conteúdo desatualizado
   - Feedback dos clientes

9. MÉTRICAS E ANÁLISE

   - Perguntas mais buscadas
   - Taxa de resolução
   - Redução de tickets
   - Satisfação com FAQ
   - Gaps identificados

10. EXEMPLOS PRÁTICOS

    - FAQ completo (10-15 perguntas)
    - Diferentes formatos
    - Boas práticas
    - Erros comuns

Inclua também:
- Template de FAQ
- Checklist de criação
- Ferramentas recomendadas
- Como promover FAQ
- Integração com outros canais

', 46, true),
('Configurar Chatbot com FAQ Automatizado', 'Atendimento', 'FAQ Automatizado', 'PROMPT: Configurar Chatbot com FAQ Automatizado

Você é um especialista em chatbots e automação de atendimento. Crie um guia completo para configurar chatbot que:
- Resolva dúvidas automaticamente
- Escale para atendimento humano quando necessário
- Tenha personalidade adequada
- Aprenda e melhore
- Reduza carga da equipe

Contexto:
Plataforma de chatbot: [Se souber - ex: ManyChat, Chatfuel, Dialogflow, etc.]
Tipo de negócio: [Descreva]
Principais interações: [Dúvidas / Vendas / Suporte / Agendamento]
Integração com atendimento humano: [Sim/Não]

Crie guia completo:

1. DEFINIÇÃO DE PERSONALIDADE

   - Tom de voz
   - Nome do chatbot
   - Nível de formalidade
   - Personalidade (amigável, profissional, etc.)
   - Exemplos de mensagens

2. FLUXOS DE CONVERSAÇÃO PRINCIPAIS

   a) Boas-vindas
      - Mensagem inicial
      - Opções apresentadas
      - Como guiar conversa
   
   b) FAQ Automatizado
      - Como reconhecer perguntas
      - Respostas do FAQ
      - Quando não souber
      - Sugestões de perguntas relacionadas
   
   c) Escalação para Humano
      - Quando escalar
      - Como transferir
      - Mensagem de transição
      - Coletar informações antes
   
   d) Coleta de Informações
      - Nome, email, problema
      - Validação
      - Armazenamento

3. INTENÇÕES E ENTIDADES

   Principais intenções:
   - [Intenção 1 - ex: Consultar status de pedido]
   - [Intenção 2 - ex: Solicitar reembolso]
   - [Intenção 3 - ex: Problema técnico]
   - [Continue...]

   Para cada intenção:
   - Frases de exemplo
   - Resposta do chatbot
   - Ações a tomar
   - Quando escalar

4. CONTEÚDO DO FAQ NO CHATBOT

   - Perguntas mais comuns (10-15)
   - Respostas curtas e diretas
   - Links para mais informações
   - Opção de falar com humano
   - Perguntas relacionadas

5. HANDOFF PARA ATENDIMENTO HUMANO

   Quando escalar:
   - Problema complexo
   - Cliente pede humano
   - Chatbot não entende
   - Situação emocional
   - Venda/negociação

   Processo:
   - Mensagem de transição
   - Coletar contexto
   - Transferir com histórico
   - Informar cliente
   - Tempo de espera

6. INTEGRAÇÕES

   - CRM
   - Sistema de tickets
   - Base de conhecimento
   - WhatsApp/Telegram
   - Email
   - [Outras]

7. TESTES E OTIMIZAÇÃO

   - Testes antes de lançar
   - Cenários a testar
   - Métricas a acompanhar
   - Ajustes baseados em dados
   - Aprendizado contínuo

8. MENSAGENS E SCRIPTS

   Template de mensagens:
   - Boas-vindas
   - Respostas FAQ
   - Quando não sabe
   - Escalação
   - Despedida
   - Erros

9. MÉTRICAS E ANÁLISE

   - Taxa de resolução automática
   - Taxa de escalação
   - Satisfação
   - Perguntas mais comuns
   - Gaps identificados
   - Melhorias necessárias

10. MANUTENÇÃO

    - Atualização de conteúdo
    - Novas intenções
    - Ajustes de personalidade
    - Melhorias baseadas em feedback
    - Treinamento contínuo

Inclua também:
- Checklist de configuração
- Exemplos de fluxos
- Ferramentas recomendadas
- Erros comuns
- Como promover uso do chatbot

', 47, true),
('Estratégia de Acompanhamento Pós-Venda', 'Atendimento', 'Pós-Venda', 'PROMPT: Estratégia de Acompanhamento Pós-Venda

Você é um especialista em pós-venda e retenção de clientes. Crie uma estratégia completa de acompanhamento pós-venda que:
- Garanta satisfação do cliente
- Identifique problemas cedo
- Aumente retenção
- Gere upsell/cross-sell
- Crie defensores da marca

Contexto:
Tipo de produto/serviço: [Descreva]
Ciclo de uso: [Uso único / Recorrente / Assinatura]
Momento crítico: [Primeiros dias / Primeiro mês / Renovação]
Canais: [Email / Telefone / App / Presencial]

Crie estratégia completa:

1. MOMENTOS DE CONTATO

   a) Imediato (Dia 1)
      - Confirmação de compra
      - Informações importantes
      - Próximos passos
      - Suporte disponível
   
   b) Curto Prazo (Dia 3-7)
      - Como está a experiência
      - Dúvidas iniciais
      - Primeiros resultados
      - Dicas de uso
   
   c) Médio Prazo (Dia 14-30)
      - Satisfação geral
      - Problemas encontrados
      - Otimizações
      - Recursos adicionais
   
   d) Longo Prazo (Mensal/Trimestral)
      - Check-in regular
      - Novidades
      - Upsell/cross-sell
      - Renovação (se aplicável)

2. TIPOS DE ACOMPANHAMENTO

   a) Educativo
      - Como usar melhor
      - Dicas e truques
      - Recursos disponíveis
      - Webinars/tutoriais
   
   b) Verificação de Satisfação
      - Pesquisas
      - Chamadas
      - Check-ins
      - Identificação de problemas
   
   c) Proativo
      - Antecipar necessidades
      - Oferecer ajuda
      - Sugerir melhorias
      - Prevenir churn
   
   d) Comercial
      - Upsell
      - Cross-sell
      - Renovação
      - Referências

3. SEQUÊNCIA DE EMAILS PÓS-VENDA

   Email 1 (Dia 1): Confirmação e Boas-vindas
   - Assunto
   - Conteúdo
   - CTA
   
   Email 2 (Dia 3): Primeiros Passos
   - [Mesmo formato]
   
   Email 3 (Dia 7): Como Está?
   - [Mesmo formato]
   
   Email 4 (Dia 14): Dicas Avançadas
   - [Mesmo formato]
   
   Email 5 (Dia 30): Pesquisa de Satisfação
   - [Mesmo formato]
   
   [Continue conforme necessário]

4. LIGAÇÕES ESTRATÉGICAS

   Quando ligar:
   - Clientes de alto valor
   - Primeira compra
   - Problemas identificados
   - Renovação próxima
   - Clientes em risco

   Script de ligação:
   - Abertura
   - Objetivo
   - Perguntas
   - Escuta
   - Solução/Próximos passos
   - Fechamento

5. IDENTIFICAÇÃO DE PROBLEMAS

   Sinais de alerta:
   - Uso baixo/nulo
   - Reclamações
   - Não responde contatos
   - Busca por cancelamento
   - Comparação com concorrentes

   Ações:
   - Contato proativo
   - Investigação
   - Solução rápida
   - Compensação (se necessário)

6. PROGRAMA DE FIDELIDADE

   - Benefícios para clientes fiéis
   - Comunidade exclusiva
   - Conteúdo premium
   - Descontos
   - Prioridade no suporte

7. GERAÇÃO DE REFERÊNCIAS

   Quando pedir:
   - Cliente satisfeito
   - Resultados positivos
   - Momento certo

   Como pedir:
   - Abordagem
   - Incentivos (se aplicável)
   - Facilitação
   - Agradecimento

8. MÉTRICAS E KPIs

   - Taxa de satisfação
   - NPS (Net Promoter Score)
   - Taxa de retenção
   - Taxa de churn
   - Lifetime Value
   - Taxa de upsell
   - Referências geradas

9. AUTOMAÇÕES

   - Emails automáticos
   - Alertas de risco
   - Notificações internas
   - Atribuição de tarefas
   - Follow-ups agendados

10. CASOS ESPECIAIS

    - Clientes VIP
    - Primeira compra
    - Renovação
    - Cancelamento
    - Reativação

Inclua também:
- Templates de comunicação
- Checklist de acompanhamento
- Ferramentas recomendadas
- Erros comuns
- Como escalar programa

', 48, true),
('Criar Pesquisa de Satisfação Eficaz', 'Atendimento', 'Pós-Venda', 'PROMPT: Criar Pesquisa de Satisfação Eficaz

Você é um especialista em pesquisas de satisfação do cliente. Crie um guia completo para criar pesquisas que:
- Sejam curtas e objetivas
- Gerem respostas de qualidade
- Forneçam insights acionáveis
- Aumentem taxa de resposta
- Melhorem experiência do cliente

Contexto:
Momento da pesquisa: [Após compra / Após suporte / Periódica / Cancelamento]
Canal: [Email / SMS / In-app / Site]
Frequência: [Uma vez / Recorrente]
Objetivo: [Satisfação geral / NPS / CSAT / CES / Específico]

Crie guia completo:

1. TIPOS DE PESQUISAS

   a) NPS (Net Promoter Score)
      - Pergunta principal
      - Escala 0-10
      - Perguntas de follow-up
      - Quando usar
   
   b) CSAT (Customer Satisfaction)
      - Pergunta principal
      - Escala
      - Quando usar
   
   c) CES (Customer Effort Score)
      - Pergunta principal
      - Quando usar
   
   d) Pesquisa Customizada
      - Quando criar
      - Estrutura

2. ESTRUTURA DA PESQUISA

   a) Abertura
      - Título
      - Introdução
      - Tempo estimado
      - Por que é importante
   
   b) Perguntas Principais (3-5)
      - Ordem lógica
      - Tipos de perguntas
      - Escalas
   
   c) Perguntas Abertas (1-2)
      - O que perguntar
      - Como formular
   
   d) Fechamento
      - Agradecimento
      - Próximos passos
      - Contato

3. PRINCÍPIOS DE BOAS PERGUNTAS

   - Uma ideia por pergunta
   - Linguagem simples
   - Evitar viés
   - Opções completas
   - Ordem lógica
   - Não muito longo

4. TEMPLATE DE PESQUISA NPS

   Pergunta 1: NPS
   "Em uma escala de 0 a 10, qual a probabilidade de você recomendar [empresa/produto] para um amigo ou colega?"
   
   Pergunta 2: Por quê? (aberta)
   "O que mais te agrada em [empresa/produto]?"
   
   Pergunta 3: Melhorias (aberta)
   "O que poderíamos fazer para melhorar sua experiência?"

5. TEMPLATE DE PESQUISA CSAT

   Pergunta 1: Satisfação Geral
   "Como você avalia sua satisfação geral com [produto/serviço]?"
   [Muito insatisfeito / Insatisfeito / Neutro / Satisfeito / Muito satisfeito]
   
   Pergunta 2: Aspectos Específicos
   "Avalie os seguintes aspectos:"
   - Qualidade do produto
   - Atendimento
   - Valor pelo preço
   - Facilidade de uso
   [Escala para cada]
   
   Pergunta 3: Recomendação
   "Você recomendaria para outros?"
   [Sim / Não / Talvez]

6. TIMING DA PESQUISA

   - Quando enviar
   - Frequência
   - Momento do dia
   - Após qual evento
   - Evitar sobrecarga

7. AUMENTAR TAXA DE RESPOSTA

   - Assunto do email
   - Personalização
   - Incentivos (se aplicável)
   - Lembrete (quando enviar)
   - Facilidade de resposta
   - Mobile-friendly

8. ANÁLISE DE RESULTADOS

   - Métricas principais
   - Segmentação
   - Tendências
   - Comparações
   - Insights acionáveis
   - Ações baseadas em resultados

9. FOLLOW-UP COM CLIENTES

   a) Clientes Satisfeitos (Promotores)
      - Agradecimento
      - Pedido de referência
      - Programa de fidelidade
   
   b) Clientes Neutros (Passivos)
      - Entender melhor
      - Melhorar experiência
      - Converter em promotores
   
   c) Clientes Insatisfeitos (Detratores)
      - Contato imediato
      - Investigação
      - Solução
      - Recuperação

10. FERRAMENTAS E PLATAFORMAS

    - Ferramentas gratuitas
    - Ferramentas pagas
    - Integrações
    - Automações
    - Análise

Inclua também:
- Exemplos de pesquisas
- Templates prontos
- Checklist de criação
- Erros comuns
- Como agir com resultados

', 49, true),
('Estratégia de Retenção e Prevenção de Churn', 'Atendimento', 'Pós-Venda', 'PROMPT: Estratégia de Retenção e Prevenção de Churn

Você é um especialista em retenção de clientes e prevenção de churn. Crie uma estratégia completa que:
- Identifique clientes em risco
- Prevenha cancelamentos
- Aumente lifetime value
- Melhore retenção
- Seja proativa

Contexto:
Tipo de negócio: [Assinatura / Recorrente / Projeto]
Ciclo de renovação: [Mensal / Trimestral / Anual]
Taxa de churn atual: [Se souber]
Principais razões de cancelamento: [Se souber]

Crie estratégia completa:

1. IDENTIFICAÇÃO DE CLIENTES EM RISCO

   Sinais de alerta:
   - Uso diminuindo
   - Não acessa há X tempo
   - Não responde contatos
   - Reclamações recentes
   - Busca por cancelamento no site
   - Comparação com concorrentes
   - Mudanças de comportamento
   - [Outros específicos]

   Score de risco:
   - Como calcular
   - Níveis (Baixo / Médio / Alto / Crítico)
   - Ações por nível

2. PROGRAMA DE RETENÇÃO

   a) Prevenção (Clientes Saudáveis)
      - Acompanhamento regular
      - Valor contínuo
      - Engajamento
      - Comunidade
   
   b) Intervenção (Clientes em Risco)
      - Contato proativo
      - Investigação
      - Solução de problemas
      - Ofertas especiais (se aplicável)
   
   c) Recuperação (Clientes Cancelando)
      - Última tentativa
      - Ofertas de retenção
      - Entender razão
      - Processo de cancelamento

3. RAZÕES COMUNS DE CHURN

   Para cada razão, estratégia:
   
   a) Preço
      - Como abordar
      - Alternativas
      - Valor vs preço
      - Ofertas de retenção
   
   b) Não Está Usando
      - Reengajamento
      - Educação
      - Onboarding melhorado
      - Dicas de uso
   
   c) Problemas Técnicos
      - Resolução rápida
      - Compensação
      - Melhorias
   
   d) Concorrência
      - Diferenciação
      - Valor único
      - Comparação
   
   e) Mudança de Necessidades
      - Adaptação
      - Upsell/downgrade
      - Novos recursos

4. INTERVENÇÕES POR NÍVEL DE RISCO

   Risco Baixo:
   - Acompanhamento padrão
   - Conteúdo de valor
   - Engajamento leve
   
   Risco Médio:
   - Contato proativo
   - Pesquisa de satisfação
   - Ofertas de valor
   
   Risco Alto:
   - Ligação pessoal
   - Investigação profunda
   - Solução imediata
   - Ofertas especiais
   
   Risco Crítico:
   - Ação imediata
   - Escalação
   - Máxima flexibilidade
   - Retenção agressiva

5. OFERTAS DE RETENÇÃO

   Quando oferecer:
   - Cliente cancelando
   - Cliente em risco alto
   - Renovação próxima
   
   Tipos de ofertas:
   - Desconto temporário
   - Upgrade gratuito
   - Período grátis
   - Recursos adicionais
   - Plano personalizado
   
   Como estruturar:
   - Valor da oferta
   - Condições
   - Prazo
   - Comunicação

6. PROCESSO DE CANCELAMENTO

   - Como tornar difícil (sem ser abusivo)
   - Perguntas durante cancelamento
   - Ofertas de retenção
   - Processo simplificado (se realmente quer)
   - Pesquisa de saída
   - Reativação futura

7. PROGRAMA DE FIDELIDADE

   - Benefícios para clientes fiéis
   - Descontos progressivos
   - Recursos exclusivos
   - Comunidade VIP
   - Prioridade
   - Reconhecimento

8. MÉTRICAS E KPIs

   - Taxa de churn (mensal, anual)
   - Taxa de retenção
   - Lifetime Value (LTV)
   - CAC (Custo de Aquisição)
   - LTV:CAC ratio
   - Taxa de recuperação
   - Tempo até churn
   - Razões de churn

9. AUTOMAÇÕES

   - Alertas de risco
   - Emails de reengajamento
   - Notificações internas
   - Workflows de retenção
   - Acompanhamento automático

10. CASOS ESPECIAIS

    - Clientes VIP
    - Primeiro ano
    - Renovação anual
    - Downgrade vs cancelamento
    - Pausa temporária

Inclua também:
- Scripts de retenção
- Templates de comunicação
- Checklist de intervenção
- Ferramentas recomendadas
- Como calcular ROI de retenção

', 50, true),
('Guia de Troubleshooting Técnico', 'Atendimento', 'Suporte Técnico', 'PROMPT: Guia de Troubleshooting Técnico

Você é um especialista em suporte técnico. Crie um guia completo de troubleshooting que:
- Resolva problemas comuns rapidamente
- Seja fácil de seguir
- Economize tempo da equipe
- Melhore resolução na primeira interação
- Seja atualizado regularmente

Contexto:
Produto/Serviço: [Descreva]
Tipo de suporte: [Software / Hardware / SaaS / E-commerce / etc.]
Principais problemas: [Liste 10-15 problemas mais comuns]
Nível técnico do público: [Iniciante / Intermediário / Avançado]

Crie guia completo:

1. PROBLEMAS MAIS COMUNS

   Para cada problema:
   
   PROBLEMA 1: [Título claro]
   - Descrição do problema
   - Sintomas
   - Causas possíveis
   - Solução passo a passo:
     1. [Passo 1]
     2. [Passo 2]
     3. [Passo 3]
   - Soluções alternativas (se primeira não funcionar)
   - Quando escalar para equipe técnica
   - Links/recursos úteis
   - Screenshots/vídeos (quando aplicável)

   [Continue para todos os problemas]

2. PROCESSO DE DIAGNÓSTICO

   Checklist de diagnóstico:
   - Informações a coletar do cliente
   - Perguntas a fazer
   - Testes a realizar
   - Logs a verificar
   - Ordem de tentativas

3. SOLUÇÕES POR CATEGORIA

   a) Problemas de Acesso/Login
      - Esqueceu senha
      - Conta bloqueada
      - Erro de autenticação
      - [Outros]
   
   b) Problemas de Performance
      - Lento
      - Travamentos
      - Timeout
      - [Outros]
   
   c) Problemas de Integração
      - API não funciona
      - Webhook falhando
      - Sincronização
      - [Outros]
   
   d) Problemas de Pagamento
      - Transação recusada
      - Cobrança duplicada
      - Reembolso
      - [Outros]
   
   e) Problemas de Configuração
      - Setup inicial
      - Configurações perdidas
      - Permissões
      - [Outros]

4. FERRAMENTAS E RECURSOS

   - Ferramentas de diagnóstico
   - Logs e onde encontrar
   - Comandos úteis
   - Links para documentação
   - Vídeos tutoriais
   - Base de conhecimento

5. COMUNICAÇÃO COM CLIENTE

   Template de mensagem:
   - Reconhecimento do problema
   - Solução proposta
   - Passos claros
   - O que fazer se não resolver
   - Tempo estimado
   - Follow-up

6. ESCALAÇÃO TÉCNICA

   Quando escalar:
   - Problema complexo
   - Soluções não funcionaram
   - Requer acesso de desenvolvedor
   - Bug identificado
   - [Outros critérios]

   Como escalar:
   - Informações a incluir
   - Contexto completo
   - Tentativas realizadas
   - Logs/evidências
   - Urgência

7. PREVENÇÃO

   - Como prevenir problemas comuns
   - Boas práticas
   - Configurações recomendadas
   - Manutenção preventiva
   - Educação do cliente

8. ATUALIZAÇÃO DO GUIA

   - Como identificar novos problemas
   - Processo de atualização
   - Feedback da equipe
   - Análise de tickets
   - Frequência de revisão

9. MÉTRICAS

   - Taxa de resolução na primeira interação
   - Tempo médio de resolução
   - Problemas mais frequentes
   - Gaps no guia
   - Satisfação do cliente

10. TREINAMENTO DA EQUIPE

    - Como usar o guia
    - Quando consultar
    - Como contribuir
    - Atualizações regulares
    - Casos práticos

Inclua também:
- Template de troubleshooting
- Checklist de diagnóstico
- Glossário técnico
- Erros comuns na resolução
- Como documentar soluções

', 51, true),
('Processo de Onboarding Técnico de Clientes', 'Atendimento', 'Suporte Técnico', 'PROMPT: Processo de Onboarding Técnico de Clientes

Você é um especialista em onboarding de clientes. Crie um processo completo de onboarding técnico que:
- Facilite início do uso
- Reduza curva de aprendizado
- Prevenha problemas comuns
- Aumente adoção
- Melhore retenção

Contexto:
Produto/Serviço: [Descreva]
Complexidade: [Simples / Média / Complexa]
Tempo médio de setup: [X horas/dias]
Suporte necessário: [Alto / Médio / Baixo]

Crie processo completo:

1. FASES DO ONBOARDING

   Fase 1: Pré-Onboarding (Antes da compra)
   - Expectativas
   - Requisitos
   - Preparação
   - Materiais
   
   Fase 2: Setup Inicial (Primeiros dias)
   - Configuração básica
   - Primeiros passos
   - Suporte ativo
   - Validação
   
   Fase 3: Adoção (Primeira semana)
   - Uso básico
   - Recursos principais
   - Suporte reativo
   - Check-ins
   
   Fase 4: Proficiência (Primeiro mês)
   - Uso avançado
   - Otimizações
   - Melhores práticas
   - Autonomia

2. CHECKLIST DE ONBOARDING

   Checklist completo:
   - [ ] Conta criada
   - [ ] Email de boas-vindas enviado
   - [ ] Configuração inicial
   - [ ] Primeiro acesso
   - [ ] Tutorial básico
   - [ ] Primeira ação realizada
   - [ ] Configurações importantes
   - [ ] Integrações (se aplicável)
   - [ ] Equipe treinada (se B2B)
   - [ ] Primeiro resultado alcançado
   - [ ] Check-in realizado
   - [ ] Onboarding completo

3. MATERIAIS DE ONBOARDING

   a) Email de Boas-vindas
      - Conteúdo
      - Links importantes
      - Próximos passos
      - Suporte disponível
   
   b) Guia de Início Rápido
      - Passos essenciais
      - Screenshots
      - Vídeo (se houver)
   
   c) Tutorial Interativo
      - Tour pelo produto
      - Primeiras ações
      - Dicas
   
   d) Vídeos Tutoriais
      - Setup inicial
      - Funcionalidades principais
      - Casos de uso
   
   e) Base de Conhecimento
      - Artigos relevantes
      - FAQs
      - Troubleshooting

4. AUTOMAÇÕES DE ONBOARDING

   Sequência automática:
   - Email 1 (Dia 0): Boas-vindas
   - Email 2 (Dia 1): Primeiros passos
   - Email 3 (Dia 3): Dicas e truques
   - Email 4 (Dia 7): Como está?
   - Email 5 (Dia 14): Recursos avançados
   
   Para cada email:
   - Assunto
   - Conteúdo
   - CTA
   - Timing

5. SUPORTE DURANTE ONBOARDING

   - Canais disponíveis
   - Horários
   - Tempo de resposta
   - Prioridade
   - Proatividade
   - Check-ins agendados

6. MÉTRICAS DE SUCESSO

   - Taxa de conclusão de onboarding
   - Tempo até primeira ação
   - Tempo até valor percebido
   - Taxa de adoção
   - Taxa de retenção pós-onboarding
   - Satisfação com onboarding
   - Problemas encontrados

7. PERSONALIZAÇÃO

   - Por tipo de cliente
   - Por segmento
   - Por uso pretendido
   - Por nível técnico
   - Caminhos diferentes

8. IDENTIFICAÇÃO DE PROBLEMAS

   Sinais de problema:
   - Não completou setup
   - Não acessa há X dias
   - Múltiplas tentativas sem sucesso
   - Muitas dúvidas
   - Reclamações

   Ações:
   - Contato proativo
   - Suporte adicional
   - Reonboarding
   - Investigação

9. MELHORIAS CONTÍNUAS

   - Coletar feedback
   - Analisar métricas
   - Identificar fricções
   - Testar melhorias
   - Iterar processo

10. CASOS ESPECIAIS

    - Clientes técnicos vs não-técnicos
    - Empresas grandes vs pequenas
    - Primeiro uso vs migração
    - Integrações complexas
    - Personalizações

Inclua também:
- Templates de comunicação
- Scripts de check-in
- Checklist editável
- Ferramentas recomendadas
- Exemplos práticos

', 52, true),
('Criar Scripts de Treinamento para Equipe de Atendimento', 'Atendimento', 'Treinamento', 'PROMPT: Criar Scripts de Treinamento para Equipe de Atendimento

Você é um especialista em treinamento de equipes de atendimento. Crie scripts de treinamento que:
- Padronizem atendimento
- Melhorem qualidade
- Reduzam tempo de treinamento
- Aumentem confiança da equipe
- Melhorem resultados

Contexto:
Tamanho da equipe: [Pequena / Média / Grande]
Experiência média: [Iniciante / Intermediária / Avançada]
Canais: [Telefone / Email / Chat / Presencial]
Produto/Serviço: [Descreva]

Crie scripts completos:

1. ONBOARDING INICIAL

   Módulo 1: Conhecimento do Produto/Serviço
   - O que precisa saber
   - Recursos de aprendizado
   - Testes de conhecimento
   - Timeline
   
   Módulo 2: Processos e Ferramentas
   - Sistemas usados
   - Como usar cada ferramenta
   - Processos internos
   - Documentação
   
   Módulo 3: Comunicação
   - Tom de voz
   - Linguagem a usar
   - O que evitar
   - Exemplos práticos
   
   Módulo 4: Cenários Comuns
   - Situações mais frequentes
   - Como lidar
   - Scripts básicos
   - Prática

2. SCRIPTS POR SITUAÇÃO

   Situação 1: Atendimento Inicial
   - Abertura
   - Coleta de informações
   - Identificação de necessidade
   - Resolução
   - Fechamento
   - Script completo
   
   Situação 2: Reclamação
   - [Mesmo formato]
   
   Situação 3: Dúvida Técnica
   - [Mesmo formato]
   
   Situação 4: Venda/Upsell
   - [Mesmo formato]
   
   [Continue para situações principais]

3. TÉCNICAS DE COMUNICAÇÃO

   a) Escuta Ativa
      - O que é
      - Como fazer
      - Exemplos
      - Exercícios
   
   b) Empatia
      - Como demonstrar
      - Frases poderosas
      - Evitar frases que não ajudam
      - Prática
   
   c) Clareza
      - Linguagem simples
      - Evitar jargões
      - Confirmação de entendimento
      - Exemplos
   
   d) Resolução de Problemas
      - Processo
      - Perguntas certas
      - Soluções criativas
      - Quando escalar

4. SCRIPTS POR CANAL

   a) Telefone
      - Tom de voz
      - Ritmo
      - Pausas
      - Scripts completos
      - Gravações de exemplo
   
   b) Email
      - Estrutura
      - Tom escrito
      - Formatação
      - Templates
      - Exemplos
   
   c) Chat
      - Linguagem
      - Velocidade
      - Emojis (quando usar)
      - Scripts
      - Exemplos
   
   d) Presencial
      - Linguagem corporal
      - Contato visual
      - Espaço pessoal
      - Scripts
      - Exemplos

5. CASOS PRÁTICOS

   Caso 1: [Descrição]
   - Situação
   - Resposta errada (o que evitar)
   - Resposta certa (script)
   - Por que funciona
   - Lições aprendidas
   
   [Continue para 10-15 casos]

6. ROLE PLAY

   Cenários para prática:
   - Cliente irritado
   - Dúvida complexa
   - Solicitação incomum
   - Venda consultiva
   - Escalação
   
   Para cada cenário:
   - Contexto
   - Objetivo
   - Como praticar
   - Feedback

7. REFORÇO CONTÍNUO

   - Sessões semanais/mensais
   - Tópicos de reforço
   - Novos scripts
   - Melhores práticas
   - Casos reais
   - Feedback de qualidade

8. AVALIAÇÃO E FEEDBACK

   - Critérios de avaliação
   - Como dar feedback
   - Métricas de qualidade
   - Melhorias individuais
   - Reconhecimento

9. RECURSOS DE APOIO

   - Base de conhecimento
   - Scripts de referência rápida
   - FAQ interno
   - Vídeos tutoriais
   - Mentoria
   - Comunidade interna

10. ESPECIALIZAÇÕES

    - Treinamento avançado
    - Especialistas por área
    - Certificações internas
    - Carreira na equipe
    - Liderança

Inclua também:
- Plano de treinamento completo
- Materiais de apoio
- Checklist de competências
- Ferramentas de avaliação
- Como manter atualizado

', 53, true),
('Programa de Garantia de Qualidade no Atendimento', 'Atendimento', 'Treinamento', 'PROMPT: Programa de Garantia de Qualidade no Atendimento

Você é um especialista em qualidade de atendimento. Crie um programa completo de garantia de qualidade que:
- Padronize excelência
- Identifique oportunidades de melhoria
- Desenvolva a equipe
- Melhore satisfação do cliente
- Seja mensurável

Contexto:
Tamanho da equipe: [Descreva]
Canais: [Liste]
Volume de atendimentos: [X por dia/semana]
Recursos: [Tempo / Ferramentas / Orçamento]

Crie programa completo:

1. CRITÉRIOS DE QUALIDADE

   Dimensões de avaliação:
   
   a) Comunicação (25%)
      - Clareza
      - Tom de voz
      - Empatia
      - Profissionalismo
      - Gramática/ortografia
   
   b) Resolução (30%)
      - Resolveu problema?
      - Solução correta?
      - Eficiência
      - Follow-up necessário?
   
   c) Processo (20%)
      - Seguiu procedimentos?
      - Documentação correta?
      - Uso de ferramentas
      - Tempo adequado?
   
   d) Experiência do Cliente (25%)
      - Cliente satisfeito?
      - Expectativas atendidas?
      - Relacionamento preservado?
      - NPS/CSAT

2. SISTEMA DE PONTUAÇÃO

   - Escala (1-5 ou 0-100)
   - Peso de cada dimensão
   - Critérios específicos
   - Exemplos de cada nível
   - Pontuação mínima aceitável

3. PROCESSO DE AVALIAÇÃO

   a) Frequência
      - Por atendente (X por mês)
      - Por canal
      - Aleatória vs selecionada
   
   b) Seleção de Amostras
      - Critérios de seleção
      - Representatividade
      - Casos especiais
   
   c) Avaliadores
      - Quem avalia
      - Treinamento de avaliadores
      - Calibração
      - Consistência

4. FERRAMENTAS DE AVALIAÇÃO

   - Formulário de avaliação
   - Checklist
   - Rubrica detalhada
   - Sistema de gestão
   - Dashboard
   - Relatórios

5. FEEDBACK E DESENVOLVIMENTO

   a) Feedback Individual
      - Como dar feedback
      - Frequência
      - Sessões 1-on-1
      - Plano de desenvolvimento
   
   b) Feedback de Equipe
      - Sessões de grupo
      - Melhores práticas compartilhadas
      - Casos de estudo
      - Treinamento adicional
   
   c) Reconhecimento
      - Destaques
      - Recompensas
      - Certificações
      - Progressão

6. MÉTRICAS E RELATÓRIOS

   Métricas principais:
   - Score médio de qualidade
   - Score por atendente
   - Score por canal
   - Tendências
   - Áreas de melhoria
   - Áreas de excelência

   Relatórios:
   - Individual (mensal)
   - Equipe (semanal/mensal)
   - Gerencial (mensal/trimestral)
   - Executivo (trimestral)

7. AÇÕES CORRETIVAS

   - Quando score abaixo do esperado
   - Plano de melhoria
   - Treinamento adicional
   - Acompanhamento
   - Quando considerar outras ações

8. MELHORIAS CONTÍNUAS

   - Análise de tendências
   - Identificação de padrões
   - Atualização de critérios
   - Novos treinamentos
   - Compartilhamento de melhores práticas

9. INTEGRAÇÃO COM OUTRAS MÉTRICAS

   - CSAT/NPS
   - Tempo de resolução
   - Taxa de resolução na primeira interação
   - Produtividade
   - Retenção de clientes

10. CASOS ESPECIAIS

    - Atendimentos complexos
    - Clientes difíceis
    - Situações únicas
    - Contexto considerado
    - Flexibilidade na avaliação

Inclua também:
- Template de avaliação
- Rubrica completa
- Exemplos de avaliações
- Script de feedback
- Ferramentas recomendadas
- Como implementar programa

', 54, true),
('Criar Comunidade de Suporte (Fórum/Comunidade)', 'Atendimento', 'Comunidade', 'PROMPT: Criar Comunidade de Suporte (Fórum/Comunidade)

Você é um especialista em comunidades de suporte. Crie uma estratégia completa para comunidade que:
- Reduza carga de atendimento
- Crie valor para membros
- Construa conhecimento coletivo
- Engaje usuários
- Escale suporte

Contexto:
Produto/Serviço: [Descreva]
Tipo de usuários: [Técnicos / Não-técnicos / Mistos]
Volume de dúvidas: [X por dia/semana]
Recursos: [Tempo / Orçamento / Equipe]

Crie estratégia completa:

1. OBJETIVOS DA COMUNIDADE

   - Reduzir tickets de suporte
   - Criar base de conhecimento
   - Engajar usuários
   - Construir defensores
   - Co-criar soluções
   - Feedback de produto

2. PLATAFORMA E FERRAMENTAS

   Opções:
   - Fórum próprio
   - Discord
   - Slack
   - Facebook Groups
   - Reddit
   - Plataforma dedicada
   
   Comparativo:
   - Prós e contras
   - Custo
   - Facilidade de uso
   - Recursos
   - Recomendação

3. ESTRUTURA DA COMUNIDADE

   a) Categorias/Tópicos
      - Por tipo de dúvida
      - Por produto/feature
      - Por nível (iniciante/avançado)
      - Geral
      - Feedback
      - Off-topic
   
   b) Regras e Diretrizes
      - Código de conduta
      - O que é permitido
      - Moderação
      - Consequências
   
   c) Hierarquia/Modos
      - Administradores
      - Moderadores
      - Membros VIP
      - Novos membros
      - Responsabilidades

4. CONTEÚDO INICIAL

   - FAQs principais
   - Tutoriais básicos
   - Guias
   - Casos de uso
   - Melhores práticas
   - Recursos úteis

5. ENGAJAMENTO E CRESCIMENTO

   a) Onboarding de Novos Membros
      - Boas-vindas
      - Guia de uso
      - Primeiros passos
      - Incentivos
   
   b) Ativação
      - Primeira pergunta
      - Primeira resposta
      - Participação em discussões
      - Gamificação
   
   c) Retenção
      - Conteúdo regular
      - Discussões ativas
      - Eventos
      - Reconhecimento
      - Benefícios exclusivos

6. MODERAÇÃO

   - Quem modera
   - Frequência
   - Diretrizes
   - Ferramentas
   - Escalação
   - Transparência

7. PROGRAMA DE MEMBROS VIP/EMBAIXADORES

   - Critérios de seleção
   - Benefícios
   - Responsabilidades
   - Reconhecimento
   - Como crescer programa

8. INTEGRAÇÃO COM SUPORTE

   - Quando direcionar para comunidade
   - Quando comunidade direciona para suporte
   - Equipe participando
   - Respostas oficiais
   - Atualização de conhecimento

9. MÉTRICAS E KPIs

   - Membros ativos
   - Perguntas/respostas
   - Taxa de resolução
   - Tempo médio de resposta
   - Satisfação
   - Redução de tickets
   - Engajamento
   - Crescimento

10. MANUTENÇÃO E CRESCIMENTO

    - Conteúdo regular
    - Eventos e webinars
    - Desafios
    - Parcerias
    - Marketing da comunidade
    - Melhorias contínuas

Inclua também:
- Plano de lançamento
- Checklist de setup
- Templates de conteúdo
- Exemplos de comunidades
- Ferramentas recomendadas
- Orçamento sugerido

', 55, true),
('Estratégia de Atendimento Multicanal', 'Atendimento', 'Multicanal', 'PROMPT: Estratégia de Atendimento Multicanal

Você é um especialista em atendimento multicanal. Crie uma estratégia completa que:
- Integre todos os canais
- Mantenha consistência
- Otimize experiência do cliente
- Seja eficiente
- Escale bem

Contexto:
Canais atuais: [Email / Chat / Telefone / WhatsApp / Redes sociais / Presencial]
Volume por canal: [Descreva]
Equipe: [Tamanho / Estrutura]
Orçamento: [Disponível para ferramentas]

Crie estratégia completa:

1. MAPEAMENTO DE CANAIS

   Para cada canal:
   - Quando usar
   - Perfil de cliente
   - Tipos de interação
   - Tempo médio
   - Custo
   - Satisfação típica
   - Volume atual
   - Oportunidades

2. INTEGRAÇÃO DE CANAIS

   a) Visão Unificada do Cliente
      - Histórico completo
      - Contexto entre canais
      - Preferências
      - Journey mapping
   
   b) Ferramentas de Integração
      - CRM unificado
      - Plataforma de atendimento
      - Integrações necessárias
      - Custo-benefício
   
   c) Roteamento Inteligente
      - Para qual canal direcionar
      - Para qual agente
      - Baseado em quê
      - Regras de negócio

3. CONSISTÊNCIA ENTRE CANAIS

   - Tom de voz unificado
   - Informações consistentes
   - Processos alinhados
   - Experiência contínua
   - Handoff entre canais

4. ESTRATÉGIA POR CANAL

   a) Email
      - Quando usar
      - SLA (tempo de resposta)
      - Templates
      - Automações
      - Melhores práticas
   
   b) Chat
      - [Mesmo formato]
   
   c) Telefone
      - [Mesmo formato]
   
   d) WhatsApp
      - [Mesmo formato]
   
   e) Redes Sociais
      - [Mesmo formato]
   
   f) Presencial
      - [Mesmo formato]

5. JORNEY DO CLIENTE

   - Touchpoints por estágio
   - Canal preferido por estágio
   - Transições entre canais
   - Experiência contínua
   - Oportunidades de melhoria

6. EQUIPE E CAPACITAÇÃO

   - Habilidades necessárias
   - Treinamento por canal
   - Especialização vs generalização
   - Escalonamento entre canais
   - Suporte entre equipes

7. TECNOLOGIA E FERRAMENTAS

   - Plataforma unificada
   - Ferramentas por canal
   - Integrações
   - Automações
   - Analytics
   - Custo total

8. MÉTRICAS E KPIs

   Por canal:
   - Volume
   - Tempo de resposta
   - Taxa de resolução
   - Satisfação
   - Custo por interação
   
   Geral:
   - Satisfação geral
   - Consistência
   - Eficiência
   - ROI

9. OTIMIZAÇÃO CONTÍNUA

   - Análise de performance
   - Identificação de gaps
   - Testes de novos canais
   - Melhorias
   - Ajustes de estratégia

10. CASOS ESPECIAIS

    - Clientes VIP
    - Problemas complexos
    - Situações urgentes
    - Preferências do cliente
    - Escalação entre canais

Inclua também:
- Roadmap de implementação
- Checklist de integração
- Exemplos de jornadas
- Ferramentas recomendadas
- Orçamento sugerido
- Riscos e mitigações

', 56, true),
('Dashboard de Métricas de Atendimento', 'Atendimento', 'Métricas', 'PROMPT: Dashboard de Métricas de Atendimento

Você é um analista de atendimento ao cliente. Crie um framework completo de métricas e dashboard que:
- Meça o que importa
- Seja fácil de entender
- Gere insights acionáveis
- Acompanhe tendências
- Melhore performance

Contexto:
Tamanho da equipe: [Descreva]
Canais: [Liste]
Volume: [X atendimentos por dia/semana]
Ferramentas: [CRM / Sistema de tickets / etc.]

Crie framework completo:

1. MÉTRICAS ESSENCIAIS

   a) Volume e Produtividade
      - Total de tickets/interações
      - Por canal
      - Por agente
      - Por tipo
      - Tendências
   
   b) Tempo
      - Tempo de primeira resposta
      - Tempo de resolução
      - Tempo médio de atendimento
      - Tempo em fila
      - SLA compliance
   
   c) Qualidade
      - Taxa de resolução na primeira interação
      - Score de qualidade
      - Taxa de reabertura
      - Erros
      - Satisfação (CSAT/NPS)
   
   d) Eficiência
      - Tickets por agente
      - Utilização de capacidade
      - Custo por ticket
      - ROI
   
   e) Satisfação do Cliente
      - CSAT
      - NPS
      - Taxa de elogios
      - Taxa de reclamações
      - Retenção

2. DASHBOARD EXECUTIVO

   Visão de alto nível:
   - KPIs principais
   - Tendências
   - Comparações (mês anterior, ano anterior)
   - Alertas
   - Gráficos visuais
   
   Elementos:
   - Resumo executivo
   - Métricas principais
   - Gráficos de tendência
   - Heatmap de volume
   - Top problemas
   - Ações recomendadas

3. DASHBOARD OPERACIONAL

   Para gestão diária:
   - Tickets em aberto
   - Tempo médio atual
   - Agentes disponíveis
   - Fila de espera
   - Alertas de SLA
   - Distribuição de carga
   
   Atualização: Tempo real ou próximo disso

4. DASHBOARD POR CANAL

   Métricas específicas por canal:
   - Email: Taxa de resposta, tempo médio
   - Chat: Tempo de espera, taxa de resolução
   - Telefone: Tempo de atendimento, taxa de abandono
   - [Outros canais]
   
   Comparativo entre canais

5. DASHBOARD POR AGENTE

   Performance individual:
   - Volume atendido
   - Tempo médio
   - Qualidade
   - Satisfação
   - Tendências
   - Rankings (se aplicável)
   - Áreas de melhoria

6. ANÁLISE DE TENDÊNCIAS

   - Volume ao longo do tempo
   - Sazonalidade
   - Picos e vales
   - Correlações
   - Previsões
   - Anomalias

7. ANÁLISE DE CAUSA RAIZ

   - Problemas mais frequentes
   - Tempo de resolução por tipo
   - Canais mais eficientes
   - Padrões identificados
   - Oportunidades de melhoria

8. RELATÓRIOS REGULARES

   a) Diário
      - Resumo do dia
      - Alertas
      - Ações imediatas
   
   b) Semanal
      - Performance da semana
      - Tendências
      - Comparações
      - Insights
   
   c) Mensal
      - Análise completa
      - Metas vs realizado
      - Recomendações
      - Plano de ação

9. ALERTAS E NOTIFICAÇÕES

   Quando alertar:
   - SLA em risco
   - Volume acima do normal
   - Satisfação caindo
   - Problemas recorrentes
   - Anomalias
   
   Para quem:
   - Agentes
   - Supervisores
   - Gerência
   - Diretoria

10. FERRAMENTAS E IMPLEMENTAÇÃO

    - Ferramentas recomendadas
    - Como configurar
    - Fontes de dados
    - Integrações
    - Automações
    - Custo

Inclua também:
- Template de dashboard
- Exemplos visuais
- Fórmulas de cálculo
- Como interpretar métricas
- Ações baseadas em métricas
- Checklist de implementação

', 57, true),
('Definir SLAs e Políticas de Tempo de Resposta', 'Atendimento', 'SLA', 'PROMPT: Definir SLAs e Políticas de Tempo de Resposta

Você é um especialista em definir SLAs (Service Level Agreements) para atendimento. Crie um framework completo que:
- Defina expectativas claras
- Seja realista e alcançável
- Melhore satisfação
- Otimize recursos
- Seja mensurável

Contexto:
Tipo de negócio: [Descreva]
Canais: [Liste]
Volume: [X por dia]
Equipe: [Tamanho]
Urgências: [Tipos de urgência]

Crie framework completo:

1. TIPOS DE SLAs

   a) Tempo de Primeira Resposta
      - Definição
      - Por canal
      - Por urgência
      - Por tipo de problema
      - Meta (% de tickets dentro do SLA)
   
   b) Tempo de Resolução
      - Definição
      - Por complexidade
      - Por tipo
      - Meta
   
   c) Disponibilidade
      - Horários de atendimento
      - Canais 24/7 vs horário comercial
      - Feriados
      - Meta de disponibilidade
   
   d) Taxa de Resolução na Primeira Interação
      - Meta
      - Por tipo
      - Como medir

2. CLASSIFICAÇÃO DE URGÊNCIA

   Níveis:
   
   Crítico (P1):
   - Definição
   - Exemplos
   - SLA: [Tempo]
   - Escalação automática
   
   Alto (P2):
   - [Mesmo formato]
   
   Médio (P3):
   - [Mesmo formato]
   
   Baixo (P4):
   - [Mesmo formato]

3. SLAs POR CANAL

   a) Email
      - Primeira resposta: [X horas]
      - Resolução: [X horas/dias]
      - Horário: [Descreva]
      - Meta de compliance: [X%]
   
   b) Chat
      - [Mesmo formato]
   
   c) Telefone
      - [Mesmo formato]
   
   d) WhatsApp
      - [Mesmo formato]
   
   e) Redes Sociais
      - [Mesmo formato]

4. SLAs POR TIPO DE PROBLEMA

   - Problemas técnicos críticos
   - Dúvidas gerais
   - Solicitações comerciais
   - Reclamações
   - Solicitações de reembolso
   - [Outros tipos]

5. COMUNICAÇÃO DE SLAs

   a) Para Clientes
      - Onde comunicar
      - Como comunicar
      - Transparência
      - Expectativas claras
   
   b) Para Equipe
      - Treinamento
      - Monitoramento
      - Apoio
      - Ferramentas

6. MONITORAMENTO E ALERTAS

   - Como monitorar
   - Alertas de risco
   - Dashboard em tempo real
   - Relatórios
   - Ações quando em risco

7. GESTÃO DE EXCEÇÕES

   - Quando ajustar SLA
   - Como comunicar atrasos
   - Compensações (se aplicável)
   - Aprendizados
   - Melhorias

8. MÉTRICAS E RELATÓRIOS

   - Taxa de compliance
   - Tempo médio real vs SLA
   - Tendências
   - Por agente
   - Por canal
   - Por tipo
   - Análise de causas

9. MELHORIAS CONTÍNUAS

   - Revisão regular de SLAs
   - Ajustes baseados em dados
   - Feedback de clientes
   - Capacidade da equipe
   - Otimizações

10. CASOS ESPECIAIS

    - Clientes VIP
    - Contratos específicos
    - Situações de crise
    - Alta demanda
    - Feriados/eventos

Inclua também:
- Template de SLA
- Exemplos práticos
- Como calcular capacidade
- Ferramentas de monitoramento
- Checklist de implementação
- Como comunicar mudanças

', 58, true),
('Estratégia de Coleta de Feedback do Cliente', 'Atendimento', 'Feedback', 'PROMPT: Estratégia de Coleta de Feedback do Cliente

Você é um especialista em coletar e usar feedback de clientes. Crie uma estratégia completa que:
- Colete feedback em múltiplos momentos
- Seja fácil para o cliente
- Gere insights acionáveis
- Melhore experiência
- Feche o loop

Contexto:
Canais de coleta: [Email / In-app / Site / Pós-atendimento / etc.]
Frequência: [Após cada interação / Periódica / Eventos específicos]
Recursos: [Ferramentas / Orçamento]

Crie estratégia completa:

1. MOMENTOS DE COLETA

   a) Pós-Atendimento
      - Imediato (após resolução)
      - Curto prazo (24-48h)
      - Quando coletar
      - O que perguntar
   
   b) Pós-Compra
      - Após primeira compra
      - Após uso inicial
      - Após X dias
      - O que perguntar
   
   c) Periódico
      - Mensal/Trimestral
      - Anual
      - NPS regular
      - O que perguntar
   
   d) Eventos Específicos
      - Após cancelamento
      - Após upgrade
      - Após problema resolvido
      - O que perguntar

2. MÉTODOS DE COLETA

   a) Pesquisas
      - Email
      - In-app
      - Site
      - SMS
      - Tipos de perguntas
   
   b) Entrevistas
      - Quando fazer
      - Como recrutar
      - Roteiro
      - Frequência
   
   c) Grupos Focais
      - Quando usar
      - Como organizar
      - Tópicos
   
   d) Feedback Espontâneo
      - Como facilitar
      - Onde coletar
      - Como processar

3. TIPOS DE FEEDBACK

   a) Satisfação (CSAT)
      - Quando usar
      - Perguntas
      - Escala
      - Follow-up
   
   b) NPS (Net Promoter Score)
      - Quando usar
      - Pergunta
      - Segmentação
      - Ações por segmento
   
   c) Esforço (CES)
      - Quando usar
      - Perguntas
      - Insights
   
   d) Feedback Qualitativo
      - Perguntas abertas
      - Quando usar
      - Como analisar

4. DESIGN DE PESQUISAS

   Princípios:
   - Curta e objetiva
   - Linguagem simples
   - Uma ideia por pergunta
   - Ordem lógica
   - Mobile-friendly
   - Fácil de responder

   Template de pesquisa:
   - Introdução
   - Perguntas principais (3-5)
   - Pergunta aberta (1-2)
   - Demografia (opcional)
   - Agradecimento

5. AUMENTAR TAXA DE RESPOSTA

   - Timing ideal
   - Assunto/título atraente
   - Personalização
   - Incentivos (se aplicável)
   - Lembretes
   - Facilidade
   - Valor percebido

6. ANÁLISE DE FEEDBACK

   a) Quantitativo
      - Métricas principais
      - Tendências
      - Segmentação
      - Comparações
      - Benchmarking
   
   b) Qualitativo
      - Análise de texto
      - Temas principais
      - Sentimento
      - Insights
      - Citações poderosas

7. AÇÕES BASEADAS EM FEEDBACK

   a) Feedback Positivo
      - Agradecimento
      - Compartilhamento interno
      - Uso em marketing
      - Reconhecimento
      - Pedido de referência
   
   b) Feedback Negativo
      - Ação imediata
      - Investigação
      - Resolução
      - Follow-up
      - Aprendizado
   
   c) Feedback Neutro
      - Entender melhor
      - Converter em positivo
      - Melhorias

8. FECHAR O LOOP

   - Como comunicar ações tomadas
   - Transparência
   - Agradecimento
   - Atualizações
   - Reconhecimento de contribuição

9. FERRAMENTAS E TECNOLOGIA

   - Ferramentas de pesquisa
   - Plataformas de feedback
   - Análise de texto
   - Integrações
   - Automações
   - Dashboards

10. CULTURA DE FEEDBACK

    - Feedback como prioridade
    - Todos ouvem feedback
    - Ações baseadas em dados
    - Melhorias contínuas
    - Comunicação com clientes

Inclua também:
- Templates de pesquisas
- Exemplos práticos
- Checklist de coleta
- Como priorizar ações
- ROI de feedback
- Erros comuns

', 59, true),
('Processo de Melhorias Contínuas no Atendimento', 'Atendimento', 'Melhorias Contínuas', 'PROMPT: Processo de Melhorias Contínuas no Atendimento

Você é um especialista em melhorias contínuas. Crie um processo sistemático que:
- Identifique oportunidades de melhoria
- Priorize ações
- Implemente mudanças
- Meça resultados
- Itere continuamente

Contexto:
Equipe: [Tamanho]
Canais: [Liste]
Métricas atuais: [Se souber]
Recursos: [Tempo / Orçamento]

Crie processo completo:

1. FONTES DE INSIGHTS
   - Feedback de clientes
   - Métricas e KPIs
   - Análise de tickets
   - Feedback da equipe
   - Benchmarking
   - Tendências do setor

2. IDENTIFICAÇÃO DE OPORTUNIDADES
   - Problemas recorrentes
   - Gaps de processo
   - Ineficiências
   - Insatisfação
   - Tempos altos
   - Erros frequentes

3. PRIORIZAÇÃO
   - Impacto vs Esforço
   - Urgência
   - Recursos disponíveis
   - Alinhamento estratégico
   - ROI esperado

4. PLANO DE AÇÃO
   - Objetivo claro
   - Métricas de sucesso
   - Responsáveis
   - Timeline
   - Recursos necessários
   - Riscos e mitigações

5. IMPLEMENTAÇÃO
   - Passo a passo
   - Comunicação
   - Treinamento
   - Testes
   - Rollout
   - Suporte

6. MEDIÇÃO E ANÁLISE
   - Métricas antes/depois
   - Feedback
   - Ajustes
   - Lições aprendidas

7. CULTURA DE MELHORIA
   - Encorajar sugestões
   - Celebrar melhorias
   - Compartilhar aprendizados
   - Iteração contínua

Inclua também:
- Template de melhoria
- Checklist
- Ferramentas
- Frequência de revisão
- Exemplos práticos

', 60, true);