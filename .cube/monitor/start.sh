#!/bin/bash

APP=$1
URL=$2
EMAIL=$3
SMTP_USER=$4
SMTP_PASS=$4

docker run --rm --name "$APP_monitor" \
  dperson/smokeping:latest \
  ping "$URL" \
  -c 1 \
  -e "$EMAIL" \
  -s 1 \
  -g "$SMTP_USER;$SMTP_PASS"

docker run --restart=always -d -p 7890:7890 \
  -v /srv/goaccess/data:/srv/data \
  -v /srv/goaccess/html:/srv/report \
  -v /var/log/nginx:/srv/logs \
  --name=goaccess -d goaccess
