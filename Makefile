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

clean:
	sudo rm -rf /home/$(USER)/data/wp/*
	sudo rm -rf /home/$(USER)/data/db/*
	docker container prune -f

fclean: clean
	docker image prune -fa
	docker volume prune -f

hardreset:
	docker system prune -fa --volumes

re:
	sudo rm -rf /home/$(USER)/data/wp/*
	sudo rm -rf /home/$(USER)/data/db/*
ifeq ($(shell uname), Linux)
	docker compose -f ./srcs/docker-compose.yml up --build
else
	docker-compose -f ./srcs/docker-compose.yml up --build
endif