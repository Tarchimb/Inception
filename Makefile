# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarchimb <tarchimb@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 12:02:48 by tarchimb          #+#    #+#              #
#    Updated: 2022/08/10 17:45:00 by tarchimb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DCR			=	docker-compose -f srcs/docker-compose.yml
mariadb		= 	/Users/tarchimb/42/Inception/srcs/mariadb
nginx		= 	/Users/tarchimb/42/Inception/srcs/nginx
wordpress	= 	/Users/tarchimb/42/Inception/srcs/wordpress
src_cert	= 	/Users/tarchimb/42/Inception/srcs/nginx/certificat.crt
dst_cert	=	/usr/local/share/ca-certificates/certificat.crt
container	=	$(shell docker ps -qa)
volume		=	$(shell docker volume ls -q)
images		=	$(shell docker images -qa)

all:
	mkdir $(nginx) $(mariadb) $(wordpress) ||:
	$(DCR) up -d --build
	sed -i "s/127.0.0.1	localhost/127.0.0.1	localhost tarchimb.42.fr#/g" /etc/hosts

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
