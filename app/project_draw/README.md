# Project Draw

Uma aplicação simples escrita em Python com o framework Django para realizar sorteios, semelhante ao https://www.random.org/lists/

## Requisitos
```
gunicorn==20.1.0
Django==3.2.5
psycopg2==2.9.1
```

## Run Dev
```shell
python manage.py migrate
python manage.py runserver
```

## Run Docker
```
docker-compose up -d --build
```
## Diretório
```
.
├── Dockerfile
├── README.md
├── app_draw
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── forms.py
│   ├── migrations
│   │   ├── 0001_initial.py
│   │   ├── __init__.py
│   ├── models.py
│   ├── static
│   │   └── app_draw
│   │       └── css
│   │           ├── index.css
│   │           └── winners.css
│   ├── templates
│   │   └── app_draw
│   │       ├── index.html
│   │       └── winners.html
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── docker
│   ├── nginx
│   │   └── nginx.default
│   └── server
│       └── start.sh
├── docker-compose.yml
├── manage.py
├── project_draw
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
└── requirements.txt
```