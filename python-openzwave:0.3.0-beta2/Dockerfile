FROM alidron/alidron-base-python:2
MAINTAINER Axel Voitier <axel.voitier@gmail.com>

RUN apt-get update && apt-get install -y build-essential libudev-dev g++ make python-dev

WORKDIR /usr/src
RUN wget https://github.com/OpenZWave/python-openzwave/archive/v0.3.0-beta2.tar.gz \
 && tar zxvf v0.3.0-beta2.tar.gz
 
WORKDIR /usr/src/python-openzwave-0.3.0-beta2
RUN make arch-deps
RUN make openzwave
RUN make cython-deps
RUN pip install cython
RUN mkdir .git
RUN cd src-api/openzwave \
 && sed -i "s/monkey.patch_all()/#monkey.patch_all()/" *.py
RUN make build \
 && make install
 
ENV PYOZW_VERSION=0.3.0-beta2
