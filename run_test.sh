#!/bin/bash
set -e

go test -v $1 -coverpkg=./...

#go test -v -cover -race -covermode=atomic -coverprofile=coverage.out $1 -coverpkg=./...
#go tool cover -func coverage.out
