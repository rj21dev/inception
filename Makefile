all: up

up:
	mkdir -p /home/$(USER)/data/wp
	mkdir -p /home/$(USER)/data/db
ifeq ($(shell uname), Linux)
	docker compose -f ./srcs/docker-compose.yml up
else
	docker-compose -f ./srcs/docker-compose.yml up
endif

down:
ifeq ($(shell uname), Linux)
	docker compose -f ./srcs/docker-compose.yml down 
else
	docker-compose -f ./srcs/docker-compose.yml down
endif

build:
ifeq ($(shell uname), Linux)
	docker compose -f ./srcs/docker-compose.yml up --build
else
	docker-compose -f ./srcs/docker-compose.yml up --build
endif

clean:
	sudo rm -rf /home/$(USER)/data/wp/*
	sudo rm -rf /home/$(USER)/data/db/*
	docker container prune -f

fclean: clean
	docker image prune -fa
	docker volume prune -f

hardreset: fclean
	docker system prune -fa --volumes
	sudo rm -rf /home/$(USER)/data/
	sudo rm -rf /home/$(USER)/data/

re: fclean all

pre_eval:
	docker stop $(docker ps -qa) \
	|| docker rm $(docker ps -qa) \
	|| docker rmi -f $(docker images -qa) \
	|| docker volume rm $(docker volume ls -q) \
	|| docker network rm $(docker network ls -q) 2> /dev/null

.PHONY: up down build clean fclean hardreset re pre_eval