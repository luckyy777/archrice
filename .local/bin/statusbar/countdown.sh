#!/bin/sh
#month/day/year

file="/home/$(whoami)/.local/bin/statusbar/listofdates"

if [ ! -f "$file" ]; then
	touch "$file"
fi

target="$(date "+%s" -d " 10/8/2021 16:00:00")"
current="$(date "+%s")"
difference="$(($target-$current))"

function secondstotime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  (( $D > 0 )) && printf '%dd ' $D
  (( $H > 0 )) && printf '%dh ' $H
  (( $M > 0 )) && printf '%dm ' $M
}

echo " switch oled - " $(secondstotime $difference)
