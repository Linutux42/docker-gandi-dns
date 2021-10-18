FROM debian:bullseye-slim

COPY entrypoint.sh /

RUN apt-get update \
  && apt-get install -y curl \
  && rm -rf /var/lib/apt/lists/*

ENV GANDI_DOMAIN ""
ENV GANDI_RECORD ""
ENV GANDI_APIKEY ""

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
