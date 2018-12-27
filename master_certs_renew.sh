#!/bin/bash

chmod +x ./.cube/certs/renew.sh

for HOST in identiform.com mail.identiform.com www.identiform.com blueblood.ltd www.blueblood.ltd sales.identiform.com act.identiform.com ipfs.identiform.com nakamotowallet.org www.nakamotowallet.org talaikis.com www.talaikis.com ufunc.com www.ufunc.com
do
  ./.cube/certs/renew.sh $HOST talaikis.t@gmail.com
done
