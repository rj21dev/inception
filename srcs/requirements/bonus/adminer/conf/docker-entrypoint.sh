#!/bin/bash

if [ ! -d /var/www/wordpress/adminer ]; then
	mkdir -p /var/www/wordpress/adminer
	wget -qO /var/www/wordpress/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php
fi

exec $@
