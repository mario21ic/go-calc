#!/bin/bash

CGO_ENABLED=0 go build \
    -installsuffix 'static' \
    -o ./build/go-calc ./

