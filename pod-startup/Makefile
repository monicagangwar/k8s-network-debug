all: build push deploy launch clean watch logs

NAME := pod-startup
DOCKERREPO := monicagangwar/k8s-network-debug:$(NAME)

build:
	docker build -t $(DOCKERREPO) .

push:
	docker login
	docker push $(DOCKERREPO)

deploy:
	DOCKERREPO=$(DOCKERREPO) envsubst < cronjob.yml.tpl > cronjob.yml
	kubectl create -f cronjob.yml
	kubectl get pods -l project=$(NAME) -w

watch:
	kubectl get pods -l project=$(NAME) -w

launch: build push deploy

clean:
	kubectl delete -f cronjob.yml

logs:
	kubectl logs -f -l project=$(NAME)