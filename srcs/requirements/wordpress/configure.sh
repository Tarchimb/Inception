#!/bin/bash

#Check if the configuration script is here, if no, wordpress has already been installed
if [ ! -f "/var/www/wordpress/wp-config.php" ]
then
	while ! mysql -h mariadb --user=${MARIADB_USER} --password=${MARIADB_ROOT_PWD} -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name='$MARIADB_DB'"; do
  		echo "Waiting for database to be created..."
  		sleep 5
	done
	echo "Starting installation wordpress"
	#Download Wordpress
	wp core download --allow-root
	#Create wp-config.php file
	wp config create --allow-root --dbname=${MARIADB_DB} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PWD} --dbhost=${MARIADB_HOST} --extra-php --force --skip-check
	#Install Wordpress and connect it to the database
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL}
	#Create a random user with subscriber role, and get him a new password
	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --role=subscriber
	wp user update 2 --allow-root --user_pass=${WP_USER_PWD}
	#Download and install the new wordpress theme
	wp theme install inspiro --activate --allow-root
	echo "Wordpress successfully installed"
else
	echo "No need to install wordpress"
fi

#Start and stop php-fpm to make sure /run/php directory has been created
service php7.3-fpm start && service php7.3-fpm stop
#Launch php-fpm
php-fpm7.3 -F
