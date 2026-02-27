#!/bin/bash

IFS=':' read -ra directories <<< "$PATH"

for dir in "${directories[@]}"; do
    if [ -z "$dir" ]; then
        continue
    fi
    
    if [ -d "$dir" ] && [ -r "$dir" ]; then
        file_count=$(ls -l "$dir" 2>/dev/null | grep "^-" | wc -l)
        echo "$dir: $file_count"
    else
        echo "$dir: директория не существует или недоступна"
    fi
done
