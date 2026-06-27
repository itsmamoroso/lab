FROM ubuntu:24.04

RUN apt update && apt upgrade -y

WORKDIR /app
COPY . /app
RUN chmod 700 ./greet
ENV GREETING=""
ENV NAME=""

ENTRYPOINT ["./greet"]
