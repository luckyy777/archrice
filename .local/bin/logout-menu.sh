#!/bin/sh

option="$(echo -e "logout\nreboot\nshutdown" | dmenu -i)"

case "$option" in

	logout)
	loginctl terminate-user $USER
	;;

	reboot)
	reboot
	;;

	shutdown)
	shutdown now
	;;
esac
