FROM node:18

# Accept APP_DIR from docker-compose
ARG APP_DIR

WORKDIR /app

# Copy only the app folder (frontend or backend)
COPY ${APP_DIR}/package*.json ./

RUN npm install

COPY ${APP_DIR} .

EXPOSE 3000
CMD [ "npm", "start" ]
