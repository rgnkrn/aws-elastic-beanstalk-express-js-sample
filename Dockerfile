# ISEC6000 Secure DevOps
# Assignment 2 Automating Security in CI/CD: Node.js CI/CD with Jenkins
# P2_21920781
# Docker File

FROM node:16-bullseye

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy application code
COPY . .

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Start the application
CMD ["npm", "start"]