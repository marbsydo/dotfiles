#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Set X11 keyboard layout
# Note that this is for X11, not the arch Console that is configured during first install
setxkbmap -layout "gb"


# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

twm &
xclock -geometry 50x50-1+1 &

# Start two terminal windows
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &

# Start-up programs
exec chromium &
exec dropbox &

# Disable screen blanking
xset s off

#exec xterm -geometry 80x66+0+0 -name login

# Wallpaper stuff
wallpaper=$HOME/Documents/Wallpapers/xnVQkWk.jpg
feh --bg-fill $wallpaper

# Window effects
#compton -b --config ~/.config/compton/compton.conf  &

#exec qtile
exec i3
