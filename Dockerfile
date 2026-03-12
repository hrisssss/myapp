# ===== STAGE 1: Builder =====
FROM node:18-alpine AS builder

WORKDIR /app
COPY package.json .
COPY app.js .

# ===== STAGE 2: Runner (image final lebih kecil) =====
FROM node:18-alpine

WORKDIR /app
# Hanya copy hasil dari stage builder, bukan semua file
COPY --from=builder /app/node_modules ./node_modules
COPY app.js .

EXPOSE 3000
CMD ["node", "app.js"]
