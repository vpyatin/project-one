
up:
	cd phpserver && docker compose up -d && cd .. && php -S 127.0.0.1:8082 -t ./pub/ ./phpserver/router.php

down:
	cd phpserver && docker compose down --remove-orphans

build:
	cd phpserver && docker compose up --build -d && cd ..

install:
	php bin/magento setup:install --base-url=http://127.0.0.1:8082 \
    --db-host=127.0.0.1:33306 --db-name=magento --db-user=magento --db-password=magento \
    --admin-firstname=Vi --admin-lastname=Pya --admin-email=vipya@smile.fr \
    --admin-user=vipya --admin-password=magent0 --language=en_US \
    --currency=USD --timezone=Europe/Kiev --use-rewrites=1 \
    --search-engine=elasticsearch7 --elasticsearch-host=localhost --elasticsearch-port=9200 -vvvv

data:
	bin/magento sampledata:deploy
