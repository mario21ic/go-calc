# go-calc
Files to practice golang

## On localhost

Dependencies:
```
make deps
```

Lint:
```
make lint
```

Tests:
```
make tests
```

Build:
```
make build
```

Docker:
```
make docker
```


## Using Docker

Docker Image Build:
```
./docker-image-build.sh
```

Dependencies:
```
./deps-con-docker.sh
```

Lint:
```
./lint-con-docker.sh
```

Tests:
```
./tests-con-docker.sh
```

Build:
```
./build-con-docker.sh
```

Optional: building docker image with Wolfi OS
```
docker build -t mario21ic:go-calc:wolfi -f Dockerfile_wolfi .
```

Apko:
```
docker run -v $PWD:/work cgr.dev/chainguard/apko build apko-go-calc.yaml mario21ic/go-calc:apko go-calc.tar
```

Melange:
```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build melange-go-calc.yaml
```
