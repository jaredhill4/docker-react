# Build phase
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build
# Our build files will be stored in /app/build

# Run phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
