FROM node:18

# Create non-root user
RUN useradd -m appuser

WORKDIR /app

ARG APP_DIR

COPY ${APP_DIR}/package*.json ./
RUN npm install --legacy-peer-deps && npm install -g vite

COPY ${APP_DIR}/ .

# Change ownership to non-root user
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

EXPOSE 3000

CMD ["npm", "start"]



