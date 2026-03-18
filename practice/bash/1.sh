#!/bin/bash

if [ $# -ne 2 ]; then
    exit 1
fi

filename="$1"
duration="$2"
end=$((SECONDS + duration))

while [ $SECONDS -lt $end ]; do
    timestamp=$(date +'%d.%m.%y %H:%M')
    loadavg=$(cut -d' ' -f1-3 /proc/loadavg)
    echo "[$timestamp] = $loadavg" >> "$filename"
    sleep 1
done
