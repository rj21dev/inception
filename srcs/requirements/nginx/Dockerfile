FROM debian:buster

LABEL maintainer="FT_NGINX rjada <rjada@student.21-school.ru>"

RUN apt-get update\
		&& apt-get install -y --no-install-recommends nginx openssl\
		&& openssl req -x509 -nodes -days 365 -newkey rsa:2048\
		-keyout /etc/ssl/private/nginx-selfsigned.key\
		-out /etc/ssl/certs/nginx-selfsigned.crt\
		-subj "/C=RU/ST=Moscow/L=Moscow/O=school21/OU=rjada/CN=rjada.42.fr/emailAddress=rjada@42.fr"\
		&& rm -rf /var/lib/apt/lists/*

EXPOSE 443

#RUN ln -s /etc/

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]