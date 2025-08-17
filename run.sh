#!/bin/bash

HOST=${SERVER_HOST:-"194.87.95.97"}
PORT=${SERVER_PORT:-8080}

echo "[INFO] HA Register Add-on started"
echo "[INFO] Target server: $HOST:$PORT"

# Определяем сетевой интерфейс (берём первый найденный)
IFACE=$(ls /sys/class/net | grep -v lo | head -n 1)
echo "[INFO] Using interface: $IFACE"

while true; do
  MAC=$(cat /sys/class/net/$IFACE/address)
  echo "[INFO] Detected MAC: $MAC"

  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X POST "http://$HOST:$PORT/register" -d "mac=$MAC")
  echo "[INFO] MAC sent to server, response code: $RESPONSE"

  sleep 60
done

