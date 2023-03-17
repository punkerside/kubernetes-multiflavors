PROJECT = microservice
SERVICE = multiflavors

DOCKER_UID  = $(shell id -u)
DOCKER_GID  = $(shell id -g)
DOCKER_USER = $(shell whoami)

base:
	@docker build -t ${PROJECT}-${SERVICE}:base -f docker/base/Dockerfile .
	@docker build -t ${PROJECT}-${SERVICE}:python --build-arg IMG=${PROJECT}-${SERVICE}:base -f docker/python/Dockerfile .
	@docker build -t ${PROJECT}-${SERVICE}:node --build-arg IMG=${PROJECT}-${SERVICE}:base -f docker/node/Dockerfile .
	@docker build -t ${PROJECT}-${SERVICE}:npm --build-arg IMG=${PROJECT}-${SERVICE}:base -f docker/npm/Dockerfile .
	@docker build -t ${PROJECT}-${SERVICE}:go --build-arg IMG=${PROJECT}-${SERVICE}:base -f docker/go/Dockerfile .

build:
	@echo ''"${DOCKER_USER}"':x:'"${DOCKER_UID}"':'"${DOCKER_GID}"'::/app:/sbin/nologin' > passwd
#	@docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}"/app/front:/app ${PROJECT}-${SERVICE}:npm
	@docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}"/app/music:/app ${PROJECT}-${SERVICE}:go get -u github.com/gorilla/mux
	@docker run --rm -u "${DOCKER_UID}":"${DOCKER_GID}" -v "${PWD}"/passwd:/etc/passwd:ro -v "${PWD}"/app/music:/app ${PROJECT}-${SERVICE}:go get -u go.mongodb.org/mongo-driver
	
start:
	@docker-compose up

stop:
	@docker-compose down


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