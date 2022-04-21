#!/bin/bash
set -e

#go test -v -cover
#go test -v -cover -race -covermode=atomic
go test -v -cover -race -covermode=atomic -coverprofile=coverage.out $1 -coverpkg=./...
go tool cover -func coverage.out
