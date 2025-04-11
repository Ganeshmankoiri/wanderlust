# Dockerfile
FROM node:18

WORKDIR /app

ARG APP_DIR
COPY ${APP_DIR}/package*.json ./

RUN npm install --legacy-peer-deps && npm install -g vite

COPY ${APP_DIR}/ .

EXPOSE 3000

CMD ["npm", "run", "dev"]


