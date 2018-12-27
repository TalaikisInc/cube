FROM keymetrics/pm2:latest-alpine

LABEL app.service="logs"

ENV NODE_ENV=production

WORKDIR /var/www/statsd
COPY ./index.js ./
RUN npm i -g pm2

CMD ["pm2-runtime", "index.js", "--name", "logs"]
