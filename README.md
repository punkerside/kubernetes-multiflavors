# Microservice Multiflavors

[![Build](https://github.com/punkerside/microservice-multiflavors/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/punkerside/microservice-multiflavors/actions/workflows/main.yml)
[![Open Source Helpers](https://www.codetriage.com/punkerside/microservice-multiflavors/badges/users.svg)](https://www.codetriage.com/punkerside/microservice-multiflavors)
[![GitHub Issues](https://img.shields.io/github/issues/punkerside/microservice-multiflavors.svg)](https://github.com/punkerside/microservice-multiflavors/issues)
[![GitHub Tag](https://img.shields.io/github/tag-date/punkerside/microservice-multiflavors.svg?style=plastic)](https://github.com/punkerside/microservice-multiflavors/tags/)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/punkerside/microservice-multiflavors)

## Containers

| Path | Flavor | Database |
|------|--------|----------|
| `/movie` | Python | Redis |
| `/music` | Go | Mongo |
| `/user` | JavaScript | PostgreSQL |

## Init

1. Generando imagen de contenedores

```bash
make base
```

2. Compilando aplicaciones de prueba

```bash
make build
```

3. Iniciando aplicaciones

```bash
make up
```

4. Deteniendo aplicaciones

```bash
make down
```

## Use



1. Microservice **Movie**

```bash
# put data
curl -XPOST http://127.0.0.1:5000/movie?name=everest
# get data
curl http://127.0.0.1:5000/movie
```

2. Microservice **music**

```bash
# put data
curl -XPOST http://127.0.0.1:9081/post?name=moby
# get data
curl http://127.0.0.1:9081/get
```

3. Microservice **user**

```bash
# put data
curl -X POST -H 'Content-Type: application/json' -d '{"name":  "Ivan Echegaray Avendaño", "email": "my@mail.com"}' http://127.0.0.1:3000/user
# get data
curl http://127.0.0.1:3000/user
```