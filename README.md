Python-openzwave for Alidron
============================

[![build status](https://git.tinigrifi.org/ci/projects/5/status.png?ref=master)](https://git.tinigrifi.org/ci/projects/5?ref=master)

This repository contains dockerfiles to build Alidron flavoured version of python-openzwave.

The dockerfiles inherit alidron-isac image. The built process il also customized to minimize the size of the resulting image.

The Docker images are accessibles on:
* x86: [alidron/python-openzwave:master](https://hub.docker.com/r/alidron/python-openzwave/)
* ARM/Raspberry Pi: [alidron/rpi-python-openzwave:master](https://hub.docker.com/r/alidron/rpi-python-openzwave/)

Dockerfiles are accessible from the Github repository:
* x86: [Dockerfile](https://github.com/Alidron/python-openzwave/blob/master/python-openzwave:master/Dockerfile)
* ARM/Raspberry Pi: [Dockerfile](https://github.com/Alidron/python-openzwave/tree/master/rpi-python-openzwave:master/Dockerfile)


License and contribution policy
===============================

Python-openzwave itself is licensed under GPLv3.

This project (mainly the build files and resulting docker images) is licensed under LGPLv3.

To contribute, please, follow the [C4.1](http://rfc.zeromq.org/spec:22) contribution policy.


