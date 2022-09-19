FROM debian:buster

RUN apt-get update\
		&& apt-get install -y --no-install-recommends redis\
		&& rm -rf /var/lib/apt/lists/*

COPY conf/redis.conf /etc

EXPOSE 6379

CMD [ "redis-server", "/etc/redis.conf" ]
