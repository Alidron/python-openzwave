image_name = alidron/python-openzwave:0.2.6-test

.PHONY: clean clean-dangling build run-bash

clean:
	docker rmi $(image_name) || true

clean-dangling:
	docker rmi $(docker images -q -f dangling=true) || true

build: clean-dangling
	docker build --force-rm=true -t $(image_name) .

run-bash:
	docker run -it --rm $(image_name) bash

