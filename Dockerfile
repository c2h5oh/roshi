FROM golang:1.9-alpine as builder

ENV ROSHI_VERSION 0.0.3

RUN apk add --no-cache ca-certificates wget make

RUN mkdir -p /go/src/github.com/c2h5oh && \
    cd /go/src/github.com/c2h5oh && \
    wget -O roshi.tar.gz "https://github.com/c2h5oh/roshi/archive/v$ROSHI_VERSION.tar.gz" && \
    tar -zxf roshi.tar.gz && \
    mv roshi-$ROSHI_VERSION /go/src/github.com/c2h5oh/roshi && \
    cd /go/src/github.com/c2h5oh/roshi && \
    GOBIN=/bin make

FROM alpine

COPY --from=builder /bin/roshi-server /bin/
COPY --from=builder /bin/roshi-walker /bin/

EXPOSE 6302



