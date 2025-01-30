FROM waazaafr/alpine-base:@@ALPINE_VERSION@@

COPY ./root /
RUN chmod a+x /usr/local/bin/process-compose /app/scripts/scripts/*.sh

WORKDIR /app

CMD ["/app/scripts/startup.sh"]
