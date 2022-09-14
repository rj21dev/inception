#!/bin/bash

if [ ! -f /var/www/wp-config-sample.php ]; then
	cp -r /var/wordpress/* /var/www
fi

if [ ! -f /var/www/wp-config.php ]; then
	echo "Waiting for MySQL server"
	sleep 10
	wp config create --allow-root --path="/var/www/" --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb:3306 --dbprefix=wp_
	wp config set --allow-root --path="/var/www/" WP_MEMORY_LIMIT 256M
	wp core install --allow-root --path="/var/www/" --url=https://$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADM_PASS --admin_email=$WP_ADM_MAIL --skip-email
fi

chown -R www-data:www-data /var/www
chmod -R 666 /var/www
find /var/www -type d -exec chmod 755 {} \;

exec $@