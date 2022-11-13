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