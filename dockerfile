#stage 1
FROM node:16-alpine3.12 as node
WORKDIR /app
COPY . .
RUN npm install -g @angular/cli
RUN yarn install
RUN ng build
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist /usr/share/nginx/html
