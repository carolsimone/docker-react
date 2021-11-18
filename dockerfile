FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#OUTPUT IS THE BUILD FOLDER

# Previous block is completed when you add a new FROM
FROM nginx
# Copy from the builder phase what you want from it
COPY --from=builder /app/builder /usr/share/nginx/html

