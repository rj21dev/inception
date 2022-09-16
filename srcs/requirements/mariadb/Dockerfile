FROM debian:buster

LABEL maintainer="FT_MARIADB rjada <rjada@student.21-school.ru>"

RUN apt-get update\
		&& apt-get install -y --no-install-recommends mariadb-server\
		&& rm -rf /var/lib/apt/lists/*\
		&& mkdir -p /var/lib/mysql /run/mysqld\
		&& chown -R mysql:mysql /var/lib/mysql /run/mysqld\
		&& sed '/port/s/^#//' -i /etc/mysql/mariadb.conf.d/50-server.cnf\
		&& sed '/bind-address/s/^/#/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/docker-entrypoint.sh .

EXPOSE 3306

ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD [ "mysqld" ]