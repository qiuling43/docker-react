FROM node:alpine as builder
WORKDIR /Ling/apps/frountend1
COPY ./package.json ./
RUN npm install
COPY ./ ./
CMD ["npm", "run", "build"]

FROM nginx
COPY --from=builder /Ling/apps/frountend1/build /usr/share/nginx/html
