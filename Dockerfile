# Build phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# Our build files will be stored in /app/build

# Run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
