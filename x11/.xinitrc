#!/bin/sh
session="i3"; if ! [ -z $1 ]; then session="$1"; fi
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

export PATH=$HOME/.local/bin:$PATH

# running with -b kills radeon
compton -CG &
feh --randomize --recursive --no-fehbg --bg-fill ~/.wallpaper
#xautolock -locker "$HOME/.local/bin/screenlock.sh" -time 5 &
#xautolock -locker "/home/louis/.local/bin/screenlock.sh" -time 5 &

~/.scripts/mount_ssync.sh
~/.initrc.sh

exec "$session"
