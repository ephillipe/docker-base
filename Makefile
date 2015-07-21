TAG=$(shell git rev-parse --abbrev-ref HEAD)
IMAGE=docker-base:$(TAG)
REPOSITORY=ephillipe/$(IMAGE)

build:
	docker build -t $(IMAGE) --rm .
release: build push

push:
	docker tag $(TAG) $(REPOSITORY)
	docker push $(REPOSITORY)

bash:
	docker run -it $(IMAGE) bash
