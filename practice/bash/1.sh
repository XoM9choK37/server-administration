#!/bin/bash
if [ $# -ne 2 ]; then
    exit 1
fi
end=$((SECONDS + $2))
while [ $SECONDS -lt $end ]; do
    echo "[$(date +'%d.%m.%y %H:%M')] = $(cut -d' ' -f1-3 /proc/loadavg)" >> "$1"
    sleep 1
done