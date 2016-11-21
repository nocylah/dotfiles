#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# run system scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# xrandr --dpi 144
xflux -z 87801

# running with -b kills radeon
compton -CG &
feh --randomize --recursive --no-fehbg --bg-fill ~/.wallpaper
#xautolock -locker "$HOME/.local/bin/screenlock.sh" -time 5 &
#xautolock -locker "/home/louis/.local/bin/screenlock.sh" -time 5 &
xscreensaver &
unclutter -grab &
blueman-applet &
nm-applet &

~/.scripts/mount_ssync.sh
spopd

exec $1
