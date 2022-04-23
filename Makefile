all: clean lint tests build docker


lint:
	go vet ./

deps:
	go mod download

build: deps
	./build.sh

tests: deps
	./run_test.sh lib/math_test.go

docker:
	./docker-build.sh

clean:
	rm -f ./build/*
