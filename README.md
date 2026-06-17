# Latex Docker Image

> Simple Dockerfile to build LaTeX projects.

It supports all features from texlive-full, make and pandoc.

## Requirements

* Build your LaTeX project with `make`
* Or override the docker `CMD`

### Getting Started

```
docker pull lmoelse/latex

docker run -d -v /path/to/latex/project:/app lmoesle/latex

# Count Words with texcount
docker run -it -v /path/to/latex/project:/app/ lmoesle/latex texcount.pl your-texfile.tex
```

### Development

```bash
docker build . -t lmoesle/latex:latest
docker push lmoesle/latex:latest
```
