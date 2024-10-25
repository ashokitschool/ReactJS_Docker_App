FROM node:18.13.0 as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build --prod

FROM nginx:latest

COPY --from=build app/build /usr/share/nginx/html

EXPOSE 80
