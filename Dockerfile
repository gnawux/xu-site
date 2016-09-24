FROM ubuntu:xenial
MAINTAINER gnawux@gmail.com
RUN apt-get update; apt-get -y install git
COPY caddy /srv/
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

