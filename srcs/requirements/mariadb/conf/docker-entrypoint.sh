#!/bin/bash

if [ ! -d /var/lib/mysql/$DB_NAME ]; then
	echo "Execute temp server to create database, user and set root password"
	mysql_install_db --skip-test-db
	/usr/share/mysql/mysql.server start
	mariadb -e "CREATE DATABASE $DB_NAME"
	mariadb -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'"
	mariadb -e "GRANT ALL ON $DB_NAME.* TO '$DB_NAME'@'%'"
	mariadb -e "FLUSH PRIVILEGES"
	mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_RT_PASS'"
	mysqladmin --user=root --password=$DB_RT_PASS shutdown
fi

exec $@
