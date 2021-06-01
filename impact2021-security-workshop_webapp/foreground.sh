#!/bin/bash

docker exec root_client_1 conjur policy load -b root -f /policies/root.yml
echo "You are ready to begin!"