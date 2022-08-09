# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarchimb <tarchimb@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 12:02:48 by tarchimb          #+#    #+#              #
#    Updated: 2022/08/09 16:04:29 by tarchimb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DCR			=	docker-compose -f srcs/docker-compose.yml
mariadb		= 	/Users/tarchimb/42/Inception/srcs/mariadb
nginx		= 	/Users/tarchimb/42/Inception/srcs/nginx
wordpress	= 	/Users/tarchimb/42/Inception/srcs/wordpress
container	=	$(shell docker ps -qa)
volume		=	$(shell docker volume ls -q)
images		=	$(shell docker images -qa)

all:
	mkdir -p $(nginx) $(mariadb) $(wordpress) ||:
	$(DCR) up -d --build
	sleep 2
	cp /home/tarchimb/data/nginx/certificat.crt /usr/local/share/ca-certificates/certificat.crt
	update-ca-certificates

debug: fclean
	$(DCR) build --no-cache --progress plain

stop:
	-docker stop $(container) 2>/dev/null ||:

clean: stop
	-docker rm -f $(container) 2>/dev/null ||:

fclean: clean
	-docker volume rm -f $(volume) 2>/dev/null ||:
	-docker rmi -r $(image) 2>/dev/null ||:
	-rm -rf $(nginx) $(mariadb) $(wordpress) 2>/dev/null ||:
	docker system prune -a --force

pause:
	$(DCR) pause

unpause:
	$(DCR) unpause

re: fclean all

.PHONY: all build clean fclean re pause unpause stop debug
