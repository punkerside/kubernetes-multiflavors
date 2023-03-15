PROJECT = microservice
SERVICE = multiflavors

base:
	@docker build -t ${PROJECT}-${SERVICE}:base -f docker/base/Dockerfile .
	@docker build -t ${PROJECT}-${SERVICE}:python --build-arg IMG=${PROJECT}-${SERVICE}:base -f docker/python/Dockerfile .

run:
	docker-compose up

stop:
	docker-compose down


## titan project

GIT_OWNER  = punkerside
GIT_REPO   = titan-bash
GIT_BRANCH = main
REP_HOME   = $(shell echo "$(shell pwd | rev | cut -d "/" -f1 | rev)")

# configurando directorio
ifeq ($(REP_HOME),${GIT_REPO})
GIT_HOME = $(shell echo "$(PWD)")
else
GIT_HOME = $(shell echo "$(PWD)/.${GIT_REPO}")
endif

init:
	@rm -rf .${GIT_REPO}/
	@git clone git@github.com:${GIT_OWNER}/${GIT_REPO}.git -b ${GIT_BRANCH} .${GIT_REPO}

# necesario para validaciones del repositorio titan
-include makefiles/*.mk

# necesario para la carga de procesos en repositorios clientes
-include .${GIT_REPO}/makefiles/*.mk