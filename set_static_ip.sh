#! /bin/bash
# IP arguments 192.168.1.150 = master , 192.168.1.151, ... workers
echo -e "interface wlan0\nstatic ip_address=$1\nstatic routers=192.168.1.1\nstatic domain_name_servers=186.183.22.1" >> /etc/_dhcpcd.conf