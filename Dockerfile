# Build phase 
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
FROM nginx
# Copy file from other (builder) phase
COPY --from=builder /app/build /usr/share/nginx/html
# Default behavior from nginx automatically starts