#!/bin/bash
#
# https://github.com/WestleyK/drive-mounting-script
# Created by: Westley K
# Date: Jun 28, 2018
# version-1.1-auto
# Designed and tested on raspberry pi
#
# this install script must be runed as root or sudo
# sudo ./install.sh


# check if your root
if [[ "$EUID" -ne 0 ]]; then 
	echo "Please run as root"
	echo "sudo ./auto-install.sh"
	exit
fi

option=$1
if [[ -n $option ]]; then
	case $option in
		-h | -help)
			echo "usage ./install [option]
		-h | -help (display help menu)
		-c (check if on latest version) (comming soon)
		-u (un-install command)"
			exit
			;;
		-c)
			echo "comming soon!"
			exit
			;;
		-u)
			un_install=$"true"
			echo "un-installing"
			;;
		*)
			echo "option not found :o try: ./install -help"
			;;
	esac
fi


echo "drive-mounter installer"
echo "https://github.com/WestleyK/drive-mounting-script"
echo "./install -help (for help)"
echo


# check if we need to un-install
if [[ $un_install == "true" ]]; then
	check_script=$( ls /usr/bin | grep drive-mounter )
	if [[ -z $check_script ]]; then
		echo "nothing to un-install"
		exit
	fi
	echo "are you sure you want to un-install drive-mounter"
	echo -n "[y,n]:"
	read input
	echo
	if [[ $input == "y" || $input == "Y" ]]; then
		echo "un-installing..."
		sudo rm /usr/bin/drive-mounter
		echo "un-installed"
		exit
	fi
fi


# check if its installed aready
check_script=$( ls /usr/bin | grep drive-mounter )
if [[ -n $check_script ]]; then 
	echo "it seems like its already installed"
	exit
fi

# is this raspberry pi?
os_check=$( uname -a | grep 'raspberrypi' )
if [[ -n $os_check ]]; then
	# check if the script is still here
	check_script=$( ls raspberry-pi | grep drive-mounter )
	if [[ -z $check_script ]]; then 
		echo "No script to install."
		exit
	fi
	echo "Installing for raspberry pi..."

	# the install part
	sudo chmod 777 raspberry-pi/drive-mounter
	sudo cp raspberry-pi/drive-mounter /usr/bin

	echo "Installed!"
	echo
	echo "(drive-mounter) is installed."
	echo "See: drive-mounter -help (for help)"
else	
	# check if the script is still here
	check_script=$( ls linux-ubuntu | grep drive-mounter )
	if [[ -z $check_script ]]; then 
		echo "No script to install."
		exit
	fi
	echo "Installing for linux/ubuntu..."

	# the install part
	chmod 777 linux-ubuntu/drive-mounter-root
	cp linux-ubuntu/drive-mounter /usr/bin

	echo "Installed!"
	echo
	echo "(drive-mounter) is installed."
	echo "See: drive-mounter -help (for help)"
fi



#
# End install script
#

