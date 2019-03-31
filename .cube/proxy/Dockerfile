FROM nginx:1.15.8-alpine

RUN apk add wget curl

COPY ./nginx.conf /etc/nginx
COPY ./dhparam.pem /etc/ssl/private/dhparam.pem

RUN mkdir /usr/local/sbin
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/install-ngxblocker -O /usr/local/sbin/install-ngxblocker
RUN chmod +x /usr/local/sbin/install-ngxblocker
RUN /usr/local/sbin/install-ngxblocker -x
RUN chmod +x /usr/local/sbin/setup-ngxblocker
RUN chmod +x /usr/local/sbin/update-ngxblocker
RUN /usr/local/sbin/setup-ngxblocker -x

EXPOSE 80 443
RUN apk del wget curl

CMD ["nginx", "-g", "daemon off;"]
