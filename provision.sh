#!/bin/bash

SOLACE_IP=13.53.81.224:8080
CRED=ansible:ansible

CREATE_VPN="
<rpc semp-version=\"soltr/7_9_1VMR\">
<create>
<message-vpn>
<vpn-name>Solace-CICD</vpn-name>
</message-vpn>
</create>
</rpc>
"
START_VPN="
<rpc semp-version=\"soltr/7_9_1VMR\">
<message-vpn>
<vpn-name>Solace-CICD</vpn-name>
<no>
<shutdown></shutdown>
</no>
</message-vpn>
</rpc>
"

echo "${CREATE_VPN}" | curl -d @- -u "${CRED}" http://${SOLACE_IP}/SEMP
echo "${START_VPN}" | curl -d @- -u "${CRED}" http://${SOLACE_IP}/SEMP
