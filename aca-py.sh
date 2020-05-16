#! /bin/bash
echo "##########################################################"
echo "################## Check VON Network IP ##################"
echo "##########################################################"
if [ -z $1 ]
then
  echo "Please specify the VON network IP address"
else

  echo "##########################################################"
  echo "#################### Create Workspace ####################"
  echo "##########################################################"

  mkdir workspace

  cd ~/workspace

  echo "##########################################################"
  echo "#################### Clone ACA-Py Code ###################"
  echo "##########################################################"

  git clone https://github.com/hyperledger/aries-cloudagent-python

  cd ~/workspace/aries-cloudagent-python

  echo "##########################################################"
  echo "####################### Start Agent ######################"
  echo "##########################################################"

  PORTS="8080:8080 8000:8000" \
  scripts/run_docker start --wallet-type indy \
  --seed 000000000000000000000000000Agent \
  --wallet-key welldone \
  --wallet-name myWallet \
  --genesis-url http://$1/genesis \
  --inbound-transport http 0.0.0.0 8000 \
  --outbound-transport http \
  --admin 0.0.0.0 8080 \
  --admin-insecure-mode
fi

