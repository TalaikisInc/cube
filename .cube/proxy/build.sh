#!/bin/bash

mkdir -p /var/ww/letsencrypt
docker build -t proxy .
