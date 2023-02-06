FROM debian:bullseye-slim

COPY entrypoint.sh /

# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get install -y curl ca-certificates --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

ENV GANDI_DOMAIN ""
ENV GANDI_RECORD ""
ENV GANDI_APIKEY ""

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
