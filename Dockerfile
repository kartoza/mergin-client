#FROM python:3.7-alpine as base
FROM ubuntu as base
FROM base as builder
RUN apt update; apt install -y python3-pip
RUN mkdir /install
WORKDIR /install
RUN pip3 install --prefix=/install mergin-client
FROM base
COPY --from=builder /install /usr/local
RUN apt update; apt install -y python3
COPY mergin.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mergin.sh
RUN useradd --create-home --shell /bin/bash mergin
WORKDIR /home/mergin
USER mergin
ENTRYPOINT ["mergin.sh"]
