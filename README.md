<p align="center">
  <a href="https://talaikis.com/">
    <img alt="Talaikis Ltd." src="https://github.com/TalaikisInc/talaikis.com_react/blob/master/media/logo.png" width="455">
  </a>
</p>

# Cube

Dockerized multi (Node.js) apps on one VPS system.

## Features

* Nginx proxy
* Mail service
* Phone service (@TODO)
* Letsencrypt
* Node.js + PM2 for apps
* Monitoring service
* Static analysis check of Nginx configuration after Nginx build

## TODO

* docker-compose version
* logging

## How to start

1. Install

```bash
chmod +x install.sh
./install.sh
acme.sh --register-account
```

1. Edit master_certs.sh, master_certs_renew.sh, build.sh, .cube/proxy/nginx.conf
2. Then just run:

```bash
chmod +x build.sh
./build.sh
```

3. Access dashboard ```<server_ip>:9090```

Notes:

* Any global microservices go into .cube/ (examples - [mail](https://github.com/TalaikisInc/email_service), proxy).
* Apps go into root folder
* Each app should have set of _slaves/ files.
