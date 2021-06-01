#!/bin/bash

docker run --name lamp -d -p "80:80" -v ${PWD}/app:/app mattrayner/lamp:latest-1804
docker exec lamp mysql -h localhost -uroot \
    -e "CREATE DATABASE conjur_demo; CREATE USER 'devapp1' IDENTIFIED BY 'Cyberark1'; GRANT ALL PRIVILEGES ON conjur_demo.* TO 'devapp1'; FLUSH PRIVILEGES;"
curl -fsSL cybr.rocks/conjur-install | bash -s