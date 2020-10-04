FROM alpine:latest

RUN apk add ansible python3-dev python3-pip gcc

LABEL mainter="David Bour <dbour.developer@gmail.com>"

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
