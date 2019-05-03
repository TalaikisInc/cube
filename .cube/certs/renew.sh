#!/bin/bash

docker run --rm  -itd  \
  -v /root/acme.sh:/acme.sh  \
  --net=host \
  --name=acme.sh \
  neilpang/acme.sh daemon
