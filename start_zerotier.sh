#! /bin/bash
# (First argument) = zerotier_network_id
# (Second argument) = zerotier_token
curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join $1
sleep 5
curl -X POST "https://my.zerotier.com/api/network/$1/member/$(zerotier-cli info | cut -d " " -f 3)" -H "Content-Type: application/json" -H "Authorization: bearer $2" -d "{\"config\": {\"authorized\": true} }"