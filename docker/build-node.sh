#!/bin/bash

#set -ex
set -e

NODEJS_VERSION=6.1.0
NPM_VERSION=3.8.6

debug() { printf '\n--\n%s\n--\n\n' "$*"; }

debug "==> Installing dependencies..." \
&& /sbin/apk add --virtual build-deps \
  make gcc g++ python paxctl \
  musl-dev openssl-dev zlib-dev \
  linux-headers binutils-gold wget \
&& /bin/mkdir nodejs \
&& cd nodejs \
&& debug "==> Downloading..." \
&& wget -O node.tar.gz http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz \
&& debug "==> Extracting..." \
&& /bin/tar -zxf node.tar.gz \
&& cd node-* \
&& debug "==> Configuring..." \
&& readonly NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || echo 1) \
&& /bin/echo "using upto $NPROC threads" \
&& ./configure --prefix=/usr --shared-openssl --shared-zlib \
&& debug "==> Building..." \
&& make -j${NPROC} -C out mksnapshot \
&& paxctl -c -m out/Release/mksnapshot \
&& make -j${NPROC} \
&& debug "==> Installing..." \
&& make install \
&& debug "==> Finishing..." \
&& /sbin/apk del build-deps \
&& /sbin/apk add libgcc libstdc++ \
&& debug "==> Updating NPM..." \
&& npm i -g npm@${NPM_VERSION} \
&& debug "==> Cleaning up..." \
&& npm cache clean \
&& /bin/rm -rf ~/.node-gyp /tmp/* \
&& /bin/rm -rf nodejs \
&& /bin/rm -rf /var/cache/apk/*
