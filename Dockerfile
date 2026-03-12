# ===== STAGE 1: Builder =====
FROM node:18-alpine AS builder

WORKDIR /app
COPY package.json .
COPY app.js .

# ===== STAGE 2: Runner =====
FROM node:18-alpine

WORKDIR /app
COPY --from=builder /app/app.js .

EXPOSE 3000
CMD ["node", "app.js"]
EOF
