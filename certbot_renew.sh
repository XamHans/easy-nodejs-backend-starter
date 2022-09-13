#!/bin/bash

COMPOSE="/usr/local/bin/docker-compose --no-ansi"
DOCKER="/usr/bin/docker"

$COMPOSE run certbot renew --dry-run --cert-name newdevsontheblock.com --webroot --webroot-path=/var/www/newdevsontheblock.com/html  && $COMPOSE kill -s SIGHUP webserver

