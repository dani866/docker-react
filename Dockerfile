FROM node:16-alpine as builder 
# as is useful to add a tag
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# expose port 80 to elasticbeanstalk
COPY --from=builder /app/build /usr/share/nginx/html