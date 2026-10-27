FROM node:20-bookworm-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssl \
    && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
COPY prisma ./prisma
RUN npm ci && npx prisma generate

COPY . .

CMD ["sh", "-c", "npx prisma migrate deploy && node deploy-commands.js && exec node index.js"]
