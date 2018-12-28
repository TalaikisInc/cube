# Cube

Dockerized multi (Node.js) apps on one VPS system.

## Technology

* Nginx
* Letsencrypt
* Node.js
* PM2

## How to start

1. Install Docker

```bash
chmod +x docker-install.sh
./docker-install.sh
```

1. Edit master_certs.sh, master_certs_renew.sh, build.sh, .cube/proxy/nginx.conf
2. Then just run:

```bash
chmod +x build.sh
./build.sh
```

Notes:

* Any global microservices go into .cube/ (examples - [mail](https://github.com/TalaikisInc/email_service), proxy).
* Apps go into root folder
* Each app should have set of _slaves/ files.

## TODO

* Implement docker-compose
