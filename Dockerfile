FROM amd64/node:16 as build 

WORKDIR /react-app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM amd64/nginx:1.19
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /react-app/build /usr/share/nginx/html