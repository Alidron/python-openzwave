FROM alidron/alidron-base-python:2
MAINTAINER Axel Voitier <axel.voitier@gmail.com>

RUN apt-get update && apt-get install -y build-essential libudev-dev g++ make python-dev

WORKDIR /usr/src
RUN wget https://github.com/OpenZWave/python-openzwave/archive/master.zip \
 && apt-get install unzip \
 && unzip master.zip
 
WORKDIR /usr/src/python-openzwave-master
RUN make arch-deps
RUN make openzwave
RUN make cython-deps
RUN pip install cython
RUN mkdir .git
RUN cd src-api/openzwave \
 && sed -i "s/monkey.patch_all()/#monkey.patch_all()/" *.py
RUN make build \
 && make install
 
ENV PYOZW_VERSION=master
