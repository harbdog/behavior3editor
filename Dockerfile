FROM node:11-alpine as behavior3

RUN apk update && apk add git curl

USER node
WORKDIR /home/node

RUN curl -sL https://git.falcons-robocup.nl/3rdparty/behavior3editor/-/archive/falcons/behavior3editor-falcons.zip | unzip -
WORKDIR behavior3editor-falcons

RUN npm install           \
    && npm install bower  \
    && npx bower install  \
    && npx gulp build

