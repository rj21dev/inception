FROM debian:buster

LABEL maintainer="FT_MARIADB rjada <rjada@student.21-school.ru>"

RUN apt-get update\
		&& apt-get install -y --no-install-recommends mariadb-server\
		&& rm -rf /var/lib/apt/lists/*

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./docker-entrypoint.sh .

EXPOSE 3306

ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD [ "mysqld" ]