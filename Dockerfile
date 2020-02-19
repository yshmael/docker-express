FROM node:12.14.1-alpine

RUN mkdir -p /usr/src/app/node_modules && chown -R node:node /usr/src/app

WORKDIR /usr/src/app

COPY package*.json ./

USER node

RUN npm install --only=prod

COPY --chown=node:node . ./

EXPOSE 3000

CMD ["node", "./src/index.js"]