cd ~

#clears old screenshots
rm -rf ~/.cache/screenshots/*

#autostart
killall mpd
mpd &
mpDris2 &
sxhkd &

xrandr --dpi 96

exec startxfce4
