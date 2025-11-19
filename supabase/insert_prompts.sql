-- ============================================================================
-- INSERÇÃO DE PROMPTS - COMUNIDADE IA
-- ============================================================================
-- Total de prompts: 100
-- Execute este script no Supabase SQL Editor
-- ============================================================================

-- Limpar prompts existentes (opcional - descomente se necessário)
-- DELETE FROM public.prompts;

-- Inserir prompts

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

', 80, true),
('Análise SWOT Estratégica Completa', 'Estrategico', 'Planejamento Estratégico', 'PROMPT: Análise SWOT Estratégica Completa

Você é um estrategista de negócios. Crie uma análise SWOT completa que:
- Seja honesta e realista
- Identifique oportunidades claras
- Revele ameaças reais
- Seja acionável
- Guie decisões estratégicas

Contexto:
Empresa: [Descreva]
Setor: [Descreva]
Mercado: [Local / Regional / Nacional / Internacional]
Momento: [Startup / Crescimento / Maturidade / Transformação]

Crie análise completa:

1. FORÇAS (Strengths)
   - Recursos únicos
   - Competências core
   - Vantagens competitivas
   - Ativos valiosos
   - Posicionamento

2. FRAQUEZAS (Weaknesses)
   - Limitações atuais
   - Recursos faltantes
   - Desvantagens
   - Áreas de melhoria
   - Dependências

3. OPORTUNIDADES (Opportunities)
   - Tendências de mercado
   - Mudanças tecnológicas
   - Gaps no mercado
   - Parcerias possíveis
   - Expansão

4. AMEAÇAS (Threats)
   - Concorrência
   - Mudanças regulatórias
   - Mudanças de mercado
   - Riscos externos
   - Dependências

5. MATRIZ SWOT
   - Visualização
   - Priorização
   - Conexões

6. ESTRATÉGIAS RESULTANTES
   - SO (Forças + Oportunidades)
   - WO (Fraquezas + Oportunidades)
   - ST (Forças + Ameaças)
   - WT (Fraquezas + Ameaças)

7. PLANO DE AÇÃO
   - Prioridades
   - Responsáveis
   - Timeline
   - Recursos

Inclua também:
- Template de análise
- Perguntas guia
- Exemplos
- Checklist

', 81, true),
('Definir Objetivos Estratégicos SMART', 'Estrategico', 'Planejamento Estratégico', 'PROMPT: Definir Objetivos Estratégicos SMART

Você é um especialista em planejamento estratégico. Crie framework para objetivos SMART que:
- Sejam claros e mensuráveis
- Estejam alinhados com visão
- Sejam alcançáveis
- Tenham prazos definidos
- Impulsionem ação

Contexto:
Visão da empresa: [Descreva]
Horizonte: [Anual / 3 anos / 5 anos]
Áreas: [Vendas / Marketing / Operações / Pessoas / Financeiro / etc.]

Crie framework:

1. OBJETIVOS POR ÁREA
   - Estratégicos (alto nível)
   - Táticos (médio prazo)
   - Operacionais (curto prazo)

2. CRITÉRIOS SMART
   - Specific (Específico)
   - Measurable (Mensurável)
   - Achievable (Alcançável)
   - Relevant (Relevante)
   - Time-bound (Temporal)

3. ALINHAMENTO
   - Visão → Missão → Objetivos → Metas
   - Cascata organizacional
   - Consistência

4. METAS E KPIs
   - Metas intermediárias
   - Indicadores de progresso
   - Métricas de sucesso

5. PLANO DE EXECUÇÃO
   - Iniciativas
   - Projetos
   - Responsáveis
   - Recursos
   - Timeline

Inclua também:
- Template de objetivo SMART
- Exemplos
- Checklist
- Ferramentas

', 82, true),
('Criar Plano de Negócios Estratégico', 'Estrategico', 'Planejamento Estratégico', 'PROMPT: Criar Plano de Negócios Estratégico

Você é um consultor estratégico. Crie estrutura de plano de negócios que:
- Seja completo e profissional
- Convence stakeholders
- Guie execução
- Seja atualizável
- Alinhe equipe

Contexto:
Tipo: [Novo negócio / Expansão / Pivô / Investimento]
Audiência: [Investidores / Equipe / Parceiros / Interno]
Horizonte: [1 ano / 3 anos / 5 anos]

Crie estrutura:

1. RESUMO EXECUTIVO
   - Visão geral
   - Oportunidade
   - Solução
   - Mercado
   - Diferenciação
   - Tração
   - Equipe
   - Finanças

2. ANÁLISE DE MERCADO
   - Tamanho do mercado
   - Tendências
   - Segmentação
   - Concorrência
   - Oportunidades

3. PRODUTO/SERVIÇO
   - Descrição
   - Diferenciação
   - Roadmap
   - IP/Proteção

4. ESTRATÉGIA DE MARKETING E VENDAS
   - Posicionamento
   - Canais
   - Preço
   - Go-to-market

5. OPERAÇÕES
   - Modelo operacional
   - Recursos necessários
   - Fornecedores
   - Processos

6. EQUIPE
   - Estrutura
   - Necessidades
   - Cultura
   - Recrutamento

7. FINANÇAS
   - Modelo de receita
   - Projeções
   - Custos
   - Necessidade de capital
   - ROI

8. RISCOS E MITIGAÇÕES
   - Principais riscos
   - Estratégias
   - Contingências

Inclua também:
- Template completo
- Exemplos
- Checklist
- Ferramentas

', 83, true),
('Pesquisa e Análise de Mercado Estratégica', 'Estrategico', 'Análise de Mercado', 'PROMPT: Pesquisa e Análise de Mercado Estratégica

Você é um especialista em pesquisa de mercado. Crie metodologia que:
- Identifique oportunidades
- Entenda clientes
- Analise concorrência
- Revele tendências
- Guie estratégia

Contexto:
Objetivo: [Novo produto / Expansão / Entrada em mercado / etc.]
Orçamento: [Baixo / Médio / Alto]
Tempo: [Urgente / Normal / Extensivo]

Crie metodologia:

1. OBJETIVOS DA PESQUISA
   - Perguntas a responder
   - Decisões a apoiar
   - Hipóteses a testar

2. MÉTODOS DE PESQUISA
   - Primária (entrevistas, surveys, focus groups)
   - Secundária (dados públicos, relatórios)
   - Quantitativa vs qualitativa
   - Quando usar cada

3. ANÁLISE DE CLIENTES
   - Perfil demográfico
   - Comportamento
   - Necessidades
   - Dores
   - Personas

4. ANÁLISE DE CONCORRÊNCIA
   - Identificação
   - Posicionamento
   - Forças e fraquezas
   - Estratégias
   - Gaps

5. ANÁLISE DE MERCADO
   - Tamanho (TAM/SAM/SOM)
   - Crescimento
   - Tendências
   - Segmentação
   - Barreiras de entrada

6. INSIGHTS E RECOMENDAÇÕES
   - Oportunidades
   - Ameaças
   - Estratégias
   - Próximos passos

Inclua também:
- Template de pesquisa
- Perguntas guia
- Ferramentas
- Exemplos

', 84, true),
('Análise Estratégica de Concorrência', 'Estrategico', 'Análise de Mercado', 'PROMPT: Análise Estratégica de Concorrência

Você é um estrategista competitivo. Crie análise que:
- Identifique todos os concorrentes
- Revele estratégias
- Mostre diferenciação
- Identifique oportunidades
- Guie posicionamento

Contexto:
Setor: [Descreva]
Concorrentes conhecidos: [Liste]
Posicionamento atual: [Descreva]

Crie análise:

1. MAPEAMENTO DE CONCORRENTES
   - Diretos
   - Indiretos
   - Substituição
   - Potenciais

2. ANÁLISE POR CONCORRENTE
   - Produtos/serviços
   - Preços
   - Posicionamento
   - Forças
   - Fraquezas
   - Estratégia
   - Market share

3. COMPARAÇÃO COMPETITIVA
   - Matriz comparativa
   - Diferenciação
   - Vantagens competitivas
   - Desvantagens

4. ANÁLISE ESTRATÉGICA
   - Movimentos recentes
   - Tendências
   - Oportunidades
   - Ameaças

5. POSICIONAMENTO
   - Onde você está
   - Onde deveria estar
   - Como diferenciar
   - Estratégias

Inclua também:
- Template de análise
- Matriz competitiva
- Exemplos
- Ferramentas

', 85, true),
('Framework para Tomada de Decisões Estratégicas', 'Estrategico', 'Decisões Estratégicas', 'PROMPT: Framework para Tomada de Decisões Estratégicas

Você é um especialista em tomada de decisão. Crie framework que:
- Estruture o processo
- Considere múltiplas opções
- Avalie riscos
- Seja objetivo
- Acelere decisões

Contexto:
Tipo de decisões: [Investimento / Parceria / Expansão / Produto / etc.]
Stakeholders: [Quantos / Quem]
Urgência: [Alta / Média / Baixa]

Crie framework:

1. DEFINIÇÃO DO PROBLEMA
   - Problema real
   - Objetivo
   - Restrições
   - Critérios de sucesso

2. GERAÇÃO DE ALTERNATIVAS
   - Brainstorming
   - Opções viáveis
   - Criatividade
   - Sem julgamento inicial

3. AVALIAÇÃO DE ALTERNATIVAS
   - Critérios de avaliação
   - Prós e contras
   - Riscos
   - Impacto
   - Viabilidade

4. DECISÃO
   - Matriz de decisão
   - Recomendação
   - Justificativa
   - Plano de ação

5. IMPLEMENTAÇÃO E MONITORAMENTO
   - Execução
   - Acompanhamento
   - Ajustes
   - Lições aprendidas

Inclua também:
- Template de decisão
- Ferramentas (matriz, scoring)
- Exemplos
- Checklist

', 86, true),
('Avaliar Oportunidades de Investimento Estratégico', 'Estrategico', 'Decisões Estratégicas', 'PROMPT: Avaliar Oportunidades de Investimento Estratégico

Você é um analista de investimentos. Crie framework de avaliação que:
- Analise viabilidade
- Calcule ROI
- Avalie riscos
- Compare opções
- Guie decisão

Contexto:
Tipo: [Equipamento / Tecnologia / Expansão / Aquisição / Marketing]
Valor: [R$ X]
Horizonte: [Curto / Médio / Longo prazo]

Crie framework:

1. ANÁLISE DE VIABILIDADE
   - Alinhamento estratégico
   - Necessidade
   - Alternativas
   - Timing

2. ANÁLISE FINANCEIRA
   - Investimento inicial
   - Custos recorrentes
   - Receitas esperadas
   - Payback
   - ROI
   - NPV
   - IRR

3. ANÁLISE DE RISCOS
   - Riscos identificados
   - Probabilidade
   - Impacto
   - Mitigações
   - Cenários

4. COMPARAÇÃO
   - Opções disponíveis
   - Trade-offs
   - Recomendação

5. RECOMENDAÇÃO
   - Decisão
   - Justificativa
   - Condições
   - Próximos passos

Inclua também:
- Templates de cálculo
- Exemplos
- Ferramentas
- Checklist

', 87, true),
('Processo de Inovação e Geração de Ideias', 'Estrategico', 'Inovação', 'PROMPT: Processo de Inovação e Geração de Ideias

Você é um especialista em inovação. Crie processo que:
- Gere ideias criativas
- Avalie viabilidade
- Priorize oportunidades
- Desenvolva conceitos
- Lance produtos

Contexto:
Tipo: [Produto / Serviço / Processo / Modelo de negócio]
Setor: [Descreva]
Recursos: [Tempo / Orçamento / Equipe]

Crie processo:

1. GERAÇÃO DE IDEIAS
   - Fontes de inspiração
   - Técnicas de brainstorming
   - Tendências
   - Dores do cliente
   - Gaps no mercado

2. AVALIAÇÃO INICIAL
   - Viabilidade técnica
   - Viabilidade de mercado
   - Alinhamento estratégico
   - Recursos necessários
   - Filtros

3. DESENVOLVIMENTO DE CONCEITO
   - Detalhamento
   - Prototipagem
   - Validação
   - Ajustes

4. PRIORIZAÇÃO
   - Impacto vs Esforço
   - Potencial de mercado
   - Diferenciação
   - Recursos disponíveis

5. ROADMAP
   - Fases de desenvolvimento
   - Timeline
   - Recursos
   - Marcos

Inclua também:
- Técnicas de inovação
- Templates
- Exemplos
- Ferramentas

', 88, true),
('Validar Hipóteses e Ideias de Negócio', 'Estrategico', 'Inovação', 'PROMPT: Validar Hipóteses e Ideias de Negócio

Você é um especialista em validação. Crie processo que:
- Teste hipóteses rapidamente
- Minimize risco
- Economize recursos
- Gere aprendizado
- Guie decisão

Contexto:
Tipo de ideia: [Produto / Feature / Mercado / Modelo]
Hipóteses principais: [Liste]
Recursos: [Limitados / Moderados]

Crie processo:

1. DEFINIÇÃO DE HIPÓTESES
   - Hipótese principal
   - Hipóteses secundárias
   - Critérios de sucesso
   - Métricas

2. MÉTODOS DE VALIDAÇÃO
   - Pesquisa
   - Entrevistas
   - Landing pages
   - MVPs
   - Testes A/B
   - Quando usar cada

3. EXPERIMENTOS
   - Design de experimento
   - Métricas
   - Timeline
   - Recursos

4. ANÁLISE DE RESULTADOS
   - Interpretação
   - Aprendizados
   - Decisão (pivotar/persistir/parar)
   - Próximos passos

5. ITERAÇÃO
   - Ajustes
   - Novos testes
   - Validação contínua

Inclua também:
- Template de experimento
- Exemplos
- Ferramentas
- Checklist

', 89, true),
('Estratégias de Crescimento e Escala', 'Estrategico', 'Crescimento', 'PROMPT: Estratégias de Crescimento e Escala

Você é um especialista em crescimento. Crie estratégias que:
- Acelerem crescimento
- Sejam sustentáveis
- Otimizem recursos
- Minimizem riscos
- Escalem operações

Contexto:
Estágio: [Startup / Crescimento / Maturidade]
Área de foco: [Vendas / Marketing / Produto / Operações]
Recursos: [Limitados / Moderados / Abundantes]

Crie estratégias:

1. ANÁLISE DE CRESCIMENTO
   - Onde está
   - Onde quer chegar
   - Gaps
   - Oportunidades

2. ESTRATÉGIAS POR ÁREA
   - Vendas (aquisição, expansão, retenção)
   - Marketing (canais, branding, conteúdo)
   - Produto (features, qualidade, inovação)
   - Operações (eficiência, escala, automação)

3. PRIORIZAÇÃO
   - Impacto vs Esforço
   - Recursos disponíveis
   - Dependências
   - Timeline

4. IMPLEMENTAÇÃO
   - Plano de ação
   - Recursos
   - Responsáveis
   - Marcos

5. MÉTRICAS
   - KPIs de crescimento
   - Acompanhamento
   - Ajustes

Inclua também:
- Framework de crescimento
- Exemplos
- Ferramentas
- Checklist

', 90, true),
('Desenvolver Parcerias Estratégicas', 'Estrategico', 'Parcerias', 'PROMPT: Desenvolver Parcerias Estratégicas

Você é um especialista em parcerias. Crie estratégia que:
- Identifique oportunidades
- Avalie parceiros
- Estruture acordos
- Gerencie relacionamentos
- Maximize valor

Contexto:
Tipo: [Distribuição / Tecnologia / Marketing / Conteúdo / etc.]
Objetivo: [Alcance / Recursos / Credibilidade / etc.]

Crie estratégia:

1. IDENTIFICAÇÃO
   - Oportunidades
   - Tipos de parcerias
   - Critérios de parceiro ideal
   - Onde encontrar

2. AVALIAÇÃO
   - Alinhamento estratégico
   - Complementaridade
   - Recursos
   - Reputação
   - Viabilidade

3. ESTRUTURAÇÃO
   - Objetivos comuns
   - Valor para cada parte
   - Responsabilidades
   - Recursos
   - Timeline

4. NEGOCIAÇÃO
   - Preparação
   - Proposta
   - Termos
   - Contrato

5. GESTÃO
   - Comunicação
   - Acompanhamento
   - Métricas
   - Ajustes
   - Renovação

Inclua também:
- Template de proposta
- Checklist
- Exemplos
- Ferramentas

', 91, true),
('Estratégia de Expansão para Novos Mercados', 'Estrategico', 'Expansão', 'PROMPT: Estratégia de Expansão para Novos Mercados

Você é um especialista em expansão. Crie estratégia que:
- Identifique mercados viáveis
- Avalie oportunidades
- Minimize riscos
- Seja executável
- Escale com sucesso

Contexto:
Mercado atual: [Descreva]
Tipo de expansão: [Geográfica / Segmento / Produto / Canal]
Recursos: [Descreva]

Crie estratégia:

1. IDENTIFICAÇÃO DE MERCADOS
   - Critérios de seleção
   - Análise de atratividade
   - Fit com produto
   - Potencial

2. ANÁLISE DE VIABILIDADE
   - Tamanho do mercado
   - Concorrência
   - Regulamentações
   - Barreiras
   - Recursos necessários

3. ESTRATÉGIA DE ENTRADA
   - Modelo de entrada
   - Go-to-market
   - Parceiros
   - Investimento
   - Timeline

4. PLANO DE EXECUÇÃO
   - Fases
   - Marcos
   - Recursos
   - Riscos e mitigações

5. MÉTRICAS
   - KPIs de expansão
   - Sucesso
   - Ajustes

Inclua também:
- Template de análise
- Exemplos
- Checklist
- Ferramentas

', 92, true),
('Estratégia de Posicionamento de Marca', 'Estrategico', 'Posicionamento', 'PROMPT: Estratégia de Posicionamento de Marca

Você é um especialista em branding. Crie estratégia que:
- Diferencie no mercado
- Conecte com clientes
- Seja consistente
- Crie valor percebido
- Construa lealdade

Contexto:
Marca atual: [Descreva]
Mercado: [Descreva]
Concorrentes: [Liste]
Público-alvo: [Descreva]

Crie estratégia:

1. ANÁLISE
   - Posicionamento atual
   - Concorrentes
   - Clientes
   - Oportunidades

2. POSICIONAMENTO DESEJADO
   - Proposta de valor única
   - Personalidade
   - Diferenciação
   - Promessa

3. ELEMENTOS DE MARCA
   - Nome
   - Logo
   - Cores
   - Tipografia
   - Tom de voz
   - Mensagem

4. COMUNICAÇÃO
   - Canais
   - Mensagens principais
   - Consistência
   - Frequência

5. IMPLEMENTAÇÃO
   - Touchpoints
   - Experiência
   - Consistência
   - Monitoramento

Inclua também:
- Template
- Exemplos
- Checklist
- Ferramentas

', 93, true),
('Estratégia de Transformação Digital', 'Estrategico', 'Transformação Digital', 'PROMPT: Estratégia de Transformação Digital

Você é um especialista em transformação digital. Crie estratégia que:
- Modernize operações
- Melhore experiência
- Aumente eficiência
- Seja executável
- Gere resultados

Contexto:
Nível atual: [Baixo / Médio / Alto]
Áreas prioritárias: [Liste]
Orçamento: [Descreva]
Timeline: [Descreva]

Crie estratégia:

1. DIAGNÓSTICO
   - Estado atual
   - Gaps
   - Oportunidades
   - Prioridades

2. VISÃO
   - Estado desejado
   - Benefícios
   - Diferenciação

3. ROADMAP
   - Fases
   - Projetos
   - Tecnologias
   - Timeline
   - Investimento

4. IMPLEMENTAÇÃO
   - Liderança
   - Equipe
   - Mudança cultural
   - Treinamento
   - Suporte

5. MÉTRICAS
   - KPIs
   - ROI
   - Satisfação
   - Eficiência

Inclua também:
- Template
- Exemplos
- Checklist
- Ferramentas

', 94, true),
('Estratégia de Sustentabilidade e ESG', 'Estrategico', 'Sustentabilidade', 'PROMPT: Estratégia de Sustentabilidade e ESG

Você é um especialista em sustentabilidade. Crie estratégia que:
- Seja genuína
- Crie valor
- Atenda stakeholders
- Seja mensurável
- Seja sustentável

Contexto:
Setor: [Descreva]
Tamanho: [Pequeno / Médio / Grande]
Motivação: [Regulatório / Mercado / Valores / Todos]

Crie estratégia:

1. ANÁLISE
   - Impacto atual
   - Expectativas
   - Oportunidades
   - Riscos

2. PILARES ESG
   - Environmental (Ambiental)
   - Social
   - Governance (Governança)
   - Priorização

3. INICIATIVAS
   - Por pilar
   - Impacto
   - Investimento
   - Timeline

4. IMPLEMENTAÇÃO
   - Liderança
   - Cultura
   - Processos
   - Parceiros

5. COMUNICAÇÃO
   - Stakeholders
   - Transparência
   - Relatórios
   - Storytelling

6. MÉTRICAS
   - KPIs ESG
   - Impacto
   - Progresso
   - Benchmarking

Inclua também:
- Template
- Exemplos
- Checklist
- Frameworks

', 95, true),
('Desenvolver Cultura Organizacional Estratégica', 'Estrategico', 'Cultura Organizacional', 'PROMPT: Desenvolver Cultura Organizacional Estratégica

Você é um especialista em cultura organizacional. Crie estratégia que:
- Alinhe com estratégia
- Engaje equipe
- Atraia talentos
- Retenha pessoas
- Impulsione performance

Contexto:
Tamanho: [X pessoas]
Estágio: [Startup / Crescimento / Maturidade]
Cultura atual: [Descreva]
Desafios: [Se souber]

Crie estratégia:

1. DEFINIÇÃO
   - Valores
   - Crenças
   - Comportamentos
   - Rituais

2. DIAGNÓSTICO
   - Cultura atual
   - Gaps
   - Fortalezas
   - Oportunidades

3. VISÃO
   - Cultura desejada
   - Diferenças
   - Prioridades

4. IMPLEMENTAÇÃO
   - Liderança
   - Comunicação
   - Processos
   - Reconhecimento
   - Treinamento

5. SUSTENTAÇÃO
   - Recrutamento
   - Onboarding
   - Desenvolvimento
   - Avaliação
   - Ajustes

Inclua também:
- Template
- Exemplos
- Checklist
- Ferramentas

', 96, true),
('Estratégia de Desenvolvimento de Liderança', 'Estrategico', 'Liderança', 'PROMPT: Estratégia de Desenvolvimento de Liderança

Você é um especialista em desenvolvimento de liderança. Crie estratégia que:
- Desenvolva líderes
- Prepare sucessão
- Fortaleça equipe
- Melhore performance
- Sustente crescimento

Contexto:
Nível: [Líderes júnior / Médio / Sênior / Todos]
Necessidades: [Descreva]
Recursos: [Tempo / Orçamento]

Crie estratégia:

1. IDENTIFICAÇÃO
   - Líderes atuais
   - Potenciais
   - Gaps
   - Necessidades

2. COMPETÊNCIAS
   - Essenciais
   - Por nível
   - Avaliação
   - Desenvolvimento

3. PROGRAMA
   - Treinamento
   - Mentoria
   - Coaching
   - Experiências
   - Timeline

4. IMPLEMENTAÇÃO
   - Priorização
   - Recursos
   - Acompanhamento
   - Ajustes

5. MÉTRICAS
   - Progresso
   - Performance
   - Retenção
   - Promoções

Inclua também:
- Template
- Exemplos
- Checklist
- Ferramentas

', 97, true),
('Gestão Estratégica de Crises', 'Estrategico', 'Gestão de Crises', 'PROMPT: Gestão Estratégica de Crises

Você é um especialista em gestão de crises. Crie framework que:
- Prepare para crises
- Responda rapidamente
- Minimize danos
- Proteja reputação
- Recupere confiança

Contexto:
Tipo de riscos: [Operacionais / Reputacionais / Financeiros / Legais / etc.]
Setor: [Descreva]
Exposição: [Alta / Média / Baixa]

Crie framework:

1. PREPARAÇÃO
   - Identificação de riscos
   - Planos de contingência
   - Equipe de crise
   - Comunicação
   - Treinamento

2. DETECÇÃO
   - Sinais de alerta
   - Monitoramento
   - Alertas
   - Ativação

3. RESPOSTA
   - Avaliação
   - Ações imediatas
   - Comunicação
   - Gestão de stakeholders
   - Recursos

4. RECUPERAÇÃO
   - Estabilização
   - Análise
   - Ações corretivas
   - Comunicação
   - Reconstrução

5. APRENDIZADO
   - Lições
   - Melhorias
   - Atualização de planos
   - Cultura

Inclua também:
- Template de plano
- Exemplos
- Checklist
- Ferramentas

', 98, true),
('Estratégia de Fusão e Aquisição (M&A)', 'Estrategico', 'Fusão e Aquisição', 'PROMPT: Estratégia de Fusão e Aquisição (M&A)

Você é um especialista em M&A. Crie framework que:
- Identifique oportunidades
- Avalie alvos
- Estruture transação
- Gerencie integração
- Maximize valor

Contexto:
Tipo: [Comprador / Vendedor]
Objetivo: [Crescimento / Sinergias / Mercado / Tecnologia]
Tamanho: [Pequeno / Médio / Grande]

Crie framework:

1. ESTRATÉGIA
   - Objetivos
   - Critérios de alvo
   - Tipo de transação
   - Timing

2. IDENTIFICAÇÃO E AVALIAÇÃO
   - Sourcing
   - Due diligence
   - Valoração
   - Sinergias
   - Riscos

3. NEGOCIAÇÃO
   - Estrutura
   - Preço
   - Termos
   - Condições
   - Contrato

4. INTEGRAÇÃO
   - Planejamento
   - Execução
   - Cultura
   - Sistemas
   - Pessoas

5. REALIZAÇÃO DE VALOR
   - Sinergias
   - Métricas
   - Ajustes
   - Sucesso

Inclua também:
- Template de análise
- Checklist
- Exemplos
- Ferramentas

', 99, true),
('Processo de Revisão Estratégica Contínua', 'Estrategico', 'Revisão Estratégica', 'PROMPT: Processo de Revisão Estratégica Contínua

Você é um estrategista. Crie processo de revisão que:
- Monitore progresso
- Identifique ajustes
- Seja ágil
- Envolva stakeholders
- Mantenha estratégia relevante

Contexto:
Frequência: [Mensal / Trimestral / Semestral / Anual]
Participantes: [Equipe / Liderança / Todos]
Estratégia atual: [Descreva brevemente]

Crie processo:

1. PREPARAÇÃO
   - Dados necessários
   - Métricas
   - Participantes
   - Agenda

2. REVISÃO
   - Progresso vs metas
   - Mudanças no ambiente
   - Oportunidades
   - Ameaças
   - Aprendizados

3. ANÁLISE
   - O que está funcionando
   - O que não está
   - Por quê
   - O que mudou

4. AJUSTES
   - Mudanças necessárias
   - Prioridades
   - Recursos
   - Timeline

5. COMUNICAÇÃO E EXECUÇÃO
   - Comunicação
   - Alinhamento
   - Ações
   - Acompanhamento

Inclua também:
- Template de revisão
- Checklist
- Exemplos
- Ferramentas
- Frequência recomendada

', 100, true),
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

', 20, true),
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

', 40, true),
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