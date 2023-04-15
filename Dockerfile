# https://about.lovia.life/creating-strapi-app-image-with-docker/
# https://strapi.io/blog/how-to-run-a-strapi-dev-stack-with-docker-compose
FROM node:18.14.0-alpine3.17

# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev

WORKDIR /opt/

COPY ./package.json ./package-lock.json ./

ENV PATH /opt/node_modules/.bin:$PATH
RUN npm install
WORKDIR /opt/app
COPY ./ .
RUN npm run build
EXPOSE 1337
CMD ["npm", "run", "develop"]
