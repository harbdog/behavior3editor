FROM node:11-alpine as behavior3

RUN apk update && apk add git curl

USER node
WORKDIR /home/node

COPY *.json *.js ./

RUN npm install           \
    && npm install bower  \
    && npx bower install

COPY . .

RUN npx gulp build

ENTRYPOINT npx gulp serve
