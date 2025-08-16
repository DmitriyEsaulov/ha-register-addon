ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.2
FROM $BUILD_FROM

RUN apk add --no-cache curl iproute2 bash

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
