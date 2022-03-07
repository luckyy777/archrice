cd ~

#clears old screenshots
rm -rf ~/.cache/screenshots/*

#autostart
killall mpd
mpd &
mpDris2 &
sxhkd &
dwmblocks &

xrandr --dpi 96

exec dwm
