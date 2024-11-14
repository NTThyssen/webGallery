# Use Node.js base image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install express

# Copy the remaining files to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 3003

# Run the application
CMD ["node", "server.js"]