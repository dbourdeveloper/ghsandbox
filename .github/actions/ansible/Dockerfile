FROM willhallonline/ansible:latest

LABEL mainter="David Bour <dbour.developer@gmail.com>"

COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
