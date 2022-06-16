#!/bin/bash
# script to automatically change the exec parameter  on .desktop files on wps on
# linux.


# /opt/kingsoft/wps-office/desktops/
cd /opt/kingsoft/wps-office/desktops/
sed -i 's/Exec\=/Exec\=firejail --net=none /g' wps*

# /usr/share/applications
cd /usr/share/applications
sed -i 's/Exec\=/Exec\=firejail --net=none /g' wps*