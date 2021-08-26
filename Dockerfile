FROM ubuntu:20.04

LABEL maintainer="Johannes Schnepel"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-requests \
    git \
    build-essential \
    && pip3 install updater \
    && apt-get clean \
    && git clone https://github.com/glinscott/fishtest.git /opt/fishtest

ENV username=yourUsername password=yourPassword concurrency=1

CMD python3 /opt/fishtest/worker/worker.py ${username} ${password} --concurrency ${concurrency} 
