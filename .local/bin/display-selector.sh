#!/bin/sh
available="$(xrandr -q | grep " connected" | awk '{print $1 dual}')"
displayno="$(echo -e "$available" | wc -w)"
wall="$(grep 'xwallpaper' $HOME/.xinitrc)"

if [ "$displayno" = "1" ]; then
	display="$available"
else
	display="$(echo -e "eDP1\nHDMI1\ndual" | dmenu -i)"
fi

case "$display" in

	eDP1)
	xrandr --output HDMI1 --off --output eDP1 --auto
	;;

	HDMI1)
	xrandr --output HDMI1 --auto --output eDP1 --off
	;;

	dual)
	xrandr --output HDMI1 --auto --primary --output eDP1 --auto --left-of HDMI1
	$wall
	;;

esac
