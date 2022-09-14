all: up

up:
	docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml down 

re:
	sudo rm -rf /home/rjada/data/wp/*
	sudo rm -rf /home/rjada/data/db/*
	docker compose -f ./srcs/docker-compose.yml up --build