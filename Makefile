# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarchimb <tarchimb@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 12:02:48 by tarchimb          #+#    #+#              #
#    Updated: 2022/08/11 10:43:49 by tarchimb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DCR			=	docker-compose -f srcs/docker-compose.yml
mariadb		= 	/home/tarchimb/data/mariadb
wordpress	= 	/home/tarchimb/data/wordpress
container	=	$(shell docker ps -qa)
volume		=	$(shell docker volume ls -q)
images		=	$(shell docker images -qa)

all:
	-mkdir -p $(mariadb) $(wordpress) ||:
	$(DCR) up -d --build
	if [ -z "`grep tarchimb.42.fr /etc/hosts`" ]; then sed -i "s/127.0.0.1	localhost/127.0.0.1	localhost tarchimb.42.fr/g" /etc/hosts; fi

debug: fclean
	$(DCR) build --no-cache --progress plain

stop:
	-docker stop $(container) 2>/dev/null ||:

clean: stop
	-docker rm -f $(container) 2>/dev/null ||:

fclean: clean
	-docker volume rm -f $(volume) 2>/dev/null ||:
	-docker rmi -r $(image) 2>/dev/null ||:
	-rm -rf  /home/tarchimb 2>/dev/null ||:
	docker system prune -a --force

pause:
	$(DCR) pause

unpause:
	$(DCR) unpause

re: fclean all

.PHONY: all build clean fclean re pause unpause stop debug
