FROM teddysun/v2ray:latest AS build
FROM node:20-alpine
WORKDIR /root
COPY --from=build /usr/bin/v2ray /usr/bin/v2ray
COPY config.json /etc/v2ray/config.json
COPY key.pem /etc/v2ray/key.pem
COPY cert.pem /etc/v2ray/cert.pem
CMD ["v2ray","run","-c","/etc/v2ray/config.json"]
