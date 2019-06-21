#!/bin/bash

cd /xel-miner

echo "set config..."

CONF_API_PASS=""
if [ ! -z ${nxt_adminPassword+x} ]
then
  echo "set nxt.adminPassword=HIDDEN"
  CONF_API_PASS="-p \"${nxt_adminPassword}\""
fi

CONF_WALLET_PASSPHRASE=""
if [ ! -z ${miner_wallet_passphrase+x} ]
then
  echo "set miner_wallet_passphrase=HIDDEN"
  CONF_WALLET_PASSPHRASE=${miner_wallet_passphrase}
fi

CONF_NB_THREADS="-t 1"
if [ ! -z ${miner_number_of_threads+x} ]
then
  echo "set miner_number_of_threads=${miner_number_of_threads}"
  CONF_NB_THREADS="-t ${miner_number_of_threads}"
fi

CONF_NODE="http://computation-01.xel.org:17876"
if [ ! -z ${miner_node+x} ]
then
  echo "set miner_node=${miner_node}"
  CONF_NODE="${miner_node}"
fi

echo "start miner with ${CONF_NB_THREADS} thread pointing to ${CONF_NODE}"

./xel_miner ${CONF_NB_THREADS} -P "${CONF_WALLET_PASSPHRASE}" -D -o "${CONF_NODE}" "${CONF_API_PASS}"
