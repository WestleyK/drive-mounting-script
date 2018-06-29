#!/bin/bash
#
# https://github.com/WestleyK/drive-mounting-script
# Created by: Westley K
# Date: Jun 28, 2018
# version-1.0-linux-ubuntu-root
# Designed and tested on ubuntu
#
# this install script must be runed as root
# root$ ./install.sh


# check if your root
if [[ "$EUID" -ne 0 ]]; then 
	echo "Please run as root"
	echo "root$ ./install-root.sh"
	echo "Or if your not root, try the non root install."
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
		rm /usr/bin/drive-mounter
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

# check if the script is still here
check_script=$( ls | grep drive-mounter-root )
if [[ -z $check_script ]]; then 
	echo "No script to install."
	exit
fi
echo "Installing..."

# the install part
chmod 777 drive-mounter-root
cp drive-mounter-root /usr/bin

echo "Installed!"
echo
echo "(drive-mounter) is installed!"
echo "See: drive-mounter -help (for help)"


#
# End install script
#

