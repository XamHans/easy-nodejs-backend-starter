#!/bin/bash

COMPOSE="/usr/local/bin/docker-compose --no-ansi"
DOCKER="/usr/bin/docker"

cd ~/docker-nginx-node/
$COMPOSE run certbot certonly --cert-name strapi.newdevsontheblock.com --webroot --webroot-path=/var/www/strapi.newdevsontheblock.com/html  && $COMPOSE kill -s SIGHUP webserver

