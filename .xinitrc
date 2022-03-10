cd ~

#clears old screenshots
rm -rf ~/.cache/screenshots/*

setterm -blank 0 -powersave off -powerdown 0
xset s off

#autostart
killall mpd
mpd &
mpDris2 &
sxhkd &
picom &
lxsession &
dunst &
dwmblocks &
xwallpaper --zoom $HOME/.config/pape.png

xrandr --dpi 96

exec dwm
