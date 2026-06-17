FROM debian:bookworm-slim

ENV LANG=en_US.utf8
ENV TZ=Europe/Berlin

ARG USER_NAME=app
ARG USER_HOME=/app
ARG USER_ID=1000

RUN groupadd "$USER_NAME" && useradd -m -u "$USER_ID" -d "$USER_HOME" -g "$USER_NAME" "$USER_NAME"

USER 1000

USER root

RUN apt-get -o Acquire::Retries=3 -o APT::Update::Error-Mode=any update \
    && apt-get install -y texlive-full build-essential make wget unzip pandoc \
    && rm -rf /var/lib/apt/lists/*

# texcount
WORKDIR /
RUN wget -q -O texcount.zip mirrors.ctan.org/support/texcount.zip && unzip texcount.zip && rm texcount.zip && chmod 755 texcount/texcount.pl
ENV PATH="$PATH:/texcount"

USER 1000
WORKDIR /app

CMD ["make"]
