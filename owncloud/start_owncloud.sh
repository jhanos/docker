#!/bin/sh

touch /var/log/nginx/access.log
touch /var/log/nginx/error.log
mkdir /var/log/cron
touch /var/log/cron/owncloud.log
chown -R www-data /var/www/owncloud/

echo "Starting server ..."

tail --follow --retry /var/log/nginx/*.log /var/log/cron/owncloud.log & \
/usr/sbin/cron -f & \
/etc/init.d/php5-fpm start
/etc/init.d/nginx start
/bin/bash
