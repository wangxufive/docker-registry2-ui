#!/bin/bash

set -ex

NODEJS_VERSION=6.1.0
NPM_VERSION=3.8.6

info "==> Installing dependencies..." \
&& apk add --virtual build-deps \
  curl make gcc g++ python paxctl \
  musl-dev openssl-dev zlib-dev \
  linux-headers binutils-gold \
&& mkdir nodejs \
&& cd nodejs \
&& info "==> Downloading..." \
&& curl -sSL -o node.tar.gz http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz \
&& info "==> Extracting..." \
&& tar -xzf node.tar.gz \
&& cd node-* \
&& info "==> Configuring..." \
&& readonly NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || echo 1) \
&& echo "using upto $NPROC threads" \
&& ./configure --prefix=/usr --shared-openssl --shared-zlib \
&& info "==> Building..." \
&& make -j${NPROC} -C out mksnapshot \
&& paxctl -c -m out/Release/mksnapshot \
&& make -j${NPROC} \
&& info "==> Installing..." \
&& make install \
&& info "==> Finishing..." \
&& apk del build-deps \
&& apk add openssl libgcc libstdc++ \
&& info "==> Updating NPM..." \
&& npm i -g npm@${NPM_VERSION} \
&& info "==> Cleaning up..." \
&& npm cache clean \
&& rm -rf ~/.node-gyp /tmp/* \
&& rm -rf nodejs \
&& rm -rf /var/cache/apk/*
