FROM alpine

RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    deluser xfs && \
    adduser -h /var/www -D -G www-data -u 33 www-data && \
    chown -R www-data /var/www/ /var/lib/nginx && \
    rm -f /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf
COPY nextcloud.conf /etc/nginx/sites-enabled/default
EXPOSE 80

CMD nginx -g 'daemon off;'
