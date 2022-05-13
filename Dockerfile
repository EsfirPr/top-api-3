FROM node:14-alpine
EXPOSE 8080
WORKDIR /opt/app
ADD package.json package.json
RUN apk add --no-cache python3 py3-pip make g++
ADD . .
RUN npm run build
RUN npm prune --production
CMD ["node", "./dist/main.js"]