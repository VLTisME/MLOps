#!/bin/bash  
wget -O /tmp/wall.jpg "https://picsum.photos/3072/1920"  
export DISPLAY=:0  
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $USER gnome-session)/environ | cut -d= -f2-)  
gsettings set org.gnome.desktop.background picture-uri "file:///tmp/wall.jpg"  
echo "Wallpaper changed at $(date)" >> /tmp/wallpaper_debug.log 2>&1
