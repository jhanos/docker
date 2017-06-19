FROM alpine

ARG NEXTCLOUD_VERSION=12.0.0

RUN deluser xfs && adduser -h /var/www -D -u 33 www-data

#RUN apk add --update php7-fpm php7-json php7-intl php7-mcrypt php7-pdo php7-zip php7-gd php7-dom php7-xml php7-ctype php7-curl php7-iconv php7-zlib php7-xmlreader php7-pgsql php7-pdo_pgsql php7-openssl openssl && \

# workaround for bug with random generator ( need latest repository for php 7.1.6 so use php5)
RUN apk --update add  php5-fpm php5-json php5-intl php5-mcrypt php5-pdo php5-zip php5-gd php5-dom php5-xml php5-ctype php5-curl php5-iconv php5-zlib php5-xmlreader php5-pgsql php5-pdo_pgsql php5-openssl openssl && \
#    sed -i 's/127.0.0.1:9000/9000/g' /etc/php7/php-fpm.d/www.conf && \
#    sed -i 's/nobody/www-data/g' /etc/php7/php-fpm.d/www.conf && \
    sed -i 's/127.0.0.1:9000/9000/g' /etc/php5/php-fpm.conf && \
    sed -i 's/nobody/www-data/g' /etc/php5/php-fpm.conf && \
    wget -O /tmp/nextcloud.tar.bz2 https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2 && \
    wget -O /tmp/nextcloud.tar.bz2.md5 https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2.md5 && \
    cd /tmp && md5sum nextcloud.tar.bz2 && \
    tar -xjf /tmp/nextcloud.tar.bz2 -C /var/www && \
    chown -R www-data /var/www/ && \
    rm /tmp/nextcloud.tar.bz2 /tmp/nextcloud.tar.bz2.md5 && \
    rm -rf /var/cache/apk/*

#COPY config.php /var/www/nextcloud/config/config.php

EXPOSE 80

VOLUME /var/www

#CMD /usr/sbin/php-fpm7 --nodaemonize
CMD /usr/bin/php-fpm --nodaemonize
