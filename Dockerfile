# 1. Build
FROM node:lts-alpine

LABEL name="gothbarbie/docker-react"
LABEL version="1.0.0"

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build 


# 2. Run
FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html
