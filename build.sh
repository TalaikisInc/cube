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

  /opt/msg.sh "Generating certificates..."
  cd /opt && ./master_certs.sh

  /opt/msg.sh "Building proxy..."
  cd /opt/.cube/proxy
  ./build.sh

  /opt/msg.sh "Building mail..."
  cd /opt/.cube/mail
  ./build.sh

  for APP in identiform blueblood sales ipfs act nakamoto talaikis ufunc
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
  ./.cube/mail/start.sh

  /opt/msg.sh "Starting proxy..."
  ./.cube/proxy/start.sh

  for i in identiform,3000 blueblood,3002 sales,3003 ipfs,3004 act,3005 nakamoto,3006 talaikis,3007 ufunc,3008
  do IFS="," read APP PORT  <<< "${i}"
    /opt/msg.sh "Starting $App at $PORT..."
    cd /opt/$APP
    ./slave_start.sh $APP $PORT
  done

  /opt/msg.sh "Starting cert renewal containers..."
  ./master_certs_renew.sh
fi
