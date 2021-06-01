# Multi-stage
# 1) Node image for building frontend assets
# 2) nginx stage to serve frontend assets

# # Name the node stage "builder"
# FROM node:10 AS builder
# # Set working directory
# WORKDIR /app
# # Copy all files from current directory to working dir in image
# # COPY . .
# COPY . /app
# # install node modules and build assets
# RUN yarn install && yarn build

# # nginx state for serving content
# FROM nginx:alpine
# # Set working directory to nginx asset directory
# WORKDIR /usr/share/nginx/html
# # Remove default nginx static assets
# RUN rm -rf ./*
# # Copy static assets from builder stage
# COPY --from=builder /app/dist .
# # Containers run nginx with global directives and daemon off
# ENTRYPOINT ["nginx", "-g", "daemon off;"]

# base image
FROM node:12.2.0-alpine

# set working directory
WORKDIR /app

COPY . /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json

RUN npm install
RUN npm install @vue/cli@3.7.0 -g

EXPOSE 8060

# start app
CMD ["npm", "run", "serve"]