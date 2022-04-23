all: clean lint tests build docker


lint:
	go vet ./

deps:
	go mod download

tests: deps
	./run_test.sh lib/math_test.go

build: deps
	./build.sh

docker:
	./docker-build.sh

clean:
	rm -f ./build/*
