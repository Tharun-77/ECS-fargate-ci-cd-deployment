# Stage 1

    # Stage 1: Build
FROM --platform=linux/amd64 node:18 AS builder

WORKDIR /build

COPY package*.json ./
RUN npm install

COPY src/ src/
COPY tsconfig.json ./

RUN npm run build

# Stage 2: Runtime
FROM --platform=linux/amd64 node:18 AS runner

WORKDIR /app

# Copy only necessary production files
COPY --from=builder /build/package*.json ./
COPY --from=builder /build/node_modules ./node_modules/
COPY --from=builder /build/dist ./dist/

# Set NODE_ENV to production
ENV NODE_ENV=production

# Expose app port (change if needed)
EXPOSE 8000

# Run the app
CMD ["npm", "start"]
