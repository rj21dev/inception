FROM debian:buster

LABEL maintainer="FT_WORDPRESS rjada <rjada@student.21-school.ru>"

RUN apt-get update\
		&& apt-get install -y --no-install-recommends wget lsb-release apt-transport-https ca-certificates mariadb-client\
		&& wget -qO /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg\
		&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list\
		&& apt-get update\
		&& apt-get install -y --no-install-recommends php php-fpm php-mysql php-imagick\
		&& rm -rf /var/lib/apt/lists/*\
		&& mkdir -p /run/php /var/wordpress /var/run/mysql\
		&& wget -qO wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\
		&& chmod +x wp && mv wp /usr/local/bin\
		&& wp core download --allow-root --path="/var/wordpress/" --locale=ru_RU

WORKDIR /var/www/wordpress

COPY conf/rjada42fr.conf /etc/php/8.1/fpm/pool.d/
COPY conf/docker-entrypoint.sh /

EXPOSE 9000

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "php-fpm8.1", "--nodaemonize" ]