FROM debian:bullseye-20230320-slim

LABEL org.opencontainers.image.title="RTSP MongoDB Shell"
LABEL org.opencontainers.image.authors="RTSP <docker@rtsp.us>"
LABEL org.opencontainers.image.source="https://github.com/rtsp/docker-mongosh"
LABEL org.opencontainers.image.licenses="Apache-2.0"

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
    wget \
    && rm -rvf /var/lib/apt/lists/*

ARG MONGODB_VERSION=6.0
ARG MONGOSH_VERSION=1.8.0

RUN set -x \
    && curl -fsSL https://www.mongodb.org/static/pgp/server-${MONGODB_VERSION}.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-org-${MONGODB_VERSION}.gpg \
    && echo "deb https://repo.mongodb.org/apt/debian bullseye/mongodb-org/${MONGODB_VERSION} main" > /etc/apt/sources.list.d/mongodb-org-${MONGODB_VERSION}.list

ARG TARGETPLATFORM

RUN set -x && apt-get update && apt-get --yes --no-install-recommends install \
    mongodb-mongosh=${MONGOSH_VERSION} \
    $( [ "$TARGETPLATFORM" = "linux/amd64" ] && echo mongodb-database-tools) \
    && rm -rvf /var/lib/apt/lists/*

COPY files/ /root/

CMD ["/bin/sleep", "infinity"]
