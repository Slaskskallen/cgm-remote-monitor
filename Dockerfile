FROM node:22-alpine

WORKDIR /opt/app
COPY . .

RUN npm install --cache /tmp/empty-cache && \
    npm run postinstall && \
    rm -rf /tmp/*

EXPOSE 10000

CMD sh -c 'echo "PORT is: $PORT" && node server.js'
