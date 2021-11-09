# Build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
RUN mkdir node_modules/.cache && chmod -R 777 node_modules/.cache
COPY . .
CMD ["npm", "run", "build"]

# Run phase

FROM nginx
COPY --from=builder /app/build /usr/share/ngnix/html

