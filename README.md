# Microservice Multiflavors

[![Build](https://github.com/punkerside/microservice-multiflavors/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/punkerside/microservice-multiflavors/actions/workflows/main.yml)
[![Open Source Helpers](https://www.codetriage.com/punkerside/microservice-multiflavors/badges/users.svg)](https://www.codetriage.com/punkerside/microservice-multiflavors)
[![GitHub Issues](https://img.shields.io/github/issues/punkerside/microservice-multiflavors.svg)](https://github.com/punkerside/microservice-multiflavors/issues)
[![GitHub Tag](https://img.shields.io/github/tag-date/punkerside/microservice-multiflavors.svg?style=plastic)](https://github.com/punkerside/microservice-multiflavors/tags/)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/punkerside/microservice-multiflavors)

## Containers

| Path | Flavor |
|-------------|------|
| `/movie` | python |
| `/music` | go |


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