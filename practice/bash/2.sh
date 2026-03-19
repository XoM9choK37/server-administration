#!/bin/bash
if [ ! -d "$1" ]; then
    exit 1
fi
target="$2"
for dir in "$1"/*/ ; do
    if [ -d "$dir" ]; then
        dirname=$(basename "$dir")
        count=$(ls -1A "$dir" | wc -l)
        echo "$count" > "$target/$dirname"
    fi
done