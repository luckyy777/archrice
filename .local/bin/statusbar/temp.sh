#!/bin/sh
temp="$(sensors | grep "Core 0" | awk '{printf $3 "\n"}' | sed 's/+//g' | sed 's/.0//g')"
echo " $temp°C"
