FROM python:alpine

RUN set -eux && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

LABEL maintainer="Cheakyam"

RUN pip install flask

RUN apk add git

RUN mkdir /opt/webhook

VOLUME [ "/opt/webhook" ]

WORKDIR /opt/webhook

RUN cd /opt/webhook

EXPOSE 5000

ENTRYPOINT ["python", "/opt/webhook/src/app.py"]

# COPY hooks.json /etc/webhook/hooks.json
# CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]