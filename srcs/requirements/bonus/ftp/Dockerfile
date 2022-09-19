FROM debian:buster

LABEL maintainer="FT_FTP rjada <rjada@student.21-school.ru>"

RUN apt-get update\
		&& apt-get install -y --no-install-recommends vsftpd\
		&& rm -rf /var/lib/apt/lists/*

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY conf/docker-entrypoint.sh .

EXPOSE 21

ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD [ "vsftpd", "/etc/vsftpd.conf"]