Run posgres container

``docker run --name postgre -e POSTGRES_PASSWORD=blabla -e POSTGRES_USER=admin -v /var/lib/postgresql/data -ti -d postgres``

Create database and user

``docker run -it --link postgre:database --rm postgres sh -c 'exec psql -h database -p 5432 -U admin'``

```
CREATE USER owncloud WITH PASSWORD 'password';
CREATE DATABASE owncloud TEMPLATE template0 ENCODING 'UNICODE';
ALTER DATABASE owncloud OWNER TO owncloud;
GRANT ALL PRIVILEGES ON DATABASE owncloud TO owncloud;
```

Create owncloud image with decrypt config.php

```
gpg -d config.php.gpg > config.php
docker build -t jhanos/owncloud .
```

Restore data

``sudo tar -xzf /SAVE/owncloud-data.tar.gz -C /``


Restore Database

``zcat  /SAVE/database.sql.gz | docker exec -i postgre psql -U admin``

Run owncloud containter

``docker run -p 32811:80  -it -d --name owncloud --link postgre:database -v /var/owncloud:/var/www/owncloud/data jhanos/owncloud``

Create Certificate 

```
docker run -it --rm -p 443:443 -p 80:80 --name letsencrypt -v "/etc/letsencrypt:/etc/letsencrypt" -v "/var/lib/letsencrypt:/var/lib/letsencrypt" quay.io/letsencrypt/letsencrypt:latest --agree-dev-preview --server https://acme-v01.api.letsencrypt.org/directory auth
docker run -it --rm -p 443:443 -p 80:80 --name letsencrypt -v "/etc/letsencrypt:/etc/letsencrypt" -v "/var/lib/letsencrypt:/var/lib/letsencrypt" quay.io/letsencrypt/letsencrypt:latest renew
cat /etc/letsencrypt/live/www.thonis.eu/cert.pem > /etc/ssl/thonis.eu/www.thonis.eu.pem
cat /etc/letsencrypt/live/www.thonis.eu/privkey.pem >> /etc/ssl/thonis.eu/www.thonis.eu.pem
cat /etc/letsencrypt/live/www.thonis.eu/chain.pem >> /etc/ssl/thonis.eu/www.thonis.eu.pem
```
