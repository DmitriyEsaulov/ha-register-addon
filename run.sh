#!/command/with-contenv bashio

VDS_HOST=$(bashio::config 'vds_host')
MAC=$(ip link | awk '/ether/ && !/lo/ {print $2; exit}')

bashio::log.info "Starting HA Register Add-on"
bashio::log.info "Using VDS host: $VDS_HOST"
bashio::log.info "Detected MAC: $MAC"

while true; do
  bashio::log.info "Registering HA with MAC $MAC"
  curl -s -X POST "$VDS_HOST/register"     -H "Content-Type: application/json"     -d "{\"mac\": \"$MAC\"}"     || bashio::log.warning "Failed to register"
  sleep 300
done
