#! /bin/bash
# Script to increase IP HOST

FIRST_IP=$1
IP_HEX=$(printf '%.2X%.2X%.2X%.2X\n' `echo $FIRST_IP | sed -e 's/\./ /g'`)
HOST_IP_HEX=$(printf %.8X `echo $(( 0x$IP_HEX + $4 ))`)
HOST_IP=$(printf '%d.%d.%d.%d\n' `echo $HOST_IP_HEX | sed -r 's/(..)/0x\1 /g'`)
echo -e "interface $4\nstatic ip_address=$HOST_IP\nstatic routers=$2\nstatic domain_name_servers=8.8.8.8" >> /etc/dhcpcd.conf
