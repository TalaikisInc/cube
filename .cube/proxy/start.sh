#!/bin/bash

docker run -it \
  --net=host \
  -v /root/.acme.sh:/root/.acme.sh \
  -v /opt/megashop/.data:/opt/megashop/.data \
  -v /usr/local/sbin/:/usr/local/sbin/ \
  --log-opt max-size=50m \
  --log-opt max-file=2 \
  --restart always \
  --name proxy \
  -d proxy
