# Se usa Makefile para Orquestar Bash Scripts

# Building
FROM golang:1.17-alpine AS builder
RUN apk --update --no-cache add git gcc make bash
WORKDIR /app

COPY ./ ./

# deps
RUN make deps

# lint
RUN make lint

# tests
RUN make tests

# build
RUN make build


# Runtime 
FROM scratch
COPY --from=builder /app/build/go-calc /go-calc
ENTRYPOINT ["/go-calc"]
