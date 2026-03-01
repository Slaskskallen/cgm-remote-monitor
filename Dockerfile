FROM node:22-alpine

WORKDIR /opt/app

# Kopiera package-filer först (bättre cache)
COPY package*.json ./

# Installera beroenden utan optional (snabbare & stabilare)
RUN npm install --omit=optional

# Kopiera resten av koden
COPY . .

EXPOSE 1337

ENV NODE_ENV=production
ENV PORT=1337
ENV HOST=0.0.0.0

# Starta Nightscout direkt (inte npm start)
CMD ["node", "lib/server/server.js"]
