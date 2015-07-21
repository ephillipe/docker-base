TAG=$(shell git rev-parse --abbrev-ref HEAD)
IMAGE=ubuntu:$(TAG)
REPOSITORY=ephillipe/$(IMAGE)

build:
	docker build -t $(IMAGE) --rm .
release: build push

push:
	docker tag $(TAG) $(IMAGE)
	docker push $(IMAGE)

bash:
	docker run -it $(IMAGE) bash
