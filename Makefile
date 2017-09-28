NAME := containersol/google-cloud-cli
TAG  := $$(git log -1 --pretty=%H)
IMG  := ${NAME}:${TAG}

image:
	@docker build -t ${IMG} .

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

push-image:
	@docker push ${IMG}
	@docker push ${NAME}:latest

tags:
	@docker tag ${IMG} ${NAME}:latest

release: image tags push-image
