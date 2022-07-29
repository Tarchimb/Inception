FROM debian:buster

#Install mariadb
RUN apt update && \
    apt install mariadb-server -y 

#Copy script inside the container
COPY ./entrypoint.sh ./

#Make the script executable
RUN chmod +x entrypoint.sh

#Very Important! Tell to mariadb to not listen on only 127.0.0.1 but from everywhere
#Without we can't connect to database from wordpress
RUN	sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf

#Will listen to this port to get whatever the container need. TCP protocol is used unless specified
EXPOSE 3306

#Run the script
ENTRYPOINT [ "./entrypoint.sh" ]