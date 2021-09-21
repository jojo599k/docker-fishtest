FROM --platform=linux/amd64 python:slim

LABEL maintainer="Johannes Schnepel"

RUN apt-get update -y \
    && apt-get install -y build-essential git libglib2.0.0 \
    && pip install requests updater \
    && git clone https://github.com/glinscott/fishtest.git /opt/fishtest

ENV username=yourUsername password=yourPassword concurrency=1

CMD python3 /opt/fishtest/worker/worker.py ${username} ${password} --concurrency ${concurrency} 
