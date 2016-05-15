#!/bin/sh

#set -ex
set -e

debug() { printf '\n--\n%s\n--\n\n' "$*"; }

debug "==> Start building..."
/sbin/apk update
/sbin/apk add bash git

debug "==> Starting build nodejs..." \
&& source ./docker/build-node.sh \
&& debug "==> Starting build front..." \
&& source ./docker/build-ui.sh \
&& debug "==> Starting build server..." \
&& source ./docker/build-app.sh \
&& debug "==> Building success..."
