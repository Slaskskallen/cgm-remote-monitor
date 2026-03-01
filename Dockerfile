FROM node:22-alpine

WORKDIR /opt/app
COPY . .

RUN npm install --omit=optional

EXPOSE 1337

ENV NODE_ENV=production
ENV PORT=1337
ENV HOST=0.0.0.0

CMD ["node", "lib/server/server.js"]
