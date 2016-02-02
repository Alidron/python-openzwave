# Copyright (c) 2015-2016 Contributors as noted in the AUTHORS file
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

image_name = alidron/rpi-python-openzwave:master
private_registry = neuron.local:6667

.PHONY: clean clean-dangling build push pull push-priv pull-priv run-bash

clean:
	docker rmi $(image_name) || true

clean-dangling:
	docker rmi `docker images -q -f dangling=true` || true

build: clean-dangling
	docker build --force-rm=true -t $(image_name) .

push:
	docker push $(image_name)

pull:
	docker pull $(image_name)

push-priv:
	docker tag -f $(image_name) $(private_registry)/$(image_name)
	docker push $(private_registry)/$(image_name)

pull-priv:
	docker pull $(private_registry)/$(image_name)
	docker tag $(private_registry)/$(image_name) $(image_name)

run-bash:
	docker run -it --rm $(image_name) bash

