FROM node:22-alpine
RUN apk add --no-cache net-tools

WORKDIR /opt/app
COPY . .

RUN npm install --cache /tmp/empty-cache && \
    npm run postinstall && \
    rm -rf /tmp/*

EXPOSE 10000

CMD node server.js & sleep 5 && netstat -tulpn && sleep 3600
