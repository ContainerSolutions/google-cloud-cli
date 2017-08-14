NAME := containersolutions/google-cloud-cli
TAG  := $$(git log -1 --pretty=%H)
IMG  := ${NAME}:${TAG}

image:
	@docker build -t ${IMG} .

run:
	@docker run \
		--rm \
		-v ${PWD}/config:/root/.config \
		-v ${PWD}/kube:/root/.kube \
		-it ${IMG}

proxy:
	@docker run \
		--rm \
		-v ${PWD}/config:/root/.config \
		-v ${PWD}/kube:/root/.kube \
		-p 8001:8001 \
		--entrypoint /usr/bin/kubectl \
		-it ${NAME} proxy --accept-hosts '^.+$$' --address 0.0.0.0

push-image:
	@docker push ${IMG}
	@docker push ${NAME}:latest

tag-latest:
	@docker tag ${IMG} ${NAME}:latest

release: image push-image
