# WPS Office Linux Block Internet

Methods to blocking the internet access of wps office using firejail

## Dependencies:

### Ubuntu 18.04+

As per [firejail github page](https://github.com/netblue30/firejail#ubuntu), they recommend using the PPA instead of the official repos.

```
sudo add-apt-repository ppa:deki/firejail
sudo apt-get update
sudo apt-get install firejail firejail-profiles
```

## Methods

### Method 1:

This is a bash script to change the default `Exec=` parameter on the system `.desktop` files on the directories: 
* `/opt/kingsoft/wps-office/desktops/` and 
* `/usr/share/applications`. 

The `Exec=` parameter is prepended with the command `firejail --net=none` which blocks internet access.

Add this to a bash file and run it:

```bash
#!/bin/bash
# script to automatically change the exec parameter  on .desktop files on wps on
# linux.


# /opt/kingsoft/wps-office/desktops/
cd /opt/kingsoft/wps-office/desktops/
sed -i 's/Exec\=/Exec\=firejail --net=none /g' wps*

# /usr/share/applications
cd /usr/share/applications
sed -i 's/Exec\=/Exec\=firejail --net=none /g' wps*
```

