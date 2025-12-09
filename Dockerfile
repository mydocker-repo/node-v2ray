FROM node:20-alpine
RUN apk add --no-cache tzdata curl v2ray
WORKDIR /root
RUN echo "Asia/Shanghai" > /etc/timezone
RUN echo "alias ll='ls -la'" > /root/.bashrc && \
    echo "PS1='\[\e[1;32m\][\W]\$\[\e[0m\] '" >> /root/.bashrc

COPY config.json /etc/v2ray/config.json
COPY key.pem /etc/v2ray/key.pem
COPY cert.pem /etc/v2ray/cert.pem




CMD ["v2ray","run","-c","/etc/v2ray/config.json"]
