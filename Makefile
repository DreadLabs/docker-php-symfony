#
# Makefile for dreadlabs/php-symfony
#
# @see http://www.itnotes.de/docker/development/tools/2014/08/31/speed-up-your-docker-workflow-with-a-makefile/
# @see http://stackoverflow.com/a/10858332
#

FLAVOUR ?= base
FILE = Dockerfile
NS = dreadlabs

REPO = php-symfony

NAME = php-symfony
INSTANCE = default

CONTEXT = .

.PHONY: build shell release versions start stop rm check-env

check-env:
ifndef VERSION
	$(error VERSION is undefined)
endif

build: check-env
	docker build --file $(VERSION)/$(FLAVOUR)/$(FILE) -t $(NS)/$(REPO):$(VERSION)-$(FLAVOUR) $(CONTEXT)/$(VERSION)/$(FLAVOUR)

push: check-env
	docker push $(NS)/$(REPO):$(VERSION)-$(FLAVOUR)

shell: check-env
	docker run --rm --name $(NAME)-$(FLAVOUR)-$(INSTANCE) --interactive --tty $(NS)/$(REPO):$(VERSION)-$(FLAVOUR) /bin/bash

start: check-env
	docker run -d --name $(NAME)-$(FLAVOUR)-$(INSTANCE) $(NS)/$(REPO):$(VERSION)-$(FLAVOUR)

stop:
	docker stop $(NAME)-$(FLAVOUR)-$(INSTANCE)

rm:
	docker rm $(NAME)-$(FLAVOUR)-$(INSTANCE)

release: check-env
	make push -e VERSION=$(VERSION)

versions:
	docker images | grep $(NS)/$(REPO)

versions-avail:
	@ls -d1 */ | grep -v doc

default: build
