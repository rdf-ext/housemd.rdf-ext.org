FROM node:16-alpine AS builder

RUN mkdir -p /build
WORKDIR /build
COPY package*.json .
RUN npm ci

FROM zazuko/trifid:2.3.7

COPY --from=builder /build/node_modules/housemd/dist/housemd.nq .
COPY config*.json .
