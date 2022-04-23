# Building
FROM golang:1.17-alpine AS builder
RUN apk --update --no-cache add git gcc make bash
#FROM golang:1.17 AS builder 
#RUN apt update && apt install -y git gcc make
WORKDIR /app

COPY ./ ./

# deps
#RUN go mod download # duplicado
RUN make deps

# lint
#RUN go vet ./
RUN make lint

# tests
#RUN go test -v lib/math_test.go -coverpkg=./... # duplicado
RUN make tests

# build
#RUN CGO_ENABLED=0 go build \
#    -installsuffix 'static' \
#    -o ./build/go-calc main.go # duplicado
RUN make build


# Runtime 
FROM scratch
COPY --from=builder /app/build/go-calc /go-calc
#CMD ["/go-calc"]
ENTRYPOINT ["/go-calc"]
