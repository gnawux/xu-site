#!/bin/bash

if [ ! -f caddy ] ; then
	wget -O - "https://caddyserver.com/download/build?os=linux&arch=amd64&features=git" | tar -zxvf -
	rm -rf init *.txt
fi

[ ! -f caddy ] && echo "caddy download failed" && exit 1

sudo docker build -t "gnawux/blog:latest" .

