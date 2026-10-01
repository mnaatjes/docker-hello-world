# Stage 1: Build static documentation
FROM node:20-alpine AS builder

WORKDIR /build

COPY package.json package-lock.json* ./
RUN npm install

COPY docs/ ./docs/
RUN npm run docs:build

# Stage 2: Serve via unprivileged Caddy
FROM caddy:2-alpine

WORKDIR /srv/www

# Copy static assets from builder stage
COPY --from=builder /build/docs/.vitepress/dist /srv/www

# Copy server configuration
COPY config/Caddyfile /etc/caddy/Caddyfile

# Ensure log directory exists and is writable
RUN mkdir -p /var/log/caddy && chown -R 1000:1000 /var/log/caddy

EXPOSE 8080

HEALTHCHECK --interval=10s --timeout=3s --retries=3 --start-period=5s \
  CMD ["wget", "--no-verbose", "--tries=1", "--spider", "http://localhost:8080/"]

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
