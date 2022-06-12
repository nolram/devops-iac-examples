# Terraform + Terragrunt

Repositório de código de provisionamento de infraestrutura na [AWS](https://aws.amazon.com/pt/) usando as ferramentas de [Terraform](https://www.terraform.io/) e [Terragrunt](https://terragrunt.gruntwork.io/), implementando utilizando os conceitos de [DRY (Don't repeat yourself) do Terragrunt](https://terragrunt.gruntwork.io/docs/features/keep-your-terragrunt-architecture-dry/#keep-your-terragrunt-architecture-dry). (Críticas construtivas são bem vindas!)

Os módulos Terraform utilizados para o provisionamento dos recursos foram desenvolvidos pelo pessoal da [Cloud Posse](https://github.com/cloudposse)

Esse repositório pode provisionar VPC, Subnet, Tabela DynamoDB, EKS Cluster e EKS Node.

## Recursos necessários

- [Terragrunt - 0.37.1](https://terragrunt.gruntwork.io/)
- [Terraform - 1.2.2](https://www.terraform.io/)
- [AWS CLI - 2.7.0](https://aws.amazon.com/pt/cli/) Opcional

## Módulos utilizados

- [terraform-aws-eks-cluster](https://github.com/cloudposse/terraform-aws-eks-cluster)
- [terraform-aws-eks-node-group](https://github.com/cloudposse/terraform-aws-eks-node-group)
- [terraform-aws-dynamodb](https://github.com/cloudposse/terraform-aws-dynamodb)
- [terraform-aws-vpc](https://github.com/cloudposse/terraform-aws-vpc)
- [terraform-aws-dynamic-subnets](https://github.com/cloudposse/terraform-aws-dynamic-subnets)
- [terraform-null-label](https://github.com/cloudposse/terraform-null-label)

## Variáveis de Ambientes Obrigatórias

- `DYNAMODB_LOCK_TABLE`: Tabela Dynamodb para armazenar o state lock do tfstate (Necessário criar a tabela previamente)
- `ACCOUNT_ID`: ID da conta da AWS
- `BUCKET_STATES`: Bucket S3 para armazenar os tfstates do terraform
- `ACCESS_KEY`: Access Key da conta AWS
- `SECRET_KEY`: Secret Key da conta AWS

## Executando (Exemplo)

```bash
export ACCESS_KEY=$(aws configure get default.aws_access_key_id)
export SECRET_KEY=$(aws configure get default.aws_secret_access_key)
export DYNAMODB_LOCK_TABLE=""
export BUCKET_STATES=""
export ACCOUNT_ID=""

cd prod/vpc
terragrunt plan
terragrunt apply
```

## Estrutura de diretórios

```bash
.
├── _env
│   ├── dynamodb.hcl
│   ├── eks_cluster.hcl
│   ├── eks_node.hcl
│   ├── label.hcl
│   ├── subnet.hcl
│   └── vpc.hcl
├── prod
│   ├── dynamodb_app
│   │   └── terragrunt.hcl
│   ├── eks_cluster
│   │   └── terragrunt.hcl
│   ├── eks_node
│   │   └── terragrunt.hcl
│   ├── env.hcl
│   ├── label
│   │   └── terragrunt.hcl
│   ├── subnet
│   │   └── terragrunt.hcl
│   └── vpc
│       └── terragrunt.hcl
├── README.md
└── terragrunt.hcl

8 directories, 15 files
```
