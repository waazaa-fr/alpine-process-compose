#!/usr/bin/env bash
set -e

######################################################################################################################################
######  CRON_FOLDER
######  Si le dossier /var/www/cron n'existe pas alors on le crée
######################################################################################################################################
CRON_FOLDER=/cron
if [ ! -d "$CRON_FOLDER" ]; then
    mkdir -p $CRON_FOLDER
    chmod -R 0777 $CRON_FOLDER
    echo "Folder ${CRON_FOLDER} created"
fi

if [ ! -f "$CRON_FOLDER/cronjob" ]; then
    touch /app/logs/cron.log
    echo "*/1 * * * *  echo '- lancement cron ok' >> /app/logs/cron.log" > $CRON_FOLDER/cronjob
    echo "" >> $CRON_FOLDER/cronjob
fi
chmod 0644 $CRON_FOLDER/cronjob
crontab $CRON_FOLDER/cronjob
crond -f -L 0
echo "${CRON_FOLDER}/cronjob started"