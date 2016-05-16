#!/bin/bash

debug "==> Set environment vars for building..."
export PATH=${PATH}:${GOPATH}/bin

debug "==> Init go environment..."
/bin/mkdir -p ${GOPATH}/src/github.com/wangxufire/
/bin/ln -s /opt/docker-registry2-ui/ ${GOPATH}/src/github.com/wangxufire/docker-registry2-ui
cd ${GOPATH}/src/github.com/wangxufire/docker-registry2-ui

debug "==> Building..."
/usr/local/go/bin/go get -t -v ./...
/usr/local/go/bin/go install -v ./...

debug "==> Copy bin to /opt..."
/bin/cp -a ${GOPATH}/src/github.com/wangxufire/docker-registry2-ui/docker-registry2-ui /opt

debug "==> Cleaning..."
/bin/rm -rf ${GOPATH}

debug "==> Building server success..."