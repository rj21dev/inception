FROM debian:buster

LABEL maintainer="FT_NGINX rjada <rjada@student.21-school.ru>"

RUN apt-get update\
		&& apt-get install -y --no-install-recommends nginx openssl\
		&& openssl req -x509 -nodes -days 365 -newkey rsa:2048\
		-keyout /etc/ssl/private/nginx-selfsigned.key\
		-out /etc/ssl/certs/nginx-selfsigned.crt\
		-subj "/C=RU/ST=Moscow/L=Moscow/O=school21/OU=rjada/CN=rjada.42.fr/emailAddress=rjada@42.fri"\
		&& rm -rf /var/lib/apt/lists/*

COPY conf/rjada42fr /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/rjada42fr /etc/nginx/sites-enabled/rjada42fr

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]