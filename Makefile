# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tarchimb <tarchimb@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 12:02:48 by tarchimb          #+#    #+#              #
#    Updated: 2022/08/09 15:49:27 by tarchimb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DCR			=	docker-compose -f srcs/docker-compose.yml
mariadb		= 	/save/mariadb#/home/tarchimb/data/mariadb
nginx		= 	/save/nginx#/home/tarchimb/data/nginx
wordpress	= 	/save/wordpress#/home/tarchimb/data/wordpress
container	=	$(shell docker ps -qa)
volume		=	$(shell docker volume ls -q)
images		=	$(shell docker images -qa)

all:
	mkdir -p /save
	mkdir $(nginx) $(mariadb) $(wordpress) ||:
	$(DCR) up -d --build
# sleep 2
#Add this command to make sure that the certificat will be accepted by the host. This command is for Macos
# sudo security add-trusted-cert -d srcs/nginx/certificat.crt
cp ${nginx}/certificat.crt /usr/local/share/ca-certificates/certificat.crt
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
