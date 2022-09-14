FROM debian:buster

LABEL maintainer="FT_WORDPRESS rjada <rjada@student.21-school.ru>"

RUN apt-get update\
		&& apt-get install -y wget lsb-release apt-transport-https ca-certificates\
		&& wget -O /etc/apt/trusted.gpg.d/php.gpg -q https://packages.sury.org/php/apt.gpg\
		&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list\
		&& apt-get update\
		&& apt-get install -y php php-fpm php-mysql\
		&& rm -rf /var/lib/apt/lists/*\
		&& mkdir -p /run/php /var/www\
		&& wget -O wp -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\
		&& chmod +x wp && mv wp /usr/local/bin\
		&& wp core download --allow-root --path="/var/www/" --locale=ru_RU

COPY conf/www.conf /etc/php/8.1/fpm/pool.d/

EXPOSE 9000

COPY conf/docker-entrypoint.sh .

ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD [ "php-fpm8.1", "--nodaemonize" ]
#CMD [ "sleep", "infinity" ]
