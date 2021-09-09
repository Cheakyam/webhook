FROM python:alpine

LABEL maintainer="Cheakyam"

RUN pip install flask

# COPY src /src/

VOLUME [ "/opt/webhook" ]

RUN mkdir /opt/webhook

WORKDIR /opt/webhook

RUN cd /opt/webhook

EXPOSE 5000

ENTRYPOINT ["python", "/opt/webhook/src/app.py"]

# COPY hooks.json /etc/webhook/hooks.json
# CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]