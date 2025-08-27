FROM node:22.14.0-alpine


WORKDIR /usr/src/app

COPY package.json package-lock.json turbo.json tsconfig.json ./

COPY apps ./apps
COPY packages ./packages

#install dependencies
RUN npm install

RUN npm run db:generate

#can you filter the build down to just one app?
RUN npm run build

CMD ["npm", "run", "start-user-app"]