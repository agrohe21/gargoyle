#!/bin/sh

current_date_time=$(date +"%Y-%m-%d-%H-%M-%S")

/root/projects/gargoyle/scripts/get_hosts.sh       >> /tmp/usb_mount/dev_sda1/nfs/hosts-$current_date_time
/root/projects/gargoyle/scripts/get_conn_hosts.sh  >> /tmp/usb_mount/dev_sda1/nfs/conn_hosts-$current_date_time
/root/projects/gargoyle/scripts/get_ethers.sh      >> /tmp/usb_mount/dev_sda1/nfs/ethers-$current_date_time
/root/projects/gargoyle/scripts/get_dhcp_leases.sh >> /tmp/usb_mount/dev_sda1/nfs/dhcp_leases-$current_date_time
/root/projects/gargoyle/scripts/get_quotas.sh      >> /tmp/usb_mount/dev_sda1/nfs/quotas-$current_date_time
/root/projects/gargoyle/scripts/get_quota_dim.sh   >> /tmp/usb_mount/dev_sda1/nfs/quota_dim-$current_date_time
