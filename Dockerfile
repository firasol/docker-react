# step 1
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# step 2
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# nginx will start automatically