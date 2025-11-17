 Introdução
Este projeto implementa uma arquitetura em nuvem na Amazon Web Services (AWS) utilizando Terraform como ferramenta de Infrastructure as Code (IaC). A solução apresenta uma infraestrutura escalável, segura e altamente disponível.
O ambiente foi desenvolvido e testado em AWS Lab, utilizando uma instância Amazon Linux 2023.

🎓 Objetivos

✅ Provisionar infraestrutura elástica e altamente disponível na AWS
✅ Aplicar práticas de automação com Terraform
✅ Implementar conceitos de Infrastructure as Code (IaC)


🏗️ Arquitetura da Solução
                    ┌─────────────┐
                    │   Usuários  │
                    └──────┬──────┘
                           │
                    ┌──────▼──────────┐
                    │   Route 53      │
                    │   (DNS)         │
                    └──────┬──────────┘
                           │
              ┌────────────▼────────────┐
              │  Elastic Load Balancer  │
              └────────────┬────────────┘
                           │
           ┌───────────────┴───────────────┐
           │                               │
    ┌──────▼──────┐               ┌───────▼──────┐
    │   Zone A    │               │   Zone B     │
    │             │               │              │
    │ ┌─────────┐ │               │ ┌─────────┐ │
    │ │ Public  │ │               │ │ Public  │ │
    │ │ Subnet  │ │               │ │ Subnet  │ │
    │ └────┬────┘ │               │ └────┬────┘ │
    │      │      │               │      │      │
    │  ┌───▼───┐  │               │  ┌───▼───┐ │
    │  │ EC2   │  │               │  │ EC2   │ │
    │  └───────┘  │               │  └───────┘ │
    └─────────────┘               └────────────┘
           │                               │
           └───────────────┬───────────────┘
                           │
                   ┌───────▼────────┐
                   │  Auto Scaling  │
                   └────────────────┘

📚 Conceitos Abordados
ConceitoDescriçãoVPC (Virtual Private Cloud)Rede isolada na AWSSub-redes PúblicasSegmentação de rede com acesso à internetSecurity GroupsFirewall virtual para controle de tráfegoApplication Load Balancer (ALB)Distribuição de carga de aplicaçõesAuto Scaling Group (ASG)Escalabilidade automática de recursosLaunch TemplatesTemplates para lançamento de instâncias EC2User Data ScriptsAutomação de configuração inicial de instânciasAmazon Route 53Serviço de DNS gerenciado

🔄 Componentes e Fluxo
1. Usuários e Amazon Route 53
Usuários:

Clientes finais acessando a aplicação via internet

Amazon Route 53:

Serviço de DNS da AWS
Resolve o nome do domínio (ex: www.exemplo.com)
Direciona requisições para o Elastic Load Balancer


2. Elastic Load Balancing (ELB)
Função:

Distribui automaticamente o tráfego de entrada entre múltiplas instâncias EC2
Realiza health checks para garantir disponibilidade
Direciona tráfego apenas para instâncias saudáveis


3. Zonas de Disponibilidade (AZs)
Zone A e Zone B:

Zonas de disponibilidade dentro de uma mesma região AWS
Cada zona possui:

Sub-rede pública: onde as instâncias EC2 podem acessar a internet
Instâncias EC2: servidores virtuais que executam a aplicação



Benefício:

Alta disponibilidade e resiliência contra falhas


4. Auto Scaling
Função:

Monitora a carga nas instâncias EC2
Adiciona ou remove instâncias automaticamente baseado em políticas definidas

Exemplo de Política:

Scale Out: CPU > 80% por 5 minutos → Adiciona instância
Scale In: CPU < 30% por 10 minutos → Remove instância

Benefícios:

Elasticidade: responde à demanda
Eficiência de custo: paga apenas pelo necessário


📊 Resumo do Fluxo
1. Usuários fazem requisições → www.exemplo.com
                ↓
2. Route 53 resolve DNS → IP do ELB
                ↓
3. ELB distribui requisições → Instâncias EC2 (Zone A e Zone B)
                ↓
4. Auto Scaling monitora métricas e ajusta capacidade
                ↓
5. Aplicação processa e retorna resposta ao usuário
Fluxo Detalhado
PassoComponenteAção1UsuárioAcessa www.exemplo.com2Route 53Resolve DNS para IP do Load Balancer3ELBDistribui requisição entre instâncias saudáveis em Zone A ou B4EC2Processa requisição na sub-rede pública5Auto ScalingMonitora CPU, memória e adiciona/remove instâncias conforme necessário

🔬 Metodologia
1. Preparação do Ambiente

Criação de ambiente LAB na AWS Academy
Provisionamento de instância EC2 com Amazon Linux 2023
Configuração de acesso SSH via PuTTY
Instalação e configuração do Terraform

2. Estruturação do Código

Organização modular do código Terraform
Separação lógica de componentes (VPC, Compute, Load Balancer)
Definição de variáveis parametrizáveis
Configuração de outputs para visualização de recursos criados

3. Implementação Iterativa
bashterraform init    # Inicialização
terraform plan    # Planejamento
terraform apply   # Aplicação
# Análise de erros e ajustes
# Repetir até estabilidade

🚀 Instalação
Instalação do Terraform (Amazon Linux 2023)
bash# Download
wget https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip

# Extração
unzip terraform_1.6.0_linux_amd64.zip

# Instalação
sudo mv terraform /usr/local/bin/

# Verificação
terraform version
```

### Estrutura do Projeto
```
terraform-aws-infrastructure/
├── modules/
│   ├── vpc/              # VPC, Subnets, IGW
│   ├── security/         # Security Groups
│   ├── compute/          # Launch Template, ASG
│   └── loadbalancer/     # ALB, Target Groups
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars
Comandos de Execução
bash# Inicializar
terraform init

# Validar
terraform validate

# Planejar
terraform plan

# Aplicar
terraform apply

# Destruir (quando necessário)
terraform destroy

📚 Referências

Terraform Documentation
AWS Provider Documentation
AWS Well-Architected Framework
Amazon Route 53
Elastic Load Balancing
Amazon EC2 Auto Scaling

