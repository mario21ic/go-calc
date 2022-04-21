FROM golang:1.17-alpine AS builder 
RUN apk add git
WORKDIR /app
COPY ./ ./
RUN go mod download
RUN go build -o go-calc
 
FROM scratch
COPY --from=builder /app/go-calc /go-calc
#CMD ["/go-calc"]
ENTRYPOINT ["/go-calc"]
