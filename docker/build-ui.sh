#!/bin/bash

#set -ex
set -e

cd /opt/resources
/usr/bin/npm install
/usr/bin/npm run tsc
