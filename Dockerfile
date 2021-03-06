FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm ci
COPY ./ ./
RUN npm run build:prod

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html