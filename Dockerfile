FROM node:22-alpine

WORKDIR /opt/app
COPY . .

RUN npm install --cache /tmp/empty-cache && \
    npm run postinstall && \
    rm -rf /tmp/*

EXPOSE 1337

CMD ["node", "server.js"]
