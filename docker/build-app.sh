#!/bin/bash

#set -ex
set -e

cd /opt
make build

debug "==> Building server success..."