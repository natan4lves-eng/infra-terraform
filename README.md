# Atividade 3 - Provisionar arquitetura de serviços AWS via Terraform

# Introdução
Este repositorio implementa uma arquitetura em nuvem na Amazon Web Services (AWS) utilizando Terraform como ferramenta de Infrastructure as Code (IaC). A solução apresenta uma infraestrutura escalável, segura e altamente disponível.
O ambiente foi desenvolvido e testado em AWS Lab, utilizando uma instância Amazon Linux.

## Serviços que será implementado
- EC2
- Elastic Load Balancing (ELB)
- VPC e Subnets
- AplicaçõesAuto Scaling Group
- Security Groups
- internet-gateway
- Route 53

# Objetivos

✅ Provisionar infraestrutura elástica e altamente disponível na AWS

✅ Aplicar práticas de automação com Terraform

✅ Implementar conceitos de Infrastructure as Code (IaC)

# Conceitos Abordados
Conceito Descrição VPC (Virtual Private Cloud)
Rede isolada na AWS Sub-redes Públicas
Segmentação de rede com acesso à internet Security Groups
Firewall virtual para controle de tráfego Application Load Balancer (ALB)
Distribuição de carga de aplicaçõesAuto Scaling Group (ASG)
Escalabilidade automática de recursosLaunch TemplatesTemplates para lançamento de instâncias EC2
User Data ScriptsAutomação de configuração inicial de instânciasAmazon Route 53Serviço de DNS gerenciado


## Metodologia utilizado para Implementação
- Criação de ambiente LAB na AWS e acesso via Putty em uma instância EC2 baseada em Amazon Linux; 
- Organização do projeto Terraform em módulos reutilizáveis, com arquivos separados de variáveis, saídas e lógica principal; 
- Uso iterativo dos comandos terraform como init/plan/apply.


# Componentes e Fluxo
## Usuários e Amazon Route 53
Usuários:

Clientes finais acessando a aplicação via internet

Amazon Route 53:

Serviço de DNS da AWS
Resolve o nome do domínio (ex: www.exemplo.com)
Direciona requisições para o Elastic Load Balancer


## Elastic Load Balancing (ELB)
Função:

Distribui automaticamente o tráfego de entrada entre múltiplas instâncias EC2
Realiza health checks para garantir disponibilidade
Direciona tráfego apenas para instâncias saudáveis


## Zonas de Disponibilidade (AZs)
Zone A e Zone B:

Zonas de disponibilidade dentro de uma mesma região AWS
Cada zona possui:

Sub-rede pública: onde as instâncias EC2 podem acessar a internet
Instâncias EC2: servidores virtuais que executam a aplicação

