#! /bin/bash
# 1st argument = IP -> 192.168.1.150 = master , then  192.168.1.151, ... workers
# 2nd argument = zerotier_network_id
# 3rd argument = zerotier_token
# 4rd argument = github username
# 5th argument = hostname
apt install -y curl jq
echo -e "interface wlan0\nstatic ip_address=$1\nstatic routers=192.168.1.1\nstatic domain_name_servers=186.183.22.1" >> /etc/dhcpcd.conf
sudo -u pi ssh-keygen -t rsa -N ''
for row in $(curl "https://api.github.com/users/$4/keys" | jq '.[] | .key')
    do
    echo $row | tr -d '"' | tr -d "\n" | sed 's/ssh-rsa/\nssh-rsa /g' >> /home/pi/.ssh/authorized_keys
    done
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sudo cat /etc/hostname | sed "s/raspberrypi/$5/g" > /etc/hostname
sudo cat /etc/hosts | sed "s/raspberrypi/$5/g" > /etc/hosts
curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join $2
sleep 5
curl -X POST "https://my.zerotier.com/api/network/$2/member/$(zerotier-cli info | cut -d " " -f 3)" -H "Content-Type: application/json" -H "Authorization: bearer $3" -d "{\"config\": {\"authorized\": true} }"