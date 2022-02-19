#!/bin/sh
films="$HOME/videos/films"

cd $films
while :
do
	selection="$(echo -e "../\n(play all)\n$(ls -p1 --group-directories-first)" | dmenu -i -l 30)"
	if [ "$selection" = "" ]; then
		exit 0
	elif [ "$selection" = ".." ]; then
		cd "$PWD/.."
	elif [ "$selection" = "(play all)" ]; then
		mpv --no-sub-visibility "$PWD/"
		break
	elif [ -d "$PWD/$selection" ]; then
		cd "$PWD/$selection"
	else
		mpv --no-sub-visibility "$PWD/$selection"
		break
	fi
done
