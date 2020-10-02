FROM alpine

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apk add ansible gcc python3-dev python3-pip libc-dev libffi-dev openssl-dev
RUN pip3 install sqlalchemy google-cloud-storage psycopg2-binary fuzzywuzzy
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
