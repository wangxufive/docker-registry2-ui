#!/bin/bash

# Set temp environment vars
export PATH=${PATH}:${GOPATH}/bin

# Init go environment to build Gogs
/bin/mkdir -p ${GOPATH}/src/github.com/wangxufire/
/bin/ln -s /opt/docker-registry2-ui/ ${GOPATH}/src/github.com/wangxufire/docker-registry2-ui
cd ${GOPATH}/src/github.com/wangxufire/docker-registry2-ui

/usr/bin/make build

/bin/cp -a ${GOPATH}/src/github.com/wangxufire/docker-registry2-ui/docker-registry2-ui /opt

/bin/rm -rf ${GOPATH}

debug "==> Building server success..."