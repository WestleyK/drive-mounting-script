#!/bin/bash

varloc=$( sudo fdisk -l | grep '^/dev/s' | grep '30548031' | cut -f 1 -d ' ' )
if [[ -z $varloc ]]; then
	exit
fi

ch=$( df -h | grep Desktop )

if [[ -z $ch ]]; then
	sudo umount $varloc &> /dev/null
	sleep 0.1s
	sudo mount $varloc /home/pi/Desktop -o uid=pi,gid=pi
else
	exit
fi

