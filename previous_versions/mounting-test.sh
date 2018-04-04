#!/bin/bash

echo 
sudo fdisk -l | grep '^/dev/s' | cut -f 1,8,9,10,11 -d ' '
echo
echo "what would you like to mount/un-mount?"
read input
varloc=$( sudo fdisk -l | grep '^/dev/s' | cut -f 1 -d ' ' | grep $input )
echo 
echo "$varloc"
echo 
echo "mount or un-mount?"
echo "[m,u]"
read input2
if [[ $input2 == "m" || $input2 == "M" ]]; then
	echo "mounting..."
	sleep 3s
	sudo mount $varloc /media/pi
	echo "mounted"
else
	if [[ $input2 == "u" || $input == "U" ]]; then
		echo "unmounting..."
		sleep 3s
		sudo umount $varloc
		echo "unmounted"
	fi
fi

