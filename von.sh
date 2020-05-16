#! /bin/bash

echo "Create new workspace folder"

mkdir workspace

cd ~/workspace

echo "Clone VON code"

git clone https://github.com/bcgov/von-network.git

cd ~/workspace/von-network

echo "Build the code"

./manage build

echo "Start the network"

./manage start WEB_SERVER_HOST_PORT=80 "LEDGER_INSTANCE_NAME=My Ledger" &
