FROM node:14-alpine
RUN apk add g++ make py3-pip
EXPOSE 8080
RUN mkdir /opt/app
WORKDIR /opt/app
ADD package.json package.json
RUN npm install
ADD . .
RUN npm run build
RUN npm prune --production
CMD ["node", "./dist/main.js"]