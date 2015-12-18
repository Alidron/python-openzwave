# Copyright 2015 - Alidron's authors
#
# This file is part of Alidron.
# 
# Alidron is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Alidron is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public License
# along with Alidron.  If not, see <http://www.gnu.org/licenses/>.

#!/bin/sh

set -e

buildDeps='
g++
gcc
libudev-dev
make
unzip
wget
'
 
apt-get update
apt-get install -y --no-install-recommends $buildDeps

pip install louie cython==0.21.1

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
apt-get purge -y --auto-remove $buildDeps
rm -rf /var/lib/apt/lists/*
rm -rf /root/.cache/pip

cd /tmp
rm master.zip
rm -R python-openzwave-master
