-- ============================================================================
-- INSERÇÃO DE PROMPTS - OPERACIONAL
-- ============================================================================
-- Total: 20 prompts
-- Execute este script no Supabase SQL Editor
-- ============================================================================

INSERT INTO public.prompts (titulo, categoria, subcategoria, conteudo, ordem, ativo) VALUES

('Criar Relatórios Executivos com Análise de Dados', 'Operacional', 'Análise de Dados', 'PROMPT: Criar Relatórios Executivos com Análise de Dados

Você é um analista de dados especializado em criar relatórios executivos. Crie um framework para relatórios que:
- Sejam claros e acionáveis
- Contem uma história com dados
- Foquem em insights, não apenas números
- Sejam visuais e fáceis de entender
- Influenciem decisões

Contexto:
Audiência: [C-level / Gerência / Investidores]
Frequência: [Semanal / Mensal / Trimestral]
Área: [Vendas / Marketing / Operações / Financeiro / Geral]
Dados disponíveis: [Descreva fontes]

Crie framework completo:

1. ESTRUTURA DO RELATÓRIO
   - Resumo executivo (1 página)
   - KPIs principais
   - Análise detalhada
   - Insights e recomendações
   - Anexos (se necessário)

2. ELEMENTOS ESSENCIAIS
   - Contexto e período
   - Comparações (mês anterior, ano anterior, meta)
   - Tendências
   - Alertas e exceções
   - Próximos passos

3. VISUALIZAÇÕES
   - Gráficos mais efetivos por tipo de dado
   - Dashboards visuais
   - Cores e formatação
   - Mobile-friendly

4. INSIGHTS E RECOMENDAÇÕES
   - O que os dados mostram
   - Por que importa
   - O que fazer
   - Impacto esperado

5. TEMPLATE COMPLETO
   - Estrutura detalhada
   - Exemplos de cada seção
   - Checklist

Inclua também:
- Ferramentas recomendadas
- Erros comuns
- Como apresentar
- Frequência ideal

', 61, true),
('Criar Dashboards de Dados Eficazes', 'Operacional', 'Análise de Dados', 'PROMPT: Criar Dashboards de Dados Eficazes

Você é um especialista em dashboards. Crie um guia para dashboards que:
- Mostrem métricas importantes
- Sejam fáceis de entender
- Atualizem em tempo real (quando possível)
- Sejam acionáveis
- Se adaptem ao usuário

Contexto:
Tipo: [Operacional / Estratégico / Analítico]
Usuários: [Equipe / Gerência / Executivos]
Frequência de atualização: [Tempo real / Diário / Semanal]
Ferramentas: [Power BI / Tableau / Google Data Studio / Excel / etc.]

Crie guia completo:

1. TIPOS DE DASHBOARDS
   - Operacional (monitoramento diário)
   - Estratégico (visão de alto nível)
   - Analítico (análise profunda)
   - Tático (ações específicas)

2. PRINCÍPIOS DE DESIGN
   - Hierarquia visual
   - Cores e contraste
   - Espaçamento
   - Tipografia
   - Mobile-first

3. MÉTRICAS ESSENCIAIS
   - KPIs principais
   - Métricas secundárias
   - Contexto e comparações
   - Alertas

4. LAYOUT E ESTRUTURA
   - Organização lógica
   - Zonas de informação
   - Navegação
   - Filtros e interatividade

5. IMPLEMENTAÇÃO
   - Ferramentas por necessidade
   - Fontes de dados
   - Integrações
   - Automação

Inclua também:
- Exemplos visuais
- Checklist
- Melhores práticas
- Erros comuns

', 62, true),
('Automatizar Criação de Relatórios', 'Operacional', 'Relatórios', 'PROMPT: Automatizar Criação de Relatórios

Você é um especialista em automação. Crie estratégia para automatizar relatórios que:
- Economize tempo
- Reduza erros
- Seja confiável
- Permita customização
- Escale bem

Contexto:
Tipo de relatórios: [Descreva]
Frequência: [Diário / Semanal / Mensal]
Ferramentas atuais: [Liste]
Dados: [Fontes e formatos]

Crie estratégia:

1. IDENTIFICAR RELATÓRIOS PARA AUTOMATIZAR
   - Repetitivos
   - Alta frequência
   - Tempo consumido
   - Valor agregado

2. FLUXO DE AUTOMAÇÃO
   - Coleta de dados
   - Processamento
   - Cálculos
   - Formatação
   - Distribuição

3. FERRAMENTAS
   - Por tipo de automação
   - Integrações necessárias
   - Custo-benefício

4. IMPLEMENTAÇÃO
   - Passo a passo
   - Testes
   - Rollout
   - Manutenção

5. MONITORAMENTO
   - Alertas de falha
   - Validação de dados
   - Ajustes

Inclua também:
- Exemplos práticos
- Checklist
- ROI esperado
- Riscos e mitigações

', 63, true),
('Documentar Processos Internos', 'Operacional', 'Documentação', 'PROMPT: Documentar Processos Internos

Você é um especialista em documentação. Crie guia para documentar processos que:
- Sejam claros e completos
- Facilitem treinamento
- Reduzam dependência de pessoas
- Melhorem consistência
- Sejam fáceis de atualizar

Contexto:
Tipo de processos: [Operacionais / Administrativos / Comerciais / Técnicos]
Audiência: [Novos funcionários / Equipe / Gestão]
Formato: [Escrito / Vídeo / Interativo]

Crie guia:

1. ESTRUTURA DE DOCUMENTAÇÃO
   - Título e objetivo
   - Responsável
   - Pré-requisitos
   - Passo a passo
   - Resultado esperado
   - Troubleshooting

2. TIPOS DE PROCESSOS
   - Operacionais diários
   - Administrativos
   - Onboarding
   - Emergenciais
   - Especiais

3. FORMATO E ESTILO
   - Linguagem clara
   - Screenshots/vídeos
   - Exemplos
   - Checklist
   - Diagramas

4. MANUTENÇÃO
   - Frequência de atualização
   - Responsável
   - Versionamento
   - Feedback

5. DISTRIBUIÇÃO
   - Onde armazenar
   - Como acessar
   - Treinamento
   - Promoção

Inclua também:
- Template
- Exemplos
- Checklist
- Ferramentas

', 64, true),
('Otimizar Processos Operacionais', 'Operacional', 'Processos', 'PROMPT: Otimizar Processos Operacionais

Você é um especialista em otimização de processos. Crie metodologia que:
- Identifique ineficiências
- Proponha melhorias
- Meça resultados
- Implemente mudanças
- Sustente melhorias

Contexto:
Tipo de processos: [Descreva]
Problemas atuais: [Se souber]
Recursos: [Tempo / Pessoas / Orçamento]

Crie metodologia:

1. MAPEAMENTO ATUAL
   - Documentar processo atual
   - Identificar participantes
   - Medir tempos
   - Identificar gargalos

2. ANÁLISE
   - O que funciona
   - O que não funciona
   - Tempos e custos
   - Oportunidades

3. REDESENHO
   - Processo ideal
   - Eliminar desperdícios
   - Automatizar quando possível
   - Simplificar

4. IMPLEMENTAÇÃO
   - Plano de ação
   - Comunicação
   - Treinamento
   - Testes
   - Rollout

5. MEDIÇÃO
   - Antes vs depois
   - KPIs
   - Ajustes
   - Sustentação

Inclua também:
- Ferramentas (5S, Lean, etc.)
- Exemplos
- Checklist
- ROI

', 65, true),
('Padronizar Processos Operacionais', 'Operacional', 'Processos', 'PROMPT: Padronizar Processos Operacionais

Você é um especialista em padronização. Crie estratégia para padronizar processos que:
- Garantam consistência
- Melhorem qualidade
- Facilitem treinamento
- Reduzam erros
- Escalem operações

Contexto:
Processos a padronizar: [Liste]
Variações atuais: [Descreva]
Equipe: [Tamanho / Localização]

Crie estratégia:

1. IDENTIFICAÇÃO
   - Processos críticos
   - Variações atuais
   - Impacto da padronização
   - Priorização

2. DESENHO DO PADRÃO
   - Melhor prática atual
   - Processo ideal
   - Especificações
   - Exceções permitidas

3. DOCUMENTAÇÃO
   - Procedimento padrão
   - Checklist
   - Treinamento
   - Referência rápida

4. IMPLEMENTAÇÃO
   - Comunicação
   - Treinamento
   - Acompanhamento
   - Ajustes

5. SUSTENTAÇÃO
   - Monitoramento
   - Auditoria
   - Melhorias contínuas
   - Cultura

Inclua também:
- Template de processo padrão
- Exemplos
- Checklist
- Métricas

', 66, true),
('Sistema de Controle de Estoque', 'Operacional', 'Gestão de Estoque', 'PROMPT: Sistema de Controle de Estoque

Você é um especialista em gestão de estoque. Crie sistema de controle que:
- Evite rupturas
- Minimize excesso
- Otimize capital
- Seja preciso
- Seja eficiente

Contexto:
Tipo de negócio: [E-commerce / Varejo / Distribuição / etc.]
Produtos: [Quantidade / Tipos / Sazonalidade]
Sistema atual: [Manual / Parcial / Automatizado]

Crie sistema:

1. CLASSIFICAÇÃO DE PRODUTOS
   - ABC Analysis
   - Critérios
   - Estratégias por categoria

2. CONTROLE DE ESTOQUE
   - Registro de entradas/saídas
   - Contagem física
   - Ajustes
   - Rastreamento

3. INDICADORES
   - Giro de estoque
   - Cobertura
   - Rupturas
   - Excesso
   - Precisão

4. PONTOS DE REPOSIÇÃO
   - Cálculo
   - Lead time
   - Estoque de segurança
   - Lote econômico

5. AUTOMAÇÃO
   - Sistemas recomendados
   - Integrações
   - Alertas
   - Relatórios

Inclua também:
- Fórmulas importantes
- Exemplos
- Checklist
- Ferramentas

', 67, true),
('Gestão Estratégica de Fornecedores', 'Operacional', 'Gestão de Fornecedores', 'PROMPT: Gestão Estratégica de Fornecedores

Você é um especialista em gestão de fornecedores. Crie estratégia que:
- Selecione fornecedores adequados
- Negocie melhores condições
- Monitore performance
- Gerencie relacionamentos
- Reduza riscos

Contexto:
Tipo de fornecedores: [Matéria-prima / Serviços / Tecnologia / etc.]
Volume: [Quantidade de fornecedores]
Criticidade: [Alta / Média / Baixa]

Crie estratégia:

1. SELEÇÃO
   - Critérios de avaliação
   - Processo de seleção
   - Due diligence
   - Contratos

2. NEGOCIAÇÃO
   - Preparação
   - Objetivos
   - Estratégias
   - Contratos

3. GESTÃO DE RELACIONAMENTO
   - Comunicação
   - Reuniões regulares
   - Parcerias
   - Desenvolvimento

4. MONITORAMENTO
   - KPIs de performance
   - Qualidade
   - Prazos
   - Custos
   - Relatórios

5. GESTÃO DE RISCOS
   - Identificação
   - Mitigação
   - Planos de contingência
   - Diversificação

Inclua também:
- Template de avaliação
- Checklist
- KPIs
- Exemplos

', 68, true),
('Otimizar Logística e Entregas', 'Operacional', 'Logística', 'PROMPT: Otimizar Logística e Entregas

Você é um especialista em logística. Crie estratégia de otimização que:
- Reduza custos
- Melhore prazos
- Aumente satisfação
- Seja escalável
- Seja confiável

Contexto:
Tipo: [E-commerce / Distribuição / Serviços]
Volume: [X entregas por mês]
Cobertura: [Local / Regional / Nacional]
Transportadoras: [Própria / Terceirizada / Mista]

Crie estratégia:

1. ANÁLISE ATUAL
   - Custos
   - Prazos
   - Problemas
   - Oportunidades

2. OTIMIZAÇÕES
   - Rotas
   - Consolidação
   - Parceiros
   - Tecnologia
   - Processos

3. INDICADORES
   - Custo por entrega
   - Prazo médio
   - Taxa de sucesso
   - Satisfação
   - ROI

4. TECNOLOGIA
   - Rastreamento
   - Otimização de rotas
   - Integrações
   - Automação

5. PARCEIROS
   - Seleção
   - Negociação
   - Gestão
   - Performance

Inclua também:
- Ferramentas
- Exemplos
- Checklist
- Métricas

', 69, true),
('Sistema de Controle de Qualidade', 'Operacional', 'Qualidade', 'PROMPT: Sistema de Controle de Qualidade

Você é um especialista em qualidade. Crie sistema de controle que:
- Garanta padrões
- Identifique problemas cedo
- Prevenha defeitos
- Melhore continuamente
- Satisfaça clientes

Contexto:
Tipo: [Produto / Serviço / Processo]
Padrões: [Internos / ISO / Setor]
Volume: [Alto / Médio / Baixo]

Crie sistema:

1. PADRÕES DE QUALIDADE
   - Definição
   - Especificações
   - Tolerâncias
   - Documentação

2. CONTROLES
   - Pontos de verificação
   - Frequência
   - Métodos
   - Responsáveis

3. INSPEÇÃO E TESTES
   - Quando inspecionar
   - O que testar
   - Métodos
   - Amostragem

4. AÇÕES CORRETIVAS
   - Identificação de problemas
   - Análise de causa
   - Correção
   - Prevenção

5. MELHORIAS CONTÍNUAS
   - Métricas
   - Análise
   - Ajustes
   - Cultura

Inclua também:
- Checklist
- Templates
- Ferramentas
- Exemplos

', 70, true),
('Aumentar Produtividade da Equipe', 'Operacional', 'Produtividade', 'PROMPT: Aumentar Produtividade da Equipe

Você é um especialista em produtividade. Crie estratégia que:
- Identifique oportunidades
- Elimine desperdícios
- Otimize processos
- Engaje equipe
- Meça resultados

Contexto:
Tipo de equipe: [Operacional / Administrativa / Comercial / Técnica]
Tamanho: [X pessoas]
Desafios atuais: [Se souber]

Crie estratégia:

1. DIAGNÓSTICO
   - Análise de tempo
   - Gargalos
   - Desperdícios
   - Oportunidades

2. OTIMIZAÇÕES
   - Processos
   - Ferramentas
   - Automações
   - Treinamento

3. GESTÃO DE TEMPO
   - Priorização
   - Delegação
   - Foco
   - Reuniões eficientes

4. FERRAMENTAS
   - Tecnologia
   - Métodos
   - Templates
   - Automações

5. ENGAJAMENTO
   - Motivação
   - Reconhecimento
   - Metas claras
   - Feedback

6. MÉTRICAS
   - KPIs
   - Antes/depois
   - Acompanhamento
   - Ajustes

Inclua também:
- Ferramentas recomendadas
- Exemplos
- Checklist
- ROI

', 71, true),
('Estratégia de Redução de Custos Operacionais', 'Operacional', 'Custos', 'PROMPT: Estratégia de Redução de Custos Operacionais

Você é um especialista em redução de custos. Crie estratégia que:
- Identifique oportunidades
- Priorize ações
- Mantenha qualidade
- Seja sustentável
- Meça impacto

Contexto:
Tipo de custos: [Fixos / Variáveis / Ambos]
Áreas: [Operações / Administração / Tecnologia / etc.]
Meta: [X% de redução / R$ X]

Crie estratégia:

1. ANÁLISE DE CUSTOS
   - Mapeamento completo
   - Categorização
   - Tendências
   - Comparações

2. IDENTIFICAÇÃO DE OPORTUNIDADES
   - Desperdícios
   - Ineficiências
   - Negociações
   - Alternativas
   - Automações

3. PRIORIZAÇÃO
   - Impacto vs Esforço
   - Riscos
   - Timeline
   - ROI

4. AÇÕES ESPECÍFICAS
   - Por categoria de custo
   - Estratégias
   - Implementação
   - Timeline

5. MONITORAMENTO
   - Métricas
   - Acompanhamento
   - Ajustes
   - Sustentação

Inclua também:
- Template de análise
- Exemplos
- Checklist
- Ferramentas

', 72, true),
('Automatizar Tarefas Repetitivas', 'Operacional', 'Automação', 'PROMPT: Automatizar Tarefas Repetitivas

Você é um especialista em automação. Crie estratégia que:
- Identifique tarefas automatizáveis
- Priorize por impacto
- Implemente soluções
- Meça resultados
- Escale automações

Contexto:
Tipo de tarefas: [Administrativas / Operacionais / Comerciais / Técnicas]
Ferramentas disponíveis: [Liste]
Orçamento: [Baixo / Médio / Alto]

Crie estratégia:

1. IDENTIFICAÇÃO
   - Tarefas repetitivas
   - Frequência
   - Tempo consumido
   - Complexidade
   - Priorização

2. SOLUÇÕES
   - Automação simples
   - Ferramentas no-code
   - Integrações
   - Scripts
   - RPA (se aplicável)

3. IMPLEMENTAÇÃO
   - Passo a passo
   - Testes
   - Rollout
   - Treinamento

4. FERRAMENTAS
   - Por tipo de automação
   - Custo-benefício
   - Recomendações

5. ROI
   - Tempo economizado
   - Redução de erros
   - Custo vs benefício
   - Escalabilidade

Inclua também:
- Exemplos práticos
- Checklist
- Ferramentas recomendadas
- Riscos

', 73, true),
('Metodologia de Gestão de Projetos', 'Operacional', 'Gestão de Projetos', 'PROMPT: Metodologia de Gestão de Projetos

Você é um especialista em gestão de projetos. Crie metodologia que:
- Seja adaptável ao tamanho do projeto
- Defina papéis e responsabilidades
- Tenha processos claros
- Meça progresso
- Entregue resultados

Contexto:
Tipo de projetos: [Técnicos / Comerciais / Operacionais / Estratégicos]
Tamanho: [Pequenos / Médios / Grandes]
Equipe: [Tamanho / Experiência]

Crie metodologia:

1. INICIAÇÃO
   - Definição do projeto
   - Objetivos e escopo
   - Stakeholders
   - Recursos

2. PLANEJAMENTO
   - Estrutura (WBS)
   - Cronograma
   - Recursos
   - Riscos
   - Orçamento

3. EXECUÇÃO
   - Gestão de equipe
   - Comunicação
   - Qualidade
   - Mudanças

4. MONITORAMENTO
   - Progresso
   - KPIs
   - Relatórios
   - Ajustes

5. ENCERRAMENTO
   - Entrega
   - Lições aprendidas
   - Documentação
   - Celebração

Inclua também:
- Templates
- Ferramentas
- Exemplos
- Checklist

', 74, true),
('Estratégia de Comunicação Interna Eficiente', 'Operacional', 'Comunicação', 'PROMPT: Estratégia de Comunicação Interna Eficiente

Você é um especialista em comunicação interna. Crie estratégia que:
- Melhore fluxo de informação
- Reduza ruídos
- Aumente engajamento
- Seja eficiente
- Alinhe equipe

Contexto:
Tamanho da equipe: [X pessoas]
Estrutura: [Presencial / Remota / Híbrida]
Canais atuais: [Liste]
Desafios: [Se souber]

Crie estratégia:

1. CANAIS E FERRAMENTAS
   - Por tipo de comunicação
   - Quando usar cada um
   - Ferramentas recomendadas
   - Integrações

2. FLUXOS DE COMUNICAÇÃO
   - Hierárquica
   - Horizontal
   - Formal vs informal
   - Urgente vs rotina

3. CONTEÚDO E FORMATO
   - Tipos de mensagens
   - Formato ideal
   - Frequência
   - Timing

4. REUNIÕES EFICIENTES
   - Quando fazer
   - Estrutura
   - Participantes
   - Follow-up

5. CULTURA DE COMUNICAÇÃO
   - Transparência
   - Feedback
   - Abertura
   - Responsividade

Inclua também:
- Templates
- Checklist
- Ferramentas
- Exemplos

', 75, true),
('Gerenciar Mudanças Organizacionais', 'Operacional', 'Gestão de Mudanças', 'PROMPT: Gerenciar Mudanças Organizacionais

Você é um especialista em gestão de mudanças. Crie processo que:
- Prepare organização
- Comunique efetivamente
- Engaje stakeholders
- Minimize resistência
- Garanta sucesso

Contexto:
Tipo de mudança: [Processo / Estrutura / Tecnologia / Cultura]
Escopo: [Equipe / Departamento / Organização]
Urgência: [Alta / Média / Baixa]

Crie processo:

1. PREPARAÇÃO
   - Análise de impacto
   - Stakeholders
   - Riscos
   - Plano de comunicação

2. COMUNICAÇÃO
   - Mensagem clara
   - Canais
   - Frequência
   - Feedback

3. ENGAJAMENTO
   - Envolvimento
   - Treinamento
   - Suporte
   - Reconhecimento

4. IMPLEMENTAÇÃO
   - Rollout
   - Acompanhamento
   - Ajustes
   - Suporte

5. SUSTENTAÇÃO
   - Reforço
   - Métricas
   - Melhorias
   - Cultura

Inclua também:
- Template de plano
- Checklist
- Ferramentas
- Exemplos

', 76, true),
('Gestão de Riscos Operacionais', 'Operacional', 'Gestão de Riscos', 'PROMPT: Gestão de Riscos Operacionais

Você é um especialista em gestão de riscos. Crie framework que:
- Identifique riscos
- Avalie impacto e probabilidade
- Priorize ações
- Mitigue riscos
- Monitore continuamente

Contexto:
Tipo de negócio: [Descreva]
Áreas: [Operações / Financeiro / Tecnologia / Compliance / etc.]
Histórico: [Riscos anteriores se souber]

Crie framework:

1. IDENTIFICAÇÃO
   - Tipos de riscos
   - Fontes
   - Processo de identificação
   - Participantes

2. AVALIAÇÃO
   - Impacto
   - Probabilidade
   - Matriz de risco
   - Priorização

3. MITIGAÇÃO
   - Estratégias
   - Planos de ação
   - Responsáveis
   - Timeline

4. CONTINGÊNCIA
   - Planos de resposta
   - Recursos
   - Comunicação
   - Testes

5. MONITORAMENTO
   - Indicadores
   - Revisões
   - Atualizações
   - Relatórios

Inclua também:
- Template de análise
- Matriz de risco
- Checklist
- Exemplos

', 77, true),
('Garantir Compliance e Conformidade com Normas', 'Operacional', 'Compliance', 'PROMPT: Garantir Compliance e Conformidade com Normas

Você é um especialista em compliance. Crie sistema que:
- Identifique requisitos
- Documente processos
- Monitore conformidade
- Corrija não-conformidades
- Mantenha certificações

Contexto:
Setor: [Descreva]
Normas aplicáveis: [ISO / Setor específico / Regulamentações]
Status atual: [Certificado / Em processo / Não certificado]

Crie sistema:

1. IDENTIFICAÇÃO DE REQUISITOS
   - Normas aplicáveis
   - Requisitos específicos
   - Obrigações legais
   - Prazos

2. DOCUMENTAÇÃO
   - Políticas
   - Procedimentos
   - Registros
   - Controles

3. IMPLEMENTAÇÃO
   - Plano de ação
   - Treinamento
   - Processos
   - Ferramentas

4. MONITORAMENTO
   - Auditorias internas
   - Verificações
   - Métricas
   - Relatórios

5. MELHORIAS CONTÍNUAS
   - Não-conformidades
   - Ações corretivas
   - Prevenção
   - Revisões

Inclua também:
- Checklist
- Templates
- Ferramentas
- Exemplos

', 78, true),
('Planos de Backup e Contingência', 'Operacional', 'Backup e Contingência', 'PROMPT: Planos de Backup e Contingência

Você é um especialista em continuidade de negócios. Crie planos que:
- Protejam dados críticos
- Garantam operação
- Minimizem impacto
- Sejam testados
- Sejam atualizados

Contexto:
Tipo de negócio: [Descreva]
Dados críticos: [Liste]
Sistemas: [Liste]
Riscos: [Desastres / Falhas técnicas / Humanos / etc.]

Crie planos:

1. BACKUP DE DADOS
   - O que backup
   - Frequência
   - Métodos
   - Armazenamento
   - Testes de restauração

2. CONTINGÊNCIA OPERACIONAL
   - Cenários de risco
   - Planos de resposta
   - Recursos alternativos
   - Comunicação
   - Timeline de recuperação

3. TESTES E MANUTENÇÃO
   - Frequência de testes
   - Cenários
   - Ajustes
   - Atualizações

4. COMUNICAÇÃO DE CRISE
   - Stakeholders
   - Mensagens
   - Canais
   - Frequência

5. RECUPERAÇÃO
   - Processo
   - Prioridades
   - Recursos
   - Validação

Inclua também:
- Checklist
- Templates
- Exemplos
- Ferramentas

', 79, true),
('Definir KPIs e Métricas Operacionais', 'Operacional', 'Métricas', 'PROMPT: Definir KPIs e Métricas Operacionais

Você é um especialista em métricas. Crie framework de KPIs que:
- Meçam o que importa
- Sejam acionáveis
- Tenham metas claras
- Sejam monitorados regularmente
- Impulsionem melhorias

Contexto:
Área: [Operações / Produção / Logística / Qualidade / Geral]
Objetivos: [Eficiência / Qualidade / Custo / Tempo / etc.]

Crie framework:

1. KPIs ESSENCIAIS POR ÁREA
   - Operações
   - Qualidade
   - Produtividade
   - Custos
   - Tempo
   - Satisfação

2. DEFINIÇÃO DE KPIs
   - Fórmula
   - Fonte de dados
   - Frequência
   - Responsável
   - Meta

3. DASHBOARD
   - Visualização
   - Atualização
   - Alertas
   - Comparações

4. GESTÃO
   - Revisões regulares
   - Ações baseadas em dados
   - Ajustes de metas
   - Comunicação

5. MELHORIAS
   - Análise de tendências
   - Identificação de oportunidades
   - Ações corretivas
   - Celebração de sucessos

Inclua também:
- Lista de KPIs recomendados
- Fórmulas
- Templates
- Exemplos
- Ferramentas

', 80, true);