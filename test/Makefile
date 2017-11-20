include ../utils/Makefile.help
include ../utils/Makefile.functions

NAME := gitea

test: setup ##@targets Starts test containers.
	docker-compose -p $(NAME) -f test.yaml up
.PHONY: up

stop: ##@targets Stops test containers.
	docker-compose -p $(NAME) -f test.yaml stop

rm: stop ##@targets Stops test containers.
	docker-compose -p $(NAME) -f test.yaml rm -f

clean: stop rm ##@targets Removes docker containers and created files.
	sudo rm -rf root

setup:
	mkdir -p root/gitea
	chmod o+rwX root/gitea
	mkdir -p root/postgres
	chmod o+rwX root/postgres
.PHONY: setup
