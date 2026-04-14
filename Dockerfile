FROM node:20-alpine

RUN apk update && apk upgrade --no-cache

RUN npm install -g npm@latest

WORKDIR /app

COPY . .

WORKDIR /app/front-end

RUN npm install

RUN npm audit fix || true

RUN npm run build

EXPOSE 4173

CMD ["npm", "run", "preview"]