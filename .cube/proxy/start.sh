#!/bin/bash

docker run -it \
  --net=host \
  -v /root/.acme.sh:/root/.acme.sh \
  --restart always \
  --log-opt max-size=50m \
  --log-opt max-file=2 \
  --name proxy \
  -d proxy
