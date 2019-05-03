#!/bin/bash

wget https://raw.githubusercontent.com/clockworksoul/docker-gc-cron/master/compose/docker-gc-exclude
wget https://raw.githubusercontent.com/clockworksoul/docker-gc-cron/master/compose/docker-compose.yml
docker-compose up -d
