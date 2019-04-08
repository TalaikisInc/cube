#!/bin/bash

chmod +x ./.cube/certs/renew.sh

for HOST in blockchain.talaikis.com upload.talaikis.com mail.talaikis.com blueblood.ltd www.blueblood.ltd sales.talaikis.com act.talaikis.com ipfs.talaikis.com nakamotowallet.org www.nakamotowallet.org talaikis.com www.talaikis.com ufunc.com www.ufunc.com estateexperts.co.uk www.estateexperts.co.uk
do
  docker stop letsencrypt_$HOST
  docker rm letsencrypt_$HOST
  cd /opt/.cube/certs
  ./renew.sh "$HOST" talaikis.t@gmail.com
done
