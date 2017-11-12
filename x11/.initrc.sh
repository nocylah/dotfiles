#!/bin/bash
# check if utils already started
# TODO something better
if pgrep dunst; then exit 1; fi

# start x11/sway utils
fluxgui &
xscreensaver &
unclutter -grab &
blueman-applet &
nm-applet &
# pulseaudio-dnla &
pasystray &
syncthing-gtk --minimized &
dunst &
spopd
