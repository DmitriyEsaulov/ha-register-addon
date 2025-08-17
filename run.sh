#!/bin/bash

HOST=${SERVER_HOST:-"194.87.95.97"}
PORT=${SERVER_PORT:-8080}

echo "HA Register Add-on started"
echo "Target server: $HOST:$PORT"

while true; do
  MAC=$(cat /sys/class/net/eth0/address)
  echo "Detected MAC: $MAC"

  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X POST "http://$HOST:$PORT/register" -d "mac=$MAC")
  echo "MAC sent to server, response code: $RESPONSE"

  sleep 60
done
