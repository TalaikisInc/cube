#!/bin/bash

EMAIL==$1

docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e "JOB_NAME1=ReloadNginx" \
  -e "JOB_COMMAND1=docker exec proxy nginx -s reload" \
  -e "JOB_TIME1=0 0 2 15 * *" \
  -e "JOB_ON_ERROR1=Continue" \
  --restart always \
  blacklabelops/jobber:docker

docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e "JOB_NAME1=UpdateNginxBlocker" \
  -e "JOB_COMMAND1=docker exec proxy sudo /usr/local/sbin/update-ngxblocker -e $EMAIL" \
  -e "JOB_TIME1=0 0 22 * * *" \
  -e "JOB_ON_ERROR1=Continue" \
  --restart always \
  blacklabelops/jobber:docker
