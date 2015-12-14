FROM alidron/rpi-alidron-base-python:2
MAINTAINER Axel Voitier <axel.voitier@gmail.com>

RUN apt-get update && apt-get install -y build-essential libudev-dev g++ make python-dev

WORKDIR /usr/src
RUN apt-get install -y wget unzip \
 && wget --no-check-certificate https://github.com/OpenZWave/python-openzwave/archive/master.zip \
 && unzip master.zip
 
WORKDIR /usr/src/python-openzwave-master
RUN make arch-deps
RUN apt-get install -y git
RUN make openzwave
RUN make cython-deps
RUN pip install cython
RUN mkdir .git
RUN cd src-api/openzwave \
 && sed -i "s/monkey.patch_all()/#monkey.patch_all()/" *.py
RUN make build \
 && make install
 
ENV PYOZW_VERSION=master
