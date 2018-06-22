#!/bin/bash

# date code 1740
# uptdated on 1814
# date April 4, 2018
# version 4.2
# designed and tested on raspberry pi

# 8 diffrent drives maxinum, NOT RECOMMENDED FOR MORE THEN ONE DRIVE!
# this version will not unmount drives when mounting, DO NOT MOUNT NORE THAN ONE DRIVE!

echo
echo
# check if theres anything to mount or unmount
sudo fdisk -l | grep '^/dev/s' | grep -n 'dev/s'
whats_to_mount=$( sudo fdisk -l | grep '^/dev/s' | grep -n 'dev/s' )
if [[ -z $whats_to_mount ]]; then
	echo "there is nothing you can mount or un-mount"
	echo
	exit
fi
echo
read -p "what would you like to mount or un-mount? [1-8]" -n 1 -r
# 8 maxinum diffrent drives
echo
sleep 0.25s
  # to avoid bouncing, LOL
if [[ $REPLY != [1-8] ]]; then
	echo
	echo "???"
	echo
	exit
fi
# get the location of the disk
disk_loca=$( sudo fdisk -l | grep '^/dev/s' | grep -n '/dev/s' | grep ^$REPLY | cut -f 1 -d ' ' | cut -c3- )
if [[ -z $disk_loca ]]; then 
	echo
	echo "WRONG MOVE!"
	echo
	exit
fi
echo 
echo $disk_loca
echo
read -p "(m)mount, (u)un-mount or (r)remount?  [m,u,r]" -n 1 -r
echo
case $REPLY in
	m)
		echo "mounting..."
		sleep 0.2s
		sudo mount $disk_loca /media/pi -o uid=pi,gid=pi
		echo "mounted to media/pi"
		exit
		;;
	M)
		echo "mounting..."
		sleep 0.2s
		sudo mount $disk_loca /media/pi -o uid=pi,gid=pi
		echo "mounted to media/pi"
		;;
	u)
		echo -n "un-mounting..."
		sleep 0.2s
		sudo umount $disk_loca
		echo "un-mounted"
		echo "done"
		exit
		;;
	U)
		echo -n "un-mounting..."
		sleep 0.2s
		sudo umount $disk_loca
		echo "un-mounted"
		echo "done"
		exit
		;;
	r)
		echo "remounting..."
		sudo umount $disk_loca
		echo -n "unmounted, "
		sleep 0.2s
		echo -n "mounting..."
		sudo mount $disk_loca /media/pi -o uid=pi,gid=pi
		echo "done"
		exit
		;;
	R)
		echo "remounting..."
		sudo umount $disk_loca
		echo -n "unmounted, "
		sleep 0.2s
		echo -n "mounting..."
		sudo mount $disk_loca /media/pi -o uid=pi,gid=pi
		echo "done"
		exit
		;;
esac

#
# ChangeLog:
#

# --version 4.2-- mount_unmount_v4.2.sh
#   fixed version typo
#   cleaned up script
#   updated date code
#   includes ChangeLog
#   better title

# --version 4.1-- mount_unmount_v4.1.sh
#   now with date code 
#   version typo in script its v4.0 but its v4.1
#   includes case statment when replying
#   reply without pushing enter

# --version 2.8-- mount_unmount_v2.8.sh
#   now mounts without having to use sudo when moving files

# --version 2.6-- mount_unmount_v2.6.sh
#   now with proper name
#   more errers and safety features
#   first stable and usable version

# --version 2.5-- mounting_test_v2.5.sh
#   now exits the script when theres nothing to mount or unmount

# --version 2.3-- mounting_test_v2.3.sh
#   with errer messages

# --version 1.1-- mounting-test_v1.1.sh
#   number select

# --version 1.0-- mounting-test.sh
#   initial release

