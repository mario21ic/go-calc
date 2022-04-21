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

    ARG TARGETPLATFORM
    RUN echo $TARGETPLATFORM
    ARG TARGETOS
    RUN echo $TARGETOS
    RUN echo $TARGETARCH
    RUN echo $TARGETVARIANT
    #IF [ $TARGETOS == "macos" ]
    #    ENV GOOS=darwin
    #    ENV GOARCH=arm64
    #END

    ARG USERPLATFORM
    RUN echo $USERPLATFORM
    ARG USEROS
    RUN echo $USEROS
    RUN echo $USERARCH
    RUN echo $USERVARIANT

    COPY main.go ./
    #RUN go build -o build/go-example-$version main.go
    RUN CGO_ENABLED=0 go build \
        -installsuffix 'static' \
        -o ./build/go-calc-$version main.go

    SAVE ARTIFACT build/go-calc-$version /go-calc AS LOCAL build/go-calc
    SAVE ARTIFACT version.txt AS LOCAL build/version.txt

docker:
    FROM scratch # Sin base
    ARG tag='latest'
    BUILD +build # save file
    COPY +build/go-calc /go-example/go-calc
    ENTRYPOINT ["/go-example/go-calc"]
    #CMD ["/go-example/go-calc"]
    SAVE IMAGE mario21ic/go-calc:$tag
    #SAVE IMAGE --push mario21ic/go-calc:$tag

with-build:
    BUILD +docker --tag='my-new-image-tag'

with-from:
    FROM +docker --tag='my-new-image-tag'

with-copy:
    COPY (+build/go-example --version='1.0') .

# Example of docker in docker
test-docker:
    FROM earthly/dind:alpine
    WITH DOCKER --load mario21ic/go-calc:latest=+docker
        RUN docker run mario21ic/go-calc:latest
    END

