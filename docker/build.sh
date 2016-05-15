#!/bin/sh

#set -ex
set -e

debug() { printf '\n--\n%s\n--\n\n' "$*"; }

debug "==> Start building..."
/sbin/apk update
/sbin/apk add bash git

debug "==> Starting build nodejs..." \
&& exec ./docker/build-node.sh \
&& debug "==> Starting build front..." \
&& exec ./docker/build-ui.sh \
&& debug "==> Starting build server..." \
&& exec ./docker/build-app.sh
