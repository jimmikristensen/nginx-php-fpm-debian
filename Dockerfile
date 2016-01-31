FROM debian:jessie

MAINTAINER Jimmi Kristensen <picbox@gmail.com>

RUN apt-get update && \
apt-get -y install nginx && \
apt-get -y install php5-fpm && \
apt-get -y install php5-mysql && \
apt-get -y install php5-mcrypt && \
apt-get -y install php5-xdebug && \
apt-get -y install php5-mysqlnd && \
apt-get -y install php5-curl && \
apt-get -y install php-mail && \
apt-get -y install php5-json && \
apt-get -y install phpunit

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
