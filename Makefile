GO ?= go
GOBIN ?= $(GOPATH)/bin

all: build-server build-walker

build-server:
	GOGC=off GOBIN=$(GOBIN) \
	go install -v ./roshi-server

build-walker:
	GOGC=off GOBIN=$(GOBIN) \
	go install -v ./roshi-walker

clean:
	$(GO) clean
