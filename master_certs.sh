#!/bin/bash

chmod +x /opt/.cube/certs/request.sh

for HOST in api.ufunc.com upload.ufunc.com identiform.com mail.identiform.com www.identiform.com blueblood.ltd www.blueblood.ltd sales.identiform.com act.identiform.com ipfs.identiform.com nakamotowallet.org www.nakamotowallet.org talaikis.com www.talaikis.com ufunc.com www.ufunc.com estateexperts.co.uk www.estateexperts.co.uk
do
  cd /opt/.cube/certs
  ./request.sh "$HOST" talaikis.t@gmail.com
done
