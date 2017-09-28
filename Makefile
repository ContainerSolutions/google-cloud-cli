NAME   := containersol/google-cloud-cli
TAG    := $(shell git log -1 --pretty=%H)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest

image:
	@docker build -t ${IMG} .
	@docker tag ${IMG} ${LATEST}

push:
	@docker push ${IMG}
	@docker push ${LATEST}

login:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}

release: image login push

run:
	@docker run \
		--rm \
		-v ${PWD}/config:/root/.config \
		-v ${PWD}/kube:/root/.kube \
		-v ${PWD}:/usr/src/code \
		-it ${IMG} bash

proxy:
	@docker run \
		--rm \
		-v ${PWD}/config:/root/.config \
		-v ${PWD}/kube:/root/.kube \
		-p 8001:8001 \
		-it ${NAME} kubectl proxy --accept-hosts '^.+$$' --address 0.0.0.0
