# Latex Docker Image

> Simple Dockerfiles to build LaTeX projects.

The default `Dockerfile` installs `texlive-full`, `make`, and `pandoc`.

`Dockerfile.slim` provides a smaller image with `make`, `pandoc`, `pdflatex`, `xelatex`, `lualatex`, common LaTeX packages, recommended fonts, and only English/German TeX Live language packages.

## Requirements

* Build your LaTeX project with `make`
* Or override the docker `CMD`

### Getting Started

```
docker pull lmoelse/latex:slim
# use the full image if you need texlive-full
docker pull lmoelse/latex:full

docker run -d -v /path/to/latex/project:/app lmoesle/latex

# Count Words with texcount
docker run -it -v /path/to/latex/project:/app/ lmoesle/latex texcount.pl your-texfile.tex
```

### Development

```bash
docker buildx create --use
docker buildx inspect --bootstrap

docker buildx build \
  --file Dockerfile.slim \
  --platform linux/amd64,linux/arm64 \
  -t lmoesle/latex:slim \
  -t lmoesle/latex:latest \
  --push .
docker buildx build \
  --file Dockerfile \
  --platform linux/amd64,linux/arm64 \
  -t lmoesle/latex:full \
  --push
```

If the slim image misses a package used by a document, add the corresponding Debian `texlive-*` package to `Dockerfile.slim` instead of switching back to `texlive-full`.
