# Stage 1: Build the React app
FROM node:18 AS build

WORKDIR /src

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all the source code and build the React app
COPY . .
RUN npm run build

# Stage 2: Serve the built React app with Nginx
FROM nginx:alpine

# Copy the build folder from the previous stage to Nginx's public directory
COPY --from=build /src/build /usr/share/nginx/html

# Expose port 80 (the default port for Nginx)
EXPOSE 80

# Start Nginx (it will serve the React app on port 80)
CMD ["nginx", "-g", "daemon off;"]