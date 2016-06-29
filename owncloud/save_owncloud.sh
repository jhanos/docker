#!/bin/bash

## Script for save owncloud data and database (data are stored in /save) 

rm -f /SAVE/owncloud-data.tar.gz /SAVE/database.sql.gz
sudo tar -czf /SAVE/owncloud-data.tar.gz /var/owncloud 
docker exec postgre pg_dumpall -U admin | gzip > /SAVE/database.sql.gz
