#!/bin/bash

#Check if the configuration script is here, if no, wordpress has already been installed
if [ ! -d "/var/www/wordpress/wp-config.php" ]
then
	sleep 10
	#Download Wordpress
	wp core download --allow-root
	#Create wp-config.php file
	wp config create --allow-root --dbname=${MARIADB_DB} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PWD} --dbhost=${MARIADB_HOST} --extra-php --force --skip-check
	#Install Wordpress and connect it to the database
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL}
	#Create a random user with subscriber role, and get him a new password
	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --role=subscriber
	wp user update 2 --allow-root --user_pass=${WP_USER_PWD}
	wp theme install inspiro --activate --allow-root
fi

#Start and stop php-fpm to make sure /run/php directory has been created
service php7.3-fpm start && service php7.3-fpm stop
#Launch php-fpm
php-fpm7.3 -F
