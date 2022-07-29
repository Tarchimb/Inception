#!/bin/bash
#Check if database is already created (in case of crash or pause, don't recreate it)
if [ ! -d "/var/lib/mysql/${MARIADB_DB}" ]
then
	#will initialize data directory and creates system table in mysql database;
	#mariadb use it to manage privileges, roles and plugins
	mysql_install_db --datadir /var/lib/mysql
	#Create socket for mysql (to run sql)
	service mysql start
	#sleep to make sure socket has been created
	sleep 3
	#mysql -e = run command without open mysql (like a subshell)
	#Create database
	mysql -e "CREATE DATABASE ${MARIADB_DB}" && \
	#Create a new user (the percent is use to be able to connect from anywhere)
	mysql -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PWD}';" && \
	#Get him all privileges
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PWD}' WITH GRANT OPTION;" && \
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_PWD}' WITH GRANT OPTION;" && \
	#Make sure grants take effect right now
	mysql -e "FLUSH PRIVILEGES;"
	#Make the root password take effect's
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}'"
	sed -i "s/password =/password = ${MARIADB_ROOT_PWD} #/" /etc/mysql/debian.cnf
	#stop mysql to be able to launch mysqld_safe
	service mysql stop
fi

#start mysql server in safe mode (will restart if crash) and send data to path
mysqld_safe --datadir=/var/lib/mysql


#Show users : SELECT User FROM mysql.user;
#SHOW DATABASES;
#Show privileges of 'x' user : SHOW GRANTS FOR tarchimb@localhost;