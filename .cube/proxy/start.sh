#!/bin/bash

docker run -it \
  --net=host \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -v /var/www/letsencrypt:/var/www/letsencrypt \
  --name proxy \
  -d proxy
