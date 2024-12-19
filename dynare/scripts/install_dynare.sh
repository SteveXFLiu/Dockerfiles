#!/bin/bash

set -e -x

# A function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

apt_install dynare

apt-get autoremove -y
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*