FROM ubuntu:xenial
MAINTAINER gnawux@gmail.com
RUN apt-get update &&\
		 apt-get -y install git && \
         apt-get clean && \
         rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY caddy /srv/
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

