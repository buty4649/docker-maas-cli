# syntax=docker/dockerfile:1

FROM ubuntu:jammy

ENV MAAS_VERSION=3.3

RUN <<COMMAND
  apt-get update
  DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

  apt-add-repository -y ppa:maas/${MAAS_VERSION}
  apt-get update
  DEBIAN_FRONTEND=noninteractive apt-get install -y maas-cli python3-openssl

  apt-get clean all
  rm -rf /var/lib/apt/lists/*
COMMAND

COPY docker-entrypoint.sh maas-shell /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh /usr/local/bin/maas-shell

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/local/bin/maas-shell" ]
