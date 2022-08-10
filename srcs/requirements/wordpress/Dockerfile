FROM debian:buster

#Install requirements to make work php and wordpress
RUN apt-get update; 						\
	apt-get upgrade; 						\
	apt-get install -y php-fpm php7.3 php-mysql curl 

#Install curl command
RUN apt-get install -y curl

#Get Wordpress command line and make it usable as a command
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar;					\
 	mv wp-cli.phar /usr/local/bin/wp		

#Conf file for php-fpm, in our case precise to listen to wordpress:9000
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

#Create directory to create our Wordpress inside, and allow users to access it
RUN mkdir -p /var/www/wordpress && chmod 755 /var/www/wordpress

#Get the entrypoint for our container and make it executable
COPY ./configure.sh ./configure.sh
RUN chmod 777 ./configure.sh

#Expose port 9000
EXPOSE 9000

#This command is like cd, we will be at this path when entering in the container
WORKDIR /var/www/wordpress

#Execute the script at the launching of the container
ENTRYPOINT [ "/configure.sh" ]

