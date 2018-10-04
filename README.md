
# A simple script for mounting and unmounting external drives.

A script that mounts and unmounts USB drives. <br>
Made for and tested with raspberry pi and ubuntu. <br>
<br>

## Better script comming soon!

<br>

## Quick start:

First download if you haven't already: <br>
`$ git clone https://github.com/WestleyK/drive-mounting-script.git` <br>
<br>
Then you can install the `drive-mounter` command: <br>
`$ ./auto-install.sh` <br>
Now you should be able to type `drive-mounter` insted of running the script. <br>
<br>
For more info on installing or uninstalling, click [here](#install-and-uninstall). <br>
<br>

## User inerface:

After you run the command you can select a number that corresponds with the drive. <br>
For example, you want to mount the first option, so type `1` <br>
  
```
$ drive-mounter
https://github.com/WestleyK/drive-mounting-script



1:/dev/sda1  *     8064 30277631 30269568 14.4G  c W95 FAT32 (LBA)
2:/dev/sdb1           2 126353407 126353406 60.3G  b W95 FAT32

what would you like to mount or un-mount? [1-8]
```
<br>

Then you can select to `(m)mount, (u)un-mount or (r)remount?  [m,u,r]` <br>
See, simple! :)  

```
$ drive-mounter
https://github.com/WestleyK/drive-mounting-script



1:/dev/sda1  *     8064 30277631 30269568 14.4G  c W95 FAT32 (LBA)
2:/dev/sdb1           2 126353407 126353406 60.3G  b W95 FAT32

what would you like to mount or un-mount? [1-8]1

/dev/sda1

(m)mount, (u)un-mount or (r)remount?  [m,u,r]
```

<br>

## Option menu:

Here are all the options avalable:

```
$ drive-mounter -help
	usage: driver-mounter [-option]
-h | -help | --help (display help menu)
-a | -all (unmount all drives)
-d (display all drives, mounted or not)
-m (mount drive only if there one)
-p (temporally change the mount point when mounting drive) (defalt:/media/pi)
-r (remount the drive, this only works if one drive is connected)
```	

<br>
<br>


## Install and uninstall:

For quick install, do: <br>
`$ ./auto-install.sh` <br>
<br>
For uninstall, do: <br>
`$ ./auto-install.sh -u` <br>
<br>

### Manually install:

For manual install, do: <br>
`$ sudo chmod 777 raspberry-pi/drive-mounter && sudo cp -i raspberry-pi/drive-mounter /usr/bin/` for raspberry pi <br>
<br>
Or for linux/ubuntu, do: <br>
`$ sudo chmod 777 linux-ubuntu/drive-mounter[-root] && sudo cp -i linux-ubuntu/drive-mounter[-root]` <br>
<br>

### Manuall uninstall:

For manual uninstall, do: <br>
`$ sudo rm /usr/bin/drive-mounter` <br>
<br>
<br>

## Changing the mount point:

If you just want to change the mount point temporally: <br>
Then do `$ drive-mounter -p`. Otherwise, the instructions are below. <br>
<br>
By defalt the sctipt will mount to `/media/pi` for raaspberry pi, and `/media/usb-drives` for linux/ubuntu. <br>	
You can easily change this by editing the `driver-mounter`. <br>
For raspberry pi:`$ vim raspberry-pi/drive-mounter`, then uninstall and reinstall. <br>
Or `$ sudo vim /usr/bin/drive-mounter` if you already installed it. <br>
<br>
For linux/ubuntu:`$ vim linux-ubuntu/drive-mounter`, or edit the root script if thats what you will use. <br>
Or `$ sudo vim /usr/bin/drive-mounter` if you already instelled it. <br>

<br>

## Known bugs:

- cant uninstall `linux-ubuntu/drive-mounter-root` by script, have to uninstall manually. <br>
- need sudo to write to usb drive (linux/ubuntu only) <br>
- "-d" option does not work properly for linux/ubuntu. <br>

<br>
<br>


### More usage:

For more usage and abilities, type: <br>
`$ drive-mounter -help` <br>

<br>
<br>



## End README

<br>


