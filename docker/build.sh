#!/bin/bash

#set -ex
set -e

debug() { printf '\n--\n%s\n--\n\n' "$*"; }

debug "==> Start building..."

debug "==> Starting install nodejs..."
source /opt/docker-registry2-ui/docker/build-node.sh

debug "==> Starting build server..."
source /opt/docker-registry2-ui/docker/build-app.sh

debug "==> Starting build front..."
source /opt/docker-registry2-ui/docker/build-ui.sh

debug "==> Building success..."
