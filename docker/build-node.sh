#!/bin/bash

/usr/bin/curl -sL https://deb.nodesource.com/setup_6.x | bash - \
&& /usr/bin/apt-get install -y nodejs \
&& /bin/rm -rf /var/cache/*

debug "==> Installing nodejs success..."
