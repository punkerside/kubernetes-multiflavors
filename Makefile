PROJECT = microservice
SERVICE = multiflavors

base:
	@docker build -t ${PROJECT}-${SERVICE}:base -f docker/base/Dockerfile .
	@docker build -t ${PROJECT}-${SERVICE}:python --build-arg IMG=${PROJECT}-${SERVICE}:base -f docker/python/Dockerfile .

run:
	docker-compose up

stop:
	docker-compose down