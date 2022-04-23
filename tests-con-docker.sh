#!/bin/bash

docker run --rm -v $PWD:/app -w /app mario21ic/go-calc:build ./run_test.sh lib/math_test.go
