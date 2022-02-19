#!/bin/sh
echo 1 > ${XDG_RUNTIME_DIR}/.notif
function notify(){
	song="$(playerctl --player=mpd metadata title)"
	artist="$(playerctl --player=mpd metadata artist)"
	album="$(playerctl --player=mpd metadata album)"
	state="$(playerctl --player=mpd status)"
	notif=`cat ${XDG_RUNTIME_DIR}/.notif`
	gdbus call \
    		--session \
    		--dest org.freedesktop.Notifications \
    		--object-path /org/freedesktop/Notifications \
    		--method org.freedesktop.Notifications.Notify \
    		"mpd-notify" \
    		"`echo $notif`" \
    		"" \
    		"$state" \
    		"$song by $artist" \
    		"[]" \
    		"{}" \
    		"5000" \
	| sed 's/[^ ]* //; s/,.//' > ${XDG_RUNTIME_DIR}/.notif
}

function monitor(){
	last=""
	while :; do
		if [ ! -s ~/.config/mpd/pid ]; then
			continue
		elif [ "$(playerctl --player=mpd status)" = "Stopped" ]; then
			continue
		else
			current="$(playerctl --player=mpd metadata --format "{{title}} {{artist}} {{status}}")"
		fi
		if [ "$current" != "$last" ]; then
			notify
			last="$current"
			sleep 0.1
		fi
	done
}

monitor
