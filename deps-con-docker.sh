#!/bin/bash

docker run --rm -v $PWD:/app -w /app mario21ic/go-calc:build go mod download
