#!/bin/bash

/sbin/apk --no-cache add git make
make build
/sbin/apk del git make

debug "==> Building server success..."