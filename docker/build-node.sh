#!/bin/bash

NODEJS_VERSION=6.1.0
NPM_VERSION=3.8.6

/sbin/apk --no-cache add tar wget \
&& debug "==> Downloading..." \
&& wget -O node.tar.xz http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.xz \
&& debug "==> Extracting..." \
&& tar -xJf "node.tar.xz" -C /usr --strip-components=1 \
&& debug "==> Cleaning up..." \
&& /sbin/apk del wget \
&& /bin/rm -f node.tar.xz \
&& /bin/rm -rf /var/cache/apk/* \
&& debug "==> Building nodejs success..."
