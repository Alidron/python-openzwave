FROM alidron/rpi-alidron-base-python:2
MAINTAINER Axel Voitier <axel.voitier@gmail.com>

RUN apt-get install -y libudev-dev python-dev wget
RUN pip install cython==0.14 # louie

WORKDIR /usr/src
RUN wget http://bibi21000.no-ip.biz/python-openzwave/python-openzwave-0.2.6.tgz \
 && tar zxvf python-openzwave-0.2.6.tgz \
 && cd python-openzwave-0.2.6 \
 && wget --no-check-certificate https://github.com/OpenZWave/open-zwave/archive/v1.3.tar.gz \
 && tar zxvf v1.3.tar.gz \
 && rm -R openzwave \
 && mv open-zwave-1.3 openzwave \
 && cd openzwave/cpp/build \
 && make vers.cpp \
 && cd ../src \
 && sed -i "s/ozw_vers_revision = ;/ozw_vers_revision = 730;/" vers.cpp \
 && cd ../.. \
 && make -j $(nproc) \
 && cd .. \
 && python setup-lib.py build \
 && python setup-api.py build \
 && ./install.sh
