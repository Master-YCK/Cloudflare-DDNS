/bin/bash
# Ensure the script has execute permissions
# chmod +x cloudflare-ddns.sh
# To run this script every 5 minutes, add the following line to your crontab:
# */5 * * * * /bin/bash [Your_Path]/cloudflare-ddns.sh
# You can edit your crontab by running `crontab -e` in the terminal.

# Replace with your Cloudflare Zone ID and Record ID
# You can find these in your Cloudflare dashboard or via the API
CF_TOKEN=[YOUR_CLOUDFLARE_API_TOKEN]
CF_ZONE_ID=[YOUR_CLOUDFLARE_ZONE_ID]
CF_RECORD_ID=[YOUR_CLOUDFLARE_RECORD_ID]

# Domain name
# Replace with your actual domain name
DOMAIN=[YOUR_DOMAIN_NAME]

# Manage log file size
LOG_FILE="$(dirname "$0")/Cloudflare_DDNS_API.log"
MAX_LOG_SIZE=1048576  # 1MB in bytes

INTERNET_IP=`curl -s http://ipv4.icanhazip.com`
DNS_RECORD_IP=`dig ${DOMAIN} | grep "${DOMAIN}" | grep -v ';' | awk '{print$5}'`

if [ "$INTERNET_IP" != "$DNS_RECORD_IP" ]
then
    curl -X PUT "https://api.cloudflare.com/client/v4/zones/${CF_ZONE_ID}/dns_records/${CF_RECORD_ID}" \
        -H "Authorization: Bearer ${CF_TOKEN}" \
        -H "Content-Type: application/json" \
        --data '{"type":"A","name":"@","content":"'${INTERNET_IP}'","proxied":false}'
    echo "Renew IP: ${DNS_RECORD_IP} to ${INTERNET_IP}, Execution time: $(date)" >> "$(dirname "$0")/Cloudflare_DDNS_API.log"
else
    echo "No change: ${INTERNET_IP}, Execution time: $(date)" >> "$(dirname "$0")/Cloudflare_DDNS_API.log"
fi

if [ -f "$LOG_FILE" ] && [ $(stat -c%s "$LOG_FILE") -ge $MAX_LOG_SIZE ]; then
    mv "$LOG_FILE" "${LOG_FILE}.old"
    echo "Log file rotated: $(date)" > "$LOG_FILE"
fi