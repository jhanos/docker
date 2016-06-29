FROM alpine

ENV OWNCLOUD_VERSION 9.0.1

COPY config.php /var/www/owncloud/config/config.php

RUN apk add --update php-fpm php-json php-intl php-mcrypt php-pdo php-zip php-gd php-dom php-xml php-ctype php-curl php-iconv php-zlib php-xmlreader php-pgsql php-pdo_pgsql gpgme openssl && \
    deluser xfs && \
    adduser -h /var/www -D -u 33 www-data && \
    sed -i 's/127.0.0.1:9000/9000/g' /etc/php/php-fpm.conf && \
    sed -i 's/nobody/www-data/g' /etc/php/php-fpm.conf && \
    wget -O /tmp/owncloud.tar.bz2 https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.tar.bz2 && \
    wget -O /tmp/owncloud.tar.bz2.asc https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.tar.bz2.asc && \
    wget -O /tmp/owncloud.asc https://owncloud.org/owncloud.asc && \
    gpg --import /tmp/owncloud.asc && \
    gpg --verify /tmp/owncloud.tar.bz2.asc && \
    tar -xjf /tmp/owncloud.tar.bz2 -C /var/www && \
    chown -R www-data /var/www/ && \
    rm /tmp/owncloud.tar.bz2 /tmp/owncloud.tar.bz2.asc /tmp/owncloud.asc && \
    apk --update del gpgme && \
    rm -rf /var/cache/apk/*


VOLUME /var/www
EXPOSE 9000
CMD /usr/bin/php-fpm --nodaemonize
