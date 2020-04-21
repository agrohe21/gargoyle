#!/bin/sh

wanup=`/root/projects/gargoyle/scripts/get_wanup.sh`

if [] then
	rm -f /tmp/usb_mount/dev_sda1/nfs/wanup.txt
	touch /tmp/usb_mount/dev_sda1/nfs/wandown.txt
else
	rm -f /tmp/usb_mount/dev_sda1/nfs/wandown.txt
	touch /tmp/usb_mount/dev_sda1/nfs/wanup.txt
fi
