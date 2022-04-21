#!/bin/bash
# usage: tag_name

tag="latest"
if [ ! -z "$1" ]; then
    tag=$1
fi
docker build -t mario21ic/go-calc:$tag .
