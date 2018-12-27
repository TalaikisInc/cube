FROM ubuntu:18.04

LABEL app.service="proxy"

RUN apt update
RUN apt install wget nano htop nginx curl openssl -y

COPY ./nginx.conf /etc/nginx

RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/install-ngxblocker -O /usr/local/sbin/install-ngxblocker
RUN chmod +x /usr/local/sbin/install-ngxblocker
RUN /usr/local/sbin/install-ngxblocker
RUN /usr/local/sbin//install-ngxblocker -x
RUN chmod +x /usr/local/sbin/setup-ngxblocker
RUN chmod +x /usr/local/sbin/update-ngxblocker
RUN /usr/local/sbin/setup-ngxblocker -x -e conf

USER root

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
