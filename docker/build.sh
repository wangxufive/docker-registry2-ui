#!/bin/bash

#set -ex
set -e

debug() { printf '\n--\n%s\n--\n\n' "$*"; }

debug "==> Start building..."

debug "==> Starting install nodejs..."
source /opt/docker/build-node.sh

debug "==> Starting build front..."
source /opt/docker/build-ui.sh

debug "==> Starting build server..."
source /opt/docker/build-app.sh

debug "==> Building success..."
