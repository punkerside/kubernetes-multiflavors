PROJECT = kubernetes
SERVICE = multiflavors

DOCKER_UID  = $(shell id -u)
DOCKER_GID  = $(shell id -g)
DOCKER_USER = $(shell whoami)

base:
	@docker build -t ${PROJECT}-${SERVICE}-base:latest -f docker/Dockerfile.base .
	@docker build -t ${PROJECT}-${SERVICE}-python:build --build-arg IMG=${PROJECT}-${SERVICE}-base:latest -f docker/Dockerfile.python --target build .
	@docker build -t ${PROJECT}-${SERVICE}-go:build --build-arg IMG=${PROJECT}-${SERVICE}-base:latest -f docker/Dockerfile.go --target build .

build:
	@echo "${DOCKER_USER}:x:${DOCKER_UID}:${DOCKER_GID}::/app:/sbin/nologin" > passwd
	@docker run --rm -u ${DOCKER_UID}:${DOCKER_GID} -v ${PWD}/passwd:/etc/passwd:ro -v ${PWD}/app/movie:/app ${PROJECT}-${SERVICE}-python:build
	@docker run --rm -u ${DOCKER_UID}:${DOCKER_GID} -v ${PWD}/passwd:/etc/passwd:ro -v ${PWD}/app/music:/app ${PROJECT}-${SERVICE}-go:build

release:
	@docker build -t ${PROJECT}-${SERVICE}-python:latest --build-arg IMG=${PROJECT}-${SERVICE}-base:latest -f docker/Dockerfile.python --target latest .
	@docker build -t ${PROJECT}-${SERVICE}-go:latest --build-arg IMG=${PROJECT}-${SERVICE}-base:latest -f docker/Dockerfile.go --target latest .

up:
	@docker-compose up

down:
	@docker-compose down