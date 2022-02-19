#!/bin/sh
echo "enter number of people before you in the queue"
read -r n
echo "press enter if queue moves"
nleft=$n
t0=$(date +%s)
while read -r; do
    nleft=$((nleft - 1))
    [ $nleft -le 0 ] && break
    t=$(date +%s)
    d=$((t - t0))

    echo "people left: $nleft/$n"
    echo "time in queue: $d"
    echo "time left: $((d * nleft / (n - nleft)))"
done
echo "your time!"
