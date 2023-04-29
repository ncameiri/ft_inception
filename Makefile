all: 
	cd srcs && docker-compose up

fclean: 
		docker system prune -a
