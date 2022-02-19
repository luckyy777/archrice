#!/bin/sh
all_data="$(curl -s https://terminal-stocks.herokuapp.com/TWTR | grep Twitter | sed -r 's/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g')"

price="$(echo $all_data | awk '{printf $4}')"
change="$(echo $all_data | awk '{printf $8}')"

if [ "$(echo $change | sed 's/.*\(-\).*/\1/')" != "-" ]; then
	change="+${change}"
fi

echo " $change%"
