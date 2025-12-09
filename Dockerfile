FROM node:20-alpine
RUN apk add --no-cache  v2ray
WORKDIR /root

COPY config.json /etc/v2ray/config.json
COPY key.pem /etc/v2ray/key.pem
COPY cert.pem /etc/v2ray/cert.pem




CMD ["v2ray","run","-c","/etc/v2ray/config.json"]
