Run posgres container

Create nextcloud image with decrypt config.php

```
gpg -d config.php.gpg > config.php
docker-compose build
POSTGRES_PASSWORD=example docker-compose up -d
```

Restore data

``sudo tar -xzf /SAVE/nextcloud-data.tar.gz -C /var/nextcloud/``


Restore Database

``zcat  /SAVE/database.sql.gz | docker exec -i nextcloud_database_1 psql -U admin``

