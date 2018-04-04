#!/bin/bash

# date code 1740
# version 4.0

echo
echo
sudo fdisk -l | grep '^/dev/s' | grep -n 'dev/s'
notest=$( sudo fdisk -l | grep '^/dev/s' | grep -n 'dev/s' )
if [[ -z $notest ]]; then
	echo "there is nothing you can mount or un-mount"
	echo
	exit
fi
echo
read -p "what would you like to mount or un-mount? [1-8]" -n 1 -r
echo
sleep 0.25s
if [[ $REPLY != [1-8] ]]; then
	echo
	echo "???"
	echo
	exit
fi
varloc=$( sudo fdisk -l | grep '^/dev/s' | grep -n '/dev/s' | grep ^$REPLY | cut -f 1 -d ' ' | cut -c3- )
if [[ -z $varloc ]]; then 
	echo
	echo "WRONG MOVE!"
	echo
	exit
fi
echo 
echo $varloc
echo
read -p "(m)mount, (u)un-mount or (r)remount?  [m,u,r]" -n 1 -r
echo
case $REPLY in
	m)
		echo "mounting..."
		sleep 0.1s
		sudo mount $varloc /media/pi -o uid=pi,gid=pi
		echo "mounted to media/pi"
		exit
		;;
	M)
		echo "mounting..."
		sleep 0.1s
		sudo mount $varloc /media/pi -o uid=pi,gid=pi
		echo "mounted to media/pi"
		;;
	u)
		echo -n "un-mounting..."
		sleep 0.1s
		sudo umount $varloc
		echo "un-mounted"
		echo "done"
		exit
		;;
	U)
		echo -n "un-mounting..."
		sleep 0.1s
		sudo umount $varloc
		echo "un-mounted"
		echo "done"
		exit
		;;
	r)
		echo "remounting..."
		sudo umount $varloc
		echo -n "unmounted, "
		sleep 0.1s
		echo -n "mounting..."
		sudo mount $varloc /media/pi -o uid=pi,gid=pi
		echo "done"
		exit
		;;
	R)
		echo "remounting..."
		sudo umount $varloc
		echo -n "unmounted, "
		sleep 0.1s
		echo -n "mounting..."
		sudo mount $varloc /media/pi -o uid=pi,gid=pi
		echo "done"
		exit
		;;
esac

			
#	if [[ $REPLY == "m" || $REPLY == "M" ]]; then
#		echo "mounting..."
#		sleep 0.1s
#		sudo mount $varloc /media/pi -o uid=pi,gid=pi
#		echo "mounted to /media/pi"
#	else
#		if [[ $REPLY == "u" || $REPLY == "U" ]]; then
#			echo -n "unmounting..."
#			sleep 0.1s
#			sudo umount $varloc
#			echo "unmounted"
#			echo "done"
#		else
#			if [[ $REPLY == "r" || $REPLY == "R" ]]; then
#				echo "remounting..."
#				sudo umount $varloc
#				echo -n "unmounted, "
#				sleep 0.1s
#				echo -n "mounting..."
#				sudo mount $varloc /media/pi -o uid=pi,gid=pi
#				echo "done"
#			fi
#			echo
#			echo "err"
#			echo "wrong input!"
#			echo
#			exit
#		fi
#	fi
#done
#
