#!/bin/bash

echo "Please wait while state becomes ready..."

until [ -f /tmp/state_ready ]
do
     sleep 1
done

docker exec root_client_1 conjur policy load -b root -f /policies/root.yml

echo "You are ready to begin!"