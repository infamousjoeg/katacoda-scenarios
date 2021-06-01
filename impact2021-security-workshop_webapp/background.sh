#!/bin/bash

apt-get update
apt-get install -y mysql-client-core-5.7 jq

docker run --name lamp -d -p "80:80" -v ${PWD}/app:/app mattrayner/lamp:latest-1804
docker exec lamp mysql -h localhost -uroot \
    -e "CREATE DATABASE conjur_demo; CREATE USER 'devapp1' IDENTIFIED BY 'Cyberark1'; GRANT ALL PRIVILEGES ON conjur_demo.* TO 'devapp1'; FLUSH PRIVILEGES;"

curl -fsSL cybr.rocks/conjur-install | bash -s

echo "done" >> /root/katacoda-finished

docker cp /policies/* root_client_1:/policies/
docker exec root_client_1 conjur policy load root /policies/root.yml > demouser.txt

echo "alias conjur='docker exec root_client_1 conjur'" >> /root/.bashrc
source /root/.bashrc

echo "done" >> /root/katacoda-background-finished