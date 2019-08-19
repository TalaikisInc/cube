#!/bin/bash

docker run -it \
  -v /root/acme.sh:/acme.sh  \
  --net=host \
  --name=acme.sh \
  --restart always \
  neilpang/acme.sh daemon
