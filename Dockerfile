FROM alpine

RUN apk add --no-cache curl bash

ADD https://github.com/fatedier/frp/releases/download/v0.58.0/frp_0.58.0_linux_amd64.tar.gz /tmp/frp.tar.gz

RUN tar -xzf /tmp/frp.tar.gz -C /tmp && \
    mv /tmp/frp_0.58.0_linux_amd64/frps /usr/local/bin/ && \
    chmod +x /usr/local/bin/frps

COPY frps.ini /frps.ini

CMD ["frps", "-c", "/frps.ini"]
