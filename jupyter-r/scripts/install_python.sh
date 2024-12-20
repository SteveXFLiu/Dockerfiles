#!/bin/bash

set -e -x

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

# Install dependencies
apt_install \
    curl \
    software-properties-common

# Add PPA
add-apt-repository ppa:deadsnakes/ppa

# Install Python
apt_install python${PYTHON_VERSION:-3.10}

# Set default Python version
ln -sf /usr/bin/python${PYTHON_VERSION:-3.10} /usr/bin/python3

# Install and upgrade pip
apt_install python${PYTHON_VERSION:-3.10}-distutils
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python${PYTHON_VERSION:-3.10} get-pip.py
python3 -m pip install --upgrade pip

# Install Python packages
python3 -m pip install --no-cache-dir -r /init_scripts/requirements.txt

# Clean up
rm get-pip.py
rm -rf /var/lib/apt/lists/*