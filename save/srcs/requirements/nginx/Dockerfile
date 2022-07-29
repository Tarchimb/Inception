FROM debian:buster

#Install nginx and openssl (to get the SSL Certificate(HTTPS))
RUN apt-get update; 					\
	apt-get upgrade; 					\
	apt-get -y install nginx openssl 

#Create a folder to save the SSL Certificate
RUN mkdir -p /etc/certs
RUN mkdir -p /var/log/nginx

# Command to create new SSL Certificate (https://linuxize.com/post/creating-a-self-signed-ssl-certificate/)
RUN openssl req -newkey rsa:4096 		\
	-x509 								\
	-sha256 							\
	-days 3650 							\
	-nodes 								\
	-out /etc/certs/fullchain.pem 		\
	-keyout /etc/certs/privkey.pem 		\
	-subj "/C=FR/ST=Lyon/L=Lyon/O=42/OU=tarchimb Department/CN=www.tarchimb.42.fr"


#Copy the config file into the container
COPY conf/nginx.conf /etc/nginx/conf.d

COPY ./entrypoint.sh ./


RUN chmod +x ./entrypoint.sh

#Open ports
EXPOSE 443

#Run nginx
ENTRYPOINT ["./entrypoint.sh"]