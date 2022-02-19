#!/bin/sh
all_data="$(curl -s https://terminal-stocks.herokuapp.com/FB | grep Meta | sed -r 's/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g')"

price="$(echo $all_data | awk '{printf $5}')"
change="$(echo $all_data | awk '{printf $9}')"

if [ "$(echo $change | sed 's/.*\(-\).*/\1/')" != "-" ]; then
	change="+${change}"
fi

echo " $change%"
