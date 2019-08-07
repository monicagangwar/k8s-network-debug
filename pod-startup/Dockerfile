FROM ubuntu:latest

RUN apt-get update && apt-get install -y iputils-ping

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh