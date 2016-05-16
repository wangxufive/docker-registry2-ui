#!/bin/bash

# Set temp environment vars
export PATH=${PATH}:${GOPATH}/bin

# Init go environment to build Gogs
mkdir -p ${GOPATH}/src/github.com/wangxufire/
ln -s /opt/docker-registry2-ui/ ${GOPATH}/src/github.com/wangxufire/docker-registry2-ui
cd ${GOPATH}/src/github.com/wangxufire/docker-registry2-ui

make build

debug "==> Building server success..."