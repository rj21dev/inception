#!/bin/bash

if [ ! -f /var/www/wp-config-sample.php ]; then
	echo "Copying wordpress core files in www-dir"
	cp -r /var/wordpress/* /var/www
fi

if [ ! -f /var/www/wp-config.php ]; then
	echo "Waiting for MySQL server"
	sleep 7
	wp config create --allow-root --path="/var/www/" --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb:3306 --dbprefix=wp_
	wp config set --allow-root --path="/var/www/" WP_MEMORY_LIMIT 256M
	wp core install --allow-root --path="/var/www/" --url=https://$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADM_NAME --admin_password=$WP_ADM_PASS --admin_email=$WP_ADM_MAIL --skip-email
	wp theme install --allow-root --path="/var/www/" $WP_THEME
	wp theme activate --allow-root --path="/var/www" $WP_THEME
	wp user create --allow-root --path="/var/www" $WP_USR_NAME $WP_USR_MAIL --role=$WP_USR_ROLE --user_pass=$WP_USER_PASS
	wget -qO /var/wordpress/content.txt $WP_POST_CONTENT
	cat /var/wordpress/content.txt | wp post generate --allow-root --path=/var/www --post_content --count=10 --post_author=$WP_USR_NAME --post_date=2022-09-15
	cat /var/wordpress/content.txt | wp post generate --allow-root --path=/var/www --post_content --count=5 --post_type=page --post_date=2022-09-15
	for ((i = 1; i < 19; i++))
	do
		 wp comment generate --allow-root --path=/var/www --count=5 --post_id=$i
	done
	wget -qO /var/wordpress/img.png $WP_POST_LOGO
	ATTACHMENT_ID="$(wp media import --allow-root --path=/var/www /var/wordpress/img.png --porcelain)"
	wp post list --allow-root --path=/var/www --post_type=post --format=ids | xargs -d ' ' -I % wp post meta add --allow-root --path=/var/www % _thumbnail_id $ATTACHMENT_ID
	wget -qO /var/wordpress/img2.jpg $WP_PAGE_LOGO
	ATTACHMENT_ID="$(wp media import --allow-root --path=/var/www /var/wordpress/img2.jpg --porcelain)"
	wp post list --allow-root --path=/var/www --post_type=page --format=ids | xargs -d ' ' -I % wp post meta add --allow-root --path=/var/www % _thumbnail_id $ATTACHMENT_ID
fi

chown -R www-data:www-data /var/www
chmod -R 666 /var/www
find /var/www -type d -exec chmod 755 {} \;
echo "Domain https://$DOMAIN_NAME is ready to browse"

exec $@
