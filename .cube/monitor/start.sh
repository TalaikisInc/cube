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
