FROM node:16 AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/build .
CMD ["nginx", "-g", "daemon off;"]
