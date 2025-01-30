FROM waazaafr/alpine-base:@@ALPINE_VERSION@@

RUN rm -rf /etc/supervisor/ /app/scripts/
COPY ./root /
RUN chmod a+x /usr/local/bin/process-compose /app/scripts/scripts/*.sh

WORKDIR /app

CMD ["/app/scripts/startup.sh"]
