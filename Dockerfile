FROM --platform=linux/amd64 python:alpine

LABEL maintainer="Johannes Schnepel"

RUN apk update \
    && apk add g++ make git glib \
    && rm -rf /var/cache/apk/* \
    && pip install requests updater \
    && git clone https://github.com/glinscott/fishtest.git /opt/fishtest

ENV username=yourUsername password=yourPassword concurrency=1

CMD python3 /opt/fishtest/worker/worker.py ${username} ${password} --concurrency ${concurrency} 
