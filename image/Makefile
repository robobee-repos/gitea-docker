REPOSITORY := robobeerun
NAME := gitea
VERSION ?= v1.3.0-rc1-r2-1

build: _build ##@targets Builds the docker image.

clean: _clean ##@targets Removes the local docker image.

deploy: _deploy ##@targets Deploys the docker image to the repository.

include ../utils/Makefile.help
include ../utils/Makefile.functions
include ../utils/Makefile.image

.PHONY +: build clean deploy
