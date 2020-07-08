#!/bin/bash

IP_SERVICE="http://me.gandi.net"
GANDI_API="https://api.gandi.net/v5/livedns/domains"

IP4=$(curl -s4 $IP_SERVICE)

echo "$GANDI_API"
echo "$GANDI_APIKEY"
echo "$GANDI_RECORD"
echo "$GANDI_DOMAIN"

if [[ -z "$IP4" ]]; then
  echo "Something went wrong. Can not get your IP from $IP_SERVICE "
  exit 1
fi

if [[ ! -z "$IP4" ]]; then
  DATA='{"rrset_type": "A", "rrset_values": ["'$IP4'"]}'
  curl -s -XPUT -d "$DATA" \
    -H "Authorization: Apikey $GANDI_APIKEY" \
    -H "Content-Type: application/json" \
    "${GANDI_API}/${GANDI_DOMAIN}/records/${GANDI_RECORD}/A"
  exit $?
fi

exit 1
