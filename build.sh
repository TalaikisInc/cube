#!/bin/bash

if [ "$1" = "install" ]
then
  chmod +x docker-install.sh
  ./docker-install.sh
fi

if [ "$1" = "clean" ]
then
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
  docker system prune -a
fi

if [ "$1" = "build" ]
then
  chmod +x /opt/msg.sh

  /opt/msg.sh "Making scripts executable..."
  chmod +x /opt/master_certs.sh
  chmod +x /opt/master_certs_renew.sh

  chmod +x /opt/.cube/proxy/build.sh
  chmod +x /opt/.cube/proxy/start.sh
  chmod +x /opt/.cube/mail/build.sh
  chmod +x /opt/.cube/mail/start.sh

  /opt/msg.sh "Building proxy..."
  cd /opt/.cube/proxy
  ./build.sh

  /opt/msg.sh "Building mail..."
  cd /opt/.cube/mail
  ./build.sh

  for APP in identiform blueblood sales ipfs act nakamoto talaikis ufunc estate-management upload-service users-cubed-s3
  do
    /opt/msg.sh "Building $APP..."
    chmod +x /opt/$APP/slave_build.sh
    chmod +x /opt/$APP/slave_start.sh
    cd /opt/$APP
    ./slave_build.sh "$APP"
  done
fi

if [ "$1" = "start" ]
then
  /opt/msg.sh "Starting mail..."
  cd /opt/.cube/mail
  ./start.sh

  for i in identiform,3000 blueblood,3002 sales,3003 ipfs,3004 act,3005 nakamoto,3006 talaikis,3007 ufunc,3008 estate-management,3009 upload-service,3010 users-cubed-s3,3011
  do IFS="," read APP PORT  <<< "${i}"
    docker stop "$APP"
    docker rm "$APP"
    /opt/msg.sh "Starting $APP at $PORT..."
    cd /opt/$APP
    ./slave_start.sh "$APP" "$PORT"
  done

  /opt/msg.sh "Starting certs..."
  cd /opt
  ./master_certs.sh

  ./msg.sh "Starting proxy..."
  cd /opt/.cube/proxy
  ./start.sh

  /opt/msg.sh "Starting cert renew"
  cd /opt
  ./master_certs_renew.sh
fi
