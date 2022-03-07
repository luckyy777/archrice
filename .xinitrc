cd ~

#clears old screenshots
rm -rf ~/.cache/screenshots/*

#autostart
killall mpd
mpd &
mpDris2 &
sxhkd &
picom &
dwmblocks &
xwallpaper --zoom $HOME/.config/pape.png

xrandr --dpi 96

exec dwm
