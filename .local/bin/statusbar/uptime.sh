#!/bin/sh
uptime="$(uptime -p | sed 's/minute/min/g' | sed 's/up //g')"

echo " $uptime"
