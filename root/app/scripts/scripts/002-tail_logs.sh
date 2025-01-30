#!/usr/bin/env bash
set -e

######################################################################################################################################
######  LOG_FOLDER
######################################################################################################################################
LOG_FOLDER=/app/logs
if [ ! -d "$LOG_FOLDER" ]; then
    mkdir -m 0777 -p $LOG_FOLDER
    echo "Folder ${LOG_FOLDER} created"
fi

touch $LOG_FOLDER/cron.log
tail -f $LOG_FOLDER/cron.log