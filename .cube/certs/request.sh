#!/bin/bash

EMAIL=$2
HOST=$1

docker run --rm \
  -p 80:80 \
  -p 443:443 \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -e "LETSENCRYPT_EMAIL=$EMAIL" \
  -e "LETSENCRYPT_DOMAIN1=$HOST" \
  blacklabelops/letsencrypt install
