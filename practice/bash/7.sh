#!/bin/bash
IFS=':' read -ra paths <<< "$PATH"
declare -A seen
for path in "${paths[@]}"; do
    if [ "${seen[$path]}" = "1" ]; then
        continue
    fi
    if [ -L "$path" ]; then
        seen[$path]="1"
        continue
    fi
    seen[$path]="1"
    if [ ! -d "$path" ]; then
        continue
    fi
    count=$(find "$path" -maxdepth 1 -type f | wc -l)
    echo "$path => $count"
done