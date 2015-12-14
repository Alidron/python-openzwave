image_name = alidron/rpi-python-openzwave:0.2.6
registry = neuron.local:6666

.PHONY: clean clean-dangling build push pull run-bash

clean:
	docker rmi $(image_name) || true

clean-dangling:
	docker rmi $(docker images -q -f dangling=true) || true

build: clean-dangling
	docker build --force-rm=true -t $(image_name) .
	docker tag -f $(image_name) $(registry)/$(image_name)

push:
	docker push $(registry)/$(image_name)

pull:
	docker pull $(registry)/$(image_name)
	docker tag $(registry)/$(image_name) $(image_name)

run-bash:
	docker run -it --rm $(image_name) bash

