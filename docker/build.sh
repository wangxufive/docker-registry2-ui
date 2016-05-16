#!/bin/sh

#set -ex
set -e

debug() { printf '\n--\n%s\n--\n\n' "$*"; }

debug "==> Start building..."
/sbin/apk update
/sbin/apk --no-cache add bash

debug "==> Starting build nodejs..." \
&& source /opt/docker/build-node.sh \
&& echo `pwd` \
&& debug "==> Starting build front..." \
&& source /opt/docker/build-ui.sh \
&& echo `pwd` \
&& debug "==> Starting build server..." \
&& source /opt/docker/build-app.sh \
&& debug "==> Building success..."
