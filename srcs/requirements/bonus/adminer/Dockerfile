FROM debian:buster

LABEL maintainer="FT_ADMINER rjada <rjada@student.21-school.ru>"

RUN apt-get update\
		&& apt-get install -y --no-install-recommends wget lsb-release apt-transport-https ca-certificates\
		&& wget -qO /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg\
		&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list\
		&& apt-get update\
		&& apt-get install -y --no-install-recommends php php-fpm php-mysql\
		&& rm -rf /var/lib/apt/lists/*\
		&& mkdir -p /run/php

COPY conf/adminer.conf /etc/php/8.1/fpm/pool.d/
COPY conf/docker-entrypoint.sh .

EXPOSE 8000

ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD [ "php-fpm8.1", "--nodaemonize" ]