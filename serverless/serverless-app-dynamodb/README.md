# Serverless App Dynamodb

Aplicação Lambda de exemplo, escrito em Typescript e Node 14, utiliza o framework [Serverless](https://www.serverless.com/). Realiza a criação de AWS HTTP API Gateway e uma tabela DynamoDB e realiza o deploy de duas funções AWS Lambda, getUser e insertUser.

## Execução
### Deploy
[![asciicast](https://asciinema.org/a/424433.svg)](https://asciinema.org/a/424433)

## Requisitos
```
Node 14
Serverless
```

## Rodando Localmente
Necessário ter um DynamoDB rodando localmente, existe um script python (necessário a biblioteca boto) e um docker-compose.yml na pasta [dynamodb-local](dynamodb-local) com o setup local necessário. 

Instalar o Serverless
```
npm install -g serverless
```

Com o DynamoDB rodando localmente e as dependencias instaladas `npm i` basta rodar o comando 
```
npm run start
```

## Deploy
Necessário ter credenciais AWS na pasta `~/.aws/credentials` com as devidas [permissões](https://www.serverless.com/framework/docs/providers/aws/guide/credentials/) de uso.

```
sls deploy --stage dev -r us-east-1 -c serverless.yml
```

## Teste
```sh

curl --location --request POST 'https://CHANGE_URL/user' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Marlon",
    "email": "marlonbquadros@gmail.com"
}'

curl --location --request GET 'https://CHANGE_URL/user/user?email=marlonbquadros@gmail.com'
```

## CI/CD
Na pasta [.cicd](.cicd) existe um template de [CloudFormation](https://aws.amazon.com/pt/cloudformation/) para a configuração de um [AWS CodePipeline](https://aws.amazon.com/pt/codepipeline/) com [AWS CodeBuild](https://aws.amazon.com/pt/codebuild/) para realizar o deploy do serviço Lambda. [README.md](.cicd/README.md) dentro da pasta com os comandos necessários para realizar o deploy.

## Diretório
```
.
├── .cicd
│   ├── Pipeline.yml
│   ├── README.md
│   └── buildspec
│       └── buildspec_cicd.yml
├── .env-example
├── .eslintignore
├── .eslintrc.js
├── .husky
│   ├── .gitignore
│   ├── pre-commit
│   └── pre-push
├── .nvmrc
├── .prettierignore
├── .prettierrc.js
├── README.md
├── dbconfig.ts
├── dynamodb-local
│   ├── config_dynamodb_local.py
│   ├── docker-compose.yml
│   └── requirements.txt
├── package-lock.json
├── package.json
├── resource
│   └── dynamodb
│       └── DynamoDBTable.yml
├── serverless.yml
├── src
│   ├── app.ts
│   ├── core
│   │   ├── container.ts
│   │   └── services
│   │       └── user.ts
│   ├── env.ts
│   ├── http
│   │   ├── controllers
│   │   │   └── user.ts
│   │   ├── index.ts
│   │   └── schemas
│   │       └── user.ts
│   ├── infrastructure
│   │   ├── adapter
│   │   │   └── dynamodb.ts
│   │   ├── container.ts
│   │   ├── database.ts
│   │   └── repository
│   │       └── user.ts
│   ├── middleware
│   │   └── validator.ts
│   ├── server.ts
│   └── types
│       ├── core.d.ts
│       ├── env.d.ts
│       ├── infrastructure.d.ts
│       └── user.d.ts
└── tsconfig.json
```