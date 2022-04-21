VERSION 0.6

FROM golang:1.17-alpine
RUN apk --update --no-cache add git
WORKDIR /app

all:
    BUILD +lint
    BUILD +build
    BUILD +docker

deps:
    COPY go.mod go.sum ./
    COPY lib ./lib
    RUN ls -la
    RUN go mod download
    # Output these back in case go mod download changes them
    SAVE ARTIFACT go.mod AS LOCAL go.mod
    SAVE ARTIFACT go.sum AS LOCAL go.sum

lint:
    FROM +deps
    COPY main.go ./
    RUN go vet ./...

# Requiere go-1.17
staticcheck:
    FROM +deps
    RUN go install honnef.co/go/tools/cmd/staticcheck@latest
    COPY main.go ./
    RUN staticcheck ./...

build:
    FROM +deps
    #FROM ./services/service-one+deps
    #FROM my_service+deps
    ARG version
    RUN echo $version > version.txt
    # Requiere go-1.17
    #ENV GOOS=darwin
    #ENV GOARCH=arm64
    COPY main.go ./
    RUN go build -o build/go-example-$version main.go
    SAVE ARTIFACT build/go-example-$version /go-example AS LOCAL build/go-example
    SAVE ARTIFACT version.txt AS LOCAL build/version.txt

docker:
    FROM scratch # Sin base
    ARG tag='latest'
    BUILD +build # save file
    COPY +build/go-example .
    ENTRYPOINT ["/go-example/go-example"]
    SAVE IMAGE --push mario21ic/go-calc:$tag

with-build:
    BUILD +docker --tag='my-new-image-tag'

with-from:
    FROM +docker --tag='my-new-image-tag'

with-copy:
    COPY (+build/go-example --version='1.0') .

# Example of docker in docker
my-hello-world:
    FROM ubuntu
    CMD echo 'my hello world'
    SAVE IMAGE my-hello:latest
hello:
    FROM earthly/dind:alpine
    WITH DOCKER --pull hello-world
    #WITH DOCKER --load hello:latest=+my-hello-world
    #WITH DOCKER --load hello-world:latest=+my-hello-world
        RUN docker run hello-world:latest
    END

