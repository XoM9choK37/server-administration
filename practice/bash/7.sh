#!/bin/bash

IFS=':' read -ra paths <<< "$PATH"

declare -A seen

for path in "${paths[@]}"; do
    if [ -z "$path" ] || [ "${seen[$path]}" = "1" ]; then
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
    
    count=0
    while IFS= read -r file; do
        if [ -f "$file" ] && [ ! -L "$file" ]; then
            ((count++))
        fi
    done < <(find "$path" -maxdepth 1 -type f ! -type l 2>/dev/null)
    
    echo "$path => $count"
done
