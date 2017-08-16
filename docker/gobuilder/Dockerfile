FROM golang:alpine

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN apk add --update alpine-sdk && \
    apk add --update curl && \
    apk add --update bash && \
    rm -rf /var/cache/apk/* && \
    curl https://glide.sh/get | sh
[]