#!/bin/sh

set -ex

/sbin/apk update \
&& /sbin/apk add bash git \
&& go get -u -v github.com/tools/godep \
&& info(){ printf '\n--\n%s\n--\n\n' "$*"; }

source ./build-node.sh
source ./build-ui.sh
source ./build-app.sh
