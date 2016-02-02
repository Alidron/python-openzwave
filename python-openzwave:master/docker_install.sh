# Copyright (c) 2015-2016 Contributors as noted in the AUTHORS file
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

#!/bin/sh

set -e

buildDeps='
g++
gcc
libudev-dev
make
sudo
unzip
wget
'
 
apt-get update
apt-get install -y --no-install-recommends $buildDeps

pip install --no-cache-dir louie cython==0.21.1

cd /tmp
wget https://github.com/OpenZWave/python-openzwave/archive/master.zip
unzip master.zip
cd /tmp/python-openzwave-master
mkdir .git # Necessary if you don't want to see a weird error about .pyx files when doing make install...

wget https://github.com/OpenZWave/open-zwave/archive/master.zip
unzip master.zip
mv open-zwave-master openzwave

make build
make install
mkdir -p /usr/share/openzwave
cp -R openzwave/config /usr/share/openzwave

find /usr/local \( -type d -a -name test -o -name tests \) -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' +
export SUDO_FORCE_REMOVE=yes
apt-get purge -y --auto-remove $buildDeps
rm -rf /var/lib/apt/lists/*
rm -rf /root/.cache/pip

cd /tmp
rm master.zip
rm -R python-openzwave-master
