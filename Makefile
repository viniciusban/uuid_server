VERSION ?= missing

container = uuid-server
image = viniciusban/uuid-server

.PHONY: help, build, latest, run, stop

help:
	@echo 'Usage:'
	@echo '  Run container using image VERSION and current source code with auto-reload enabled.'
	@echo '    $$ make run VERSION=latest'
	@echo '  Stop'
	@echo '    $$ make stop'
	@echo '  Build image VERSION'
	@echo '    $$ make build VERSION=240831'
	@echo '  Tag image VERSION as latest'
	@echo '    $$ make latest VERSION=240831'
	@echo ' '
	@echo 'Version format:'
	@echo '  Regular version: YYMMDD - 240831'
	@echo '  Patch version: YYMMDD.P - 240831.1'

build:
	docker image build -t ${image}:${VERSION} .

latest:
	docker image tag ${image}:${VERSION} ${image}:latest

run:
	docker container run --rm --name ${container} \
		-p 8080:80 \
		-v ${PWD}/app:/code/app \
		${image}:${VERSION} \
		fastapi run --reload app/main.py --port 80

stop:
	docker container stop ${container}