# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarchimb <tarchimb@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 12:02:48 by tarchimb          #+#    #+#              #
#    Updated: 2023/01/25 09:46:03 by tarchimb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_NETWORK		=	$(shell docker network ls | grep Inception)
DCR			=	docker compose -f srcs/docker-compose.yml
# mariadb		= 	/home/tarchimb/data/mariadb
# wordpress	= 	/home/tarchimb/data/wordpress
mariadb 	= 	/Users/tarchimb/42/Inception/data/mariadb
wordpress 	= 	/Users/tarchimb/42/Inception/data/wordpress
volumes_dir	=	/Users/tarchimb/42/Inception/data
container	=	$(shell docker ps -qa)
volume		=	$(shell docker volume ls -q)
images		=	$(shell docker images -qa)

all:
	mkdir -p $(mariadb) $(wordpress)
	$(DCR) up -d --build

down:
	${DCR} down

stop:
	${DCR} stop

reload: down all

clean-volumes:
	@docker volume rm -f mariadb-volume
	@docker volume rm -f wordpress-volume
	rm -rf $(volumes_dir)

clean:
	@docker rm -f mariadb 2> /dev/null
	@docker rm -f wordpress 2> /dev/null
	@docker rm -f nginx 2> /dev/null

	@docker rmi -f mariadb 2> /dev/null
	@docker rmi -f wordpress 2> /dev/null
	@docker rmi -f nginx 2> /dev/null

fclean: stop clean clean-volumes 
	@if [ -n "$(DOCKER_NETWORK)" ]; then\
		docker network rm Inception; \
	fi

re : fclean all

.PHONY: all clean fclean re stop down
