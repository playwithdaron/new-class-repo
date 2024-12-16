# Use the official Node.js image as a base image
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the React app files into the container
COPY . .

# Expose port 3000 (the default port for React development server)
EXPOSE 3000

# Run the React development server
CMD ["npm", "start"]