FROM nginx:alpine

MAINTAINER Piotr Kasprowicz

RUN apk update && apk add apache2-utils

WORKDIR /etc/ssl
ADD ./assets/cert/* ./

WORKDIR /etc/nginx/sites-available
ADD ./assets/sgm-server.conf ./

WORKDIR /etc/nginx/sites-enabled
RUN ln -s /etc/nginx/sites-available/sgm-server.conf /etc/nginx/sites-enabled/sgm-server.conf

WORKDIR /etc/nginx
RUN rm ./nginx.conf

ADD ./assets/nginx.conf ./
RUN htpasswd -b -c ./.htpasswd test test

WORKDIR /var/www/sgm-server/sgmeteo_release
RUN touch README

EXPOSE 443
EXPOSE 80
