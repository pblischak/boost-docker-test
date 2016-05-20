## Creates a Docker image with a C++ program that links to the Boost C++ libraries

The resulting image is on Docker Hub: <a href="https://hub.docker.com/r/pblischak/boost-test/" target="_blank">pblischak/boost-test</a>.

Pull it within a Docker Quickstart Terminal

```
docker pull pblischak/boost-test
```

Then run it using `docker run`:

```
docker run -it pblischak/boost-test
```

This puts you in a bash environment where the `BoostTest` executable is available. Try running:

```
BoostTest -h
BoostTest -v 1234
```
