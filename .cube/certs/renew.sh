#!/bin/bash

EMAIL==$2
HOST=$1

docker run -d \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -v /var/www/letsencrypt:/var/www/letsencrypt \
  -e "LETSENCRYPT_WEBROOT_MODE=true" \
  -e "LETSENCRYPT_EMAIL=$EMAIL" \
  -e "LETSENCRYPT_DOMAIN1=$HOST" \
  --name "letsencrypt_$HOST" \
  blacklabelops/letsencrypt
