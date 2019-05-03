#!/bin/bash

APP=$1
PORT=$2

docker run -it \
    -p "$PORT:3000" \
    --restart always \
    --log-opt max-size=50m \
    --log-opt max-file=2 \
    --name "$APP" -d "$APP"
