# Playbook

## Sobre
O playbook project_draw realiza a instalação do Docker e coloca para rodar a aplicação da pasta [app](../../app). 
Esse playbook foi criado para demonstrar testes com o [Molecule](https://molecule.readthedocs.io/en/latest/).

## Execução

### Todos os testes
[![asciicast](https://asciinema.org/a/ErHKdXriI7FYK70PyDpfDlLkV.svg)](https://asciinema.org/a/ErHKdXriI7FYK70PyDpfDlLkV)

### Passo a passo
[![asciicast](https://asciinema.org/a/EQyK8fgfGqAs4Vx5FRWAaRzI0.svg)](https://asciinema.org/a/EQyK8fgfGqAs4Vx5FRWAaRzI0)

## Requisitos
Python 3
Vagrant
```
ansible==4.2.0
molecule==3.3.4
molecule-docker==0.2.4
molecule-vagrant==0.6.3
python-vagrant==0.5.15
```

## Molecule
Os testes com Molecule utilizou a seguinte estrutura no arquivo [molecule.yml](molecule/default/molecule.yml):
```yaml
dependency:
  name: galaxy
driver:
  name: vagrant
provisioner:
  name: ansible
verifier:
  name: ansible
lint: |
  set -e
  yamllint .
  ansible-lint .
```

O [Scenario](https://molecule.readthedocs.io/en/latest/configuration.html#scenario) utilizado foi o default.

Os testes localizados dentro da [molecule/default/roles/test_project](molecule/default/roles/test_project) realiza a verificação se o docker foi instalado com sucesso e se a aplicação está rodando.

## Comandos
- `molecule create` - Criação da VM no Vagrant
- `molecule converge` - Instalação do playbook
- `molecule verify` - Rodar os testes
- `molecule destroy` - Destruir a VM no Vagrant

Outros comandos podem ser encontrados [aqui](https://molecule.readthedocs.io/en/latest/usage.html) 

- `molecule test` - Para rodar todos os testes do [Scenario default](https://molecule.readthedocs.io/en/latest/configuration.html#scenario)


## Referências
- Role [docker](roles/docker) feita por [Jeff Geerling](https://www.jeffgeerling.com/)

## Diretório
```
.
├── README.md
├── molecule
│   └── default
│       ├── Dockerfile.j2
│       ├── converge.yml
│       ├── molecule.yml
│       ├── roles
│       │   └── test_project
│       │       ├── default
│       │       │   └── main.yml
│       │       ├── tasks
│       │       │   ├── main.yml
│       │       │   ├── test_app.yml
│       │       │   └── test_docker.yml
│       │       └── vars
│       │           └── main.yml
│       └── verify.yml
├── playbook.yml
├── requirements.txt
└── roles
    ├── app
    │   ├── README.md
    │   ├── defaults
    │   │   └── main.yml
    │   ├── handlers
    │   │   └── main.yml
    │   ├── meta
    │   │   └── main.yml
    │   ├── tasks
    │   │   └── main.yml
    │   ├── templates
    │   │   └── docker-compose.yml.j2
    │   ├── tests
    │   │   ├── inventory
    │   │   └── test.yml
    │   └── vars
    │       └── main.yml
    └── docker
        ├── LICENSE
        ├── README.md
        ├── defaults
        │   └── main.yml
        ├── handlers
        │   └── main.yml
        ├── meta
        │   └── main.yml
        ├── molecule
        │   └── default
        │       ├── molecule.yml
        │       ├── playbook.yml
        │       └── yaml-lint.yml
        └── tasks
            ├── docker-compose.yml
            ├── docker-users.yml
            ├── main.yml
            ├── setup-Debian.yml
            └── setup-RedHat.yml
```