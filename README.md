
# Simple script for mounting and un-mounting external drives

A script that mounts and unmounts usb drives. <br>
Made for and tested with raspberry pi. <br>

<br>

## Quick start:

First download if you havent already: <br>
`$ git clone https://github.com/WestleyK/drive-mounting-script.git` <br>
<br>
Then you can install the `drive-mounter` command: <br>
`$ ./install` <br>
Now you should be able to type `drive-mounter` insted of running the script. <br>
<br>
To uninstall just do: <br>
`$ ./install -u` <br>
<br>
Or you can run the script <br>
`$ ./mount-driver-vX.X.sh` <br>	
<br>
Then select the number that corresponds with the drive you want to mount/unmount, <br>
For example, you want to mount the first option, so type `1` <br>
  
```
$ ./mount-driver-vX.X.sh 


1:/dev/sda1  *     8064 30277631 30269568 14.4G  c W95 FAT32 (LBA)
2:/dev/sdb1           2 126353407 126353406 60.3G  b W95 FAT32

what would you like to mount or un-mount? [1-8]
```
<br>

Then you can select to `(m)mount, (u)un-mount or (r)remount?  [m,u,r]` <br>
See, simple! :)  

```
$ ./mount-driver-v5.0.sh 


1:/dev/sda1  *     8064 30277631 30269568 14.4G  c W95 FAT32 (LBA)
2:/dev/sdb1           2 126353407 126353406 60.3G  b W95 FAT32

what would you like to mount or un-mount? [1-8]1

/dev/sda1

(m)mount, (u)un-mount or (r)remount?  [m,u,r]
```

<br>

**Note:** By defalt the sctipt will mount to `/media/pi` <br>	
You can easily change that in the script by changeing `mount_point=$"/media/pi"` on line 14 <br>

<br>


## More usage:

for more usage and abilities, type: <br>
`$ ./mount-driver-vX.X.sh -help` <br>

<br>




## End README

<br>


