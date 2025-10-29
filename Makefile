all: c++ golang

c++:
	docker build ./c++ -t notkaramel/grpc-c++:latest

golang:
	docker build ./golang -t notkaramel/grpc-golang:latest


# Project variables
APP_NAME := myapp
TAG := latest
IMAGE := $(APP_NAME):$(TAG)
CONTAINER := $(APP_NAME)-container

# Default target
.PHONY: all
all: build

# Build the Docker image
.PHONY: build
build:
	docker build -t $(IMAGE) .

# Run the container (detached)
.PHONY: run
run:
	docker run -d --name $(CONTAINER) -p 8080:8080 $(IMAGE)

# Run interactively (useful for debugging)
.PHONY: run-interactive
run-interactive:
	docker run -it --rm -p 8080:8080 $(IMAGE)

# Stop and remove the container
.PHONY: stop
stop:
	docker stop $(CONTAINER) || true
	docker rm $(CONTAINER) || true

# Remove the image
.PHONY: clean
clean:
	docker rmi $(IMAGE) || true

# Show images and containers for debugging
.PHONY: ps
ps:
	docker ps -a
	docker images | grep $(APP_NAME) || true

# Build and run in one command
.PHONY: up
up: build run

# Stop and clean everything
.PHONY: down
down: stop clean
