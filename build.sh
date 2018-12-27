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
  chmod +x ./master_certs.sh
  chmod +x ./master_certs_renew.sh

  chmod +x ./.cube/proxy/build.sh
  chmod +x ./.cube/proxy/start.sh
  chmod +x ./.cube/mail/build.sh
  chmod +x ./.cube/mail/start.sh

  ./master_certs.sh
  ./.cube/proxy/build.sh
  ./.cube/mail/build.sh

  for APP in identiform blueblood sales ipfs act nakamoto talaikis ufunc
  do
    chmod +x ./slave_build.sh
    chmod +x ./slave_start.sh
    ./$APP/slave_build.sh $APP
  done
fi

if [ "$1" = "start" ]
then
  ./.cube/mail/start.sh
  ./.cube/proxy/start.sh

  for i in identiform,3000 blueblood,3002 sales,3003 ipfs,3004 act,3005 nakamoto,3006 talaikis,3007 ufunc,3008
  do IFS="," read APP PORT  <<< "${i}"
    ./$APP/slave_start.sh $APP $PORT
  done

  ./master_certs_renew.sh
fi
