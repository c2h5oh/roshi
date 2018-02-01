GO ?= go

all: build-server build-walker

build-server:
	mkdir -p ./bin && \
	GOGC=off GOARCH=$(GOARCH) GOARM=$(GOARM) \
	go build -o ./bin/roshi-server roshi-server/main.go

build-walker:
	mkdir -p ./bin && \
	GOGC=off GOARCH=$(GOARCH) GOARM=$(GOARM) \
	go build -o ./bin/roshi-walker roshi-walker/main.go

build-docker:
	docker build --no-cache --build-arg BUILDARCH=arm --build-arg BUILDARM=7 --build-arg BASE_IMAGE=arm32v6/alpine:3.6 .
	docker build --no-cache --build-arg BUILDARCH=amd64 --build-arg BASE_IMAGE=alpine:3.6 .

clean:
	$(GO) clean
