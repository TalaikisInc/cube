#!/bin/bash

docker run -it \
  --net=host \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -v /var/www/letsencrypt:/var/www/letsencrypt \
  --restart always \
  --name proxy \
  -d proxy
