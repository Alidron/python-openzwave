FROM alidron/alidron-base-python:3
MAINTAINER Axel Voitier <axel.voitier@gmail.com>

RUN apt-get update && apt-get install -y build-essential libudev-dev g++ make # python3-dev
#RUN pip install cython==0.14 # louie

WORKDIR /usr/src
RUN git clone https://github.com/bibi21000/python-openzwave \
 && cd python-openzwave \
 && make tests-deps \
 && make update \
 && make build \
 && make install
