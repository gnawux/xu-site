#!/bin/bash

if [ ! -f caddy ] ; then
	wget -O - "https://caddyserver.com/download/build?os=linux&arch=amd64&features=git" | tar -xvf -
	rm -rf init *.txt
fi

sudo docker build -t "gnawux/blog:latest" .

