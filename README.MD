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

## Usage


This is a bash script that does to things:

1. change the default `Exec=` parameter on the system `.desktop` files on the directories: 

2. create a firejail profile config file in `~/.config/firejail` with the `net none` parameter


* `/opt/kingsoft/wps-office/desktops/` and 
* `/usr/share/applications`. 

The `Exec=` parameter is prepended with the command `firejail --net=none` which blocks internet access.

Add this to a bash file and run it:

```bash
#!/bin/bash
# script to automatically change the exec parameter  on .desktop files on wps on
# linux.

## using firejail profiles

WPS_apps_name=('et' 'wpp' 'wps' 'wpspdf')

firejail_directory=~/.config/firejail
mkdir -p $firejail_directory

for app_name in "${WPS_apps_name[@]}"
do
	profile_dir="$firejail_directory"/"$app_name".profile
	echo -e "net none\ninclude /etc/firejail/"$app_name".profile" > "$profile_dir"
done

## adding the parameter --net=none to the desktop files

# /opt/kingsoft/wps-office/desktops/
cd /opt/kingsoft/wps-office/desktops/
sed -i 's/Exec\=/Exec\=firejail --net=none /g' wps*

# /usr/share/applications
cd /usr/share/applications
sed -i 's/Exec\=/Exec\=firejail --net=none /g' wps*
```
save it as `firejail_wps.sh` and run



