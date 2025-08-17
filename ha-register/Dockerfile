ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.6
FROM $BUILD_FROM

# Устанавливаем утилиты
RUN apk add --no-cache curl iproute2

# Копируем rootfs (s6-услуга)
COPY rootfs /
