#!/bin/bash

echo "HA Register Add-on started"

# Получаем MAC-адрес
MAC=$(cat /sys/class/net/eth0/address)
echo "Detected MAC: $MAC"

# Отправляем на сервер
curl -X POST "http://194.87.95.97:8080/register" -d "mac=$MAC"
echo "MAC sent to server"

# Держим аддон активным и логируем
while true; do
  echo "HA Register running..."
  sleep 60
done
