#!/bin/bash

PASSWORD=password

if [ $# -ge 1 ] ; then
	if [ "x$1" != "x${1#/}"  ] ; then
		exec "$@"
	fi
	PASSWORD=$1
fi

cat > srv/Caddyfile <<-ENDFILE
wangsiyi.net {
        gzip
        root wangsiyi.net
        git {
                repo https://github.com/gnawux/wangsiyi.net
                branch gh-pages
                hook /update ${PASSWORD}
                hook_type github
                interval -1
        }
}
wangxu.me {
        gzip
        root wangxu.me
        git {
                repo https://github.com/gnawux/gnawux.github.io
                hook /update ${PASSWORD}
                hook_type github
                interval -1
        }
}
ENDFILE


cd srv

sleep 3 # wait everything ready
nohup ./caddy -agree -email gnawux@gmail.com -host wangxu.me &

