# syntax=docker/dockerfile:1.2

# Copyright 2021 Authors of Cilium
# SPDX-License-Identifier: Apache-2.0

# BUILDPLATFORM is an automatic platform ARG enabled by Docker BuildKit.
# Represents the plataform where the build is happening, do not mix with
# TARGETARCH
FROM docker.io/library/node:18.0.0-slim@sha256:1bf5fec10be761b93909d1d3d1e6929b529284e322d6c5fa6cb304e3fb60e759
RUN npm install -g json-server \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y curl \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD run.sh default.json /
ENTRYPOINT ["bash", "/run.sh"]
CMD []
