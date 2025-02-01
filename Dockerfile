FROM waazaafr/alpine-base:@@ALPINE_VERSION@@

# Retrait de supervisor de l'image alpine-base
RUN rm -rf /etc/supervisor/ /app/scripts/
# Copie de la source et rends exécutable
COPY ./root /
RUN chmod a+x /usr/local/bin/process-compose /app/scripts/scripts/*.sh

# Dossier de travail
WORKDIR /app

# CMD
CMD ["/app/scripts/startup.sh"]
