FROM debian:bullseye-20210816-slim

LABEL org.opencontainers.image.title="RTSP MongoDB Shell ${MONGOSH_VERSION}"
LABEL org.opencontainers.image.authors="RTSP <docker@rtsp.us>"
LABEL org.opencontainers.image.source="https://github.com/rtsp/docker-mongosh"
LABEL org.opencontainers.image.licenses="Apache-2.0"

ARG MONGOSH_VERSION=5.0

RUN set -x && apt-get update && apt-get --yes --no-install-recommends install \
    bash \
    ca-certificates \
    coreutils \
    curl \
    diffutils \
    git \
    gnupg \
    grep \
    iputils-ping \
    jq \
    less \
    mawk \
    nano \
    openssl \
    rsync \
    sed \
    telnet \
    vim-tiny \
    wget

RUN set -x \
    && curl -fsSL https://www.mongodb.org/static/pgp/server-${MONGOSH_VERSION}.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-org-${MONGOSH_VERSION}.gpg \
    && echo "deb https://repo.mongodb.org/apt/debian buster/mongodb-org/${MONGOSH_VERSION} main" > /etc/apt/sources.list.d/mongodb-org-${MONGOSH_VERSION}.list

RUN set -x && apt-get update && apt-get --yes --no-install-recommends install \
    mongodb-mongosh \
    mongodb-database-tools \
    && rm -rvf /var/lib/apt/lists/*

COPY files/ /root/

CMD ["/bin/sleep", "365d"]
