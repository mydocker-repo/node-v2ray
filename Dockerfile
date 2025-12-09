FROM node:20-alpine
RUN apk add --no-cache tzdata curl v2ray
WORKDIR /root
RUN echo "Asia/Shanghai" > /etc/timezone
RUN echo "alias ll='ls -la'" > /root/.bashrc && \
    echo "PS1='\[\e[1;32m\][\W]\$\[\e[0m\] '" >> /root/.bashrc

COPY config.json /etc/v2ray/config.json
COPY key.pem /etc/v2ray/key.pem
COPY cert.pem /etc/v2ray/cert.pem

COPY addCFIP.html /usr/share/caddy/
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

# 最终命令：启动 cron 并给 shell
ENTRYPOINT ["/entrypoint.sh"]
CMD ["v2ray","run","-c","/etc/v2ray/config.json"]
