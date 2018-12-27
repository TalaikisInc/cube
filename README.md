# Cube

Dockerized multi (Node.js) apps on one VPS system.

## Technology

* Nginx
* Letsencrypt
* Node.js
* PM2

## How to start

1. Edit master_certs.sh, master_certs_renew.sh, build.sh, .cube/proxy/nginx.conf
2. Then just run build.sh

Notes:

* Any global microservices go into .cube/ (examples - mail, proxy).
* Apps go into root folder
* Each app should have set of _slaves/ files.

## TODO

* Fix nginx blocker.
* Implement docker-compose
