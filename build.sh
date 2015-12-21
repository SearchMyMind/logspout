#!/bin/sh



set -e
apk add --update go git mercurial --repository http://nl.alpinelinux.org/alpine/v3.2/main/ --allow-untrusted
mkdir -p /go/src/github.com/gliderlabs
cp -r /src /go/src/github.com/gliderlabs/logspout
cd /go/src/github.com/gliderlabs/logspout
export GOPATH=/go
go get
go build -ldflags "-X main.Version $1" -o /bin/logspout
apk del go git mercurial
rm -rf /go
rm -rf /var/cache/apk/*

# backwards compatibility
ln -fs /tmp/docker.sock /var/run/docker.sock
