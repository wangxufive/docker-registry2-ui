#!/bin/bash

# Install build deps
/sbin/apk --no-cache --no-progress add --virtual build-deps go gcc musl-dev

# Set go environment vars
export GOPATH=/opt
export PATH=${PATH}:${GOPATH}/bin

# Init go environment for build
mkdir -p ${GOPATH}/src/github.com/wangxufire/
ln -s /opt/docker-registry2-ui/ ${GOPATH}/src/github.com/wangxufire/docker-registry2-ui
cd ${GOPATH}/src/github.com/wangxufire/docker-registry2-ui

make build

debug "==> Building server success..."