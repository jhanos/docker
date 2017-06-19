#!/bin/bash

## Script for save nextcloud data and database (data are stored in /save) 

rm -f /SAVE/owncloud-data.tar.gz /SAVE/database.sql.gz
sudo tar -czf /SAVE/nextcloud-data.tar.gz /var/nextcloud
docker exec nextcloud_database_1 pg_dumpall -U nextcloud | gzip > /SAVE/database.sql.gz
