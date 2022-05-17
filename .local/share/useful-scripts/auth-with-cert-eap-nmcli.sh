#!/bin/bash

nmcli connection add \
 type wifi con-name "MySSID" ifname wlp3s0 ssid "MySSID" -- \
 wifi-sec.key-mgmt wpa-eap 802-1x.eap tls 802-1x.identity "USERNAME" \
 802-1x.ca-cert ~/ca.pem 802-1x.client-cert ~/cert.pem \
 802-1x.private-key-password "..." 802-1x.private-key ~/key.pem
