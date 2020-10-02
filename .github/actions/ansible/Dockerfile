FROM alpine

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apk add gcc python3-dev py3-pip libc-dev libffi-dev openssl-dev musl-dev postgresql-dev
RUN pip3 install ansible sqlalchemy google-cloud-storage psycopg2-binary fuzzywuzzy
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
