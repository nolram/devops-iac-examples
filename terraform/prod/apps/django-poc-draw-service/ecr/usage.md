# Project Draw

Uma aplicação simples escrita em Python com o framework Django para realizar sorteios, semelhante ao https://www.random.org/lists/

## Requisitos

```pip
gunicorn==20.1.0
Django==4.0.5
psycopg2==2.9.3
```

## Run Docker

```bash
docker-compose up -d --build
```

## docker-compose
```
version: "3.8"
services:
  db:
    image: postgres:12
    tty: true
    environment:
      POSTGRES_PASSWORD: pass
      POSTGRES_USER: user
      POSTGRES_DB: database
    networks:
      - database
  app:
    image: public.ecr.aws/h8l7l8v7/project_draw:latest
    ports:
      - "8010:8020"
    environment:
      DATABASE_POSTGRES: "True"
      DB_PASSWORD: pass
      DB_USER: user
      DB_NAME: database
      DB_HOST: db
      DB_PORT: 5432
      APPLY_MIGRATION: "true"
    depends_on:
      - db
    networks:
      - database

networks:
  database:

```
