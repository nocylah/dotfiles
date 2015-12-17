#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# xrandr --dpi 144
xflux -z 87801

compton -CGb
feh --randomize --bg-fill ~/.wallpaper/*
#xautolock -locker "$HOME/.local/bin/screenlock.sh" -time 5 &
xautolock -locker "/home/louis/.local/bin/screenlock.sh" -time 5 &
unclutter &
exec $1
