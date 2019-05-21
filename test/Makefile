include ../utils/Makefile.help
include ../utils/Makefile.functions

NAME := gitea

.PHONY: test
test: setup ##@targets Starts test containers.
	docker-compose -p $(NAME) -f test.yaml up

.PHONY: stop
stop: ##@targets Stops test containers.
	docker-compose -p $(NAME) -f test.yaml stop

.PHONY: stop-gitea
stop-gitea: ##@targets Stops gitea container only.
	docker-compose -p $(NAME) -f test.yaml stop gitea

.PHONY: test-gitea
test-gitea: ##@targets Stops test gitea container only.
	docker-compose -p $(NAME) -f test.yaml up gitea

.PHONY: stop-nginx
stop-nginx: ##@targets Stops nginx container only.
	docker-compose -p $(NAME) -f test.yaml stop nginx

.PHONY: test-nginx
test-nginx: ##@targets Stops test nginx container only.
	docker-compose -p $(NAME) -f test.yaml up nginx

.PHONY: rm
rm: stop ##@targets Stops test containers.
	docker-compose -p $(NAME) -f test.yaml rm -f

.PHONY: clean
clean: stop rm ##@targets Removes docker containers and created files.
	sudo rm -rf root

.PHONY: setup
setup:
	sudo chmod o+rwX -R pgpool-in
	for p in gitea postgres/primary postgres/replica; do \
	mkdir -p root/$$p; \
	chmod o+rwX root/$$p ; \
	done
