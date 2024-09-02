# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app for production
RUN npm run build

# Install a lightweight web server to serve the React app
RUN npm install -g serve

# Expose the port on which the app will run
EXPOSE 1414

# Command to run the app using the specified port
CMD ["serve", "-s", "build", "-l", "1414"]
