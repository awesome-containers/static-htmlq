# https://github.com/awesome-containers/static-curl
ARG STATIC_CURL_VERSION=8.0.1
ARG STATIC_CURL_IMAGE=ghcr.io/awesome-containers/static-curl

FROM $STATIC_CURL_IMAGE:$STATIC_CURL_VERSION AS static-curl

# https://hub.docker.com/_/rust/tags
FROM docker.io/rust:1.69 AS build

# hadolint ignore=DL3008
RUN set -xeu; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        build-essential curl musl-dev musl-tools

# https://github.com/mgdm/htmlq
ARG HTMLQ_VERSION=0.4.0

WORKDIR /src/htmlq
RUN set -xeu; \
    curl -#Lo htmlq.tar.xz \
        "https://github.com/mgdm/htmlq/archive/refs/tags/v$HTMLQ_VERSION.tar.gz"; \
    tar -xvf htmlq.tar.xz --strip-components=1; \
    rm -f htmlq.tar.xz

ARG RUSTFLAGS='-C target-feature=+crt-static'
RUN set -xeu; \
    rustup target add x86_64-unknown-linux-musl; \
    cargo build --release --target x86_64-unknown-linux-musl

WORKDIR /src/htmlq/target/x86_64-unknown-linux-musl/release
RUN set -xeu; \
    strip -s -R .comment --strip-unneeded htmlq; \
    chmod -cR 755 htmlq; \
    chown -cR 0:0 htmlq; \
    ldd htmlq; \
    ./htmlq -V

# static htmlq image
FROM static-curl
COPY --from=build /src/htmlq/target/x86_64-unknown-linux-musl/release/htmlq /bin/
