# Use Node.js as the base image
FROM node:18

# Set app directory
WORKDIR /app

# Copy package files and install
COPY package*.json ./
RUN npm install

# Copy the rest of the code
COPY . .

# Build React (optional for frontend)
# RUN npm run build

# Expose port and start app
EXPOSE 3000
CMD [ "npm", "start" ]
