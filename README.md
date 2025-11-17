# Introdução
Este projeto implementa uma arquitetura em nuvem na Amazon Web Services (AWS) utilizando Terraform como ferramenta de Infrastructure as Code (IaC). A solução segue boas práticas de mercado e padrões acadêmicos aplicáveis a trabalhos de MBA, apresentando uma infraestrutura escalável, segura e altamente disponível.
O ambiente foi desenvolvido e testado em AWS Lab, utilizando uma instância Amazon Linux 2023 para execução dos comandos Terraform e validação da infraestrutura provisionada.

# Objetivos
Este trabalho visa:

✅ Provisionar uma infraestrutura elástica e altamente disponível na AWS
✅ Aplicar práticas de automação com Terraform
✅ Implementar conceitos de Infrastructure as Code (IaC)


# Conceitos Abordados

VPC (Virtual Private Cloud) - Rede isolada na AWS
Sub-redes Públicas - Segmentação de rede com acesso à internet
Security Groups - Firewall virtual para controle de tráfego
Application Load Balancer (ALB) - Distribuição de carga de aplicações
Auto Scaling Group (ASG) - Escalabilidade automática de recursos
Launch Templates - Templates para lançamento de instâncias EC2
User Data Scripts - Automação de configuração inicial de instâncias

# Metodologia
O projeto foi desenvolvido seguindo uma abordagem estruturada em três etapas principais:

1. Preparação do Ambiente

Criação de ambiente LAB na AWS Academy
Provisionamento de instância EC2 com Amazon Linux
Configuração de acesso SSH via putty
Instalação e configuração do Terraform

2. Estruturação do Código

Organização modular do código Terraform
Separação lógica de componentes (VPC, Compute, Load Balancer, etc.)
Definição de variáveis parametrizáveis
Configuração de outputs para visualização de recursos criados
