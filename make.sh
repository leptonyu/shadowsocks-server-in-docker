## FROM golang:alpine

set -ex \
&& export DIR="$PWD" \
&& export SHADOWSOCKS_GO_VERSION=master \
&& export GOPATH=/go \
&& export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH \
&& apk add --no-cache --virtual shadowsocks-go-dependencies git \
&& mkdir -p "${GOPATH}/src" "${GOPATH}/bin" \
&& pkgroot=github.com/shadowsocks/go-shadowsocks2 \
&& git clone --branch "${SHADOWSOCKS_GO_VERSION}" https://${pkgroot}.git "${GOPATH}/src/${pkgroot}" \
&& export CGO_ENABLED=0 \
&& go get -a -ldflags '-s' -installsuffix nocgo ${pkgroot} \
&& mv "$GOPATH/bin/go-shadowsocks2" main
