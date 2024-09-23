VERSION ?= missing

container = uuid-server
image = viniciusban/uuid-server

.PHONY: help, build, dev, runimage, stop

help:
	@echo 'Usage:'
	@echo "  Run container for development. Current source code (not image's) with auto-reload enabled."
	@echo '    $$ make dev VERSION=1.0.0'
	@echo '  Run container using image VERSION.'
	@echo '    $$ make runimage VERSION=1.0.0'
	@echo '  Stop'
	@echo '    $$ make stop'
	@echo '  Build image VERSION'
	@echo '    $$ make build VERSION=1.1.0'

build:
	docker image build --no-cache -t ${image}:${VERSION} .

dev:
	docker container run --rm --name ${container} \
		-p 8080:80 \
		-v ${PWD}/app:/code/app \
		${image}:${VERSION} \
		fastapi run --reload app/main.py --port 80

runimage:
	docker container run --rm --name ${container} \
		-p 8080:80 \
		${image}:${VERSION}

stop:
	docker container stop ${container}