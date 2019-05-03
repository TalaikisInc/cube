#!/bin/bash

chmod +x /opt/.cube/certs/request.sh
chmod +x /opt/.cube/certs/renew.sh

cd /opt/.cube/certs

for HOST in blockchain.talaikis.com upload.talaikis.com mail.talaikis.com blueblood.ltd www.blueblood.ltd sales.talaikis.com act.talaikis.com ipfs.talaikis.com nakamotowallet.org www.nakamotowallet.org talaikis.com www.talaikis.com estateexperts.co.uk www.estateexperts.co.uk
do
  ./request.sh "$HOST"
done

./renew.sh
