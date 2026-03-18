#!/bin/bash

if [ ! -d "$1" ]; then
    exit 1
fi

path="$1"
target="${2:-./out}"

mkdir -p "$target"

for dir in "$path"/*/ ; do
    if [ -d "$dir" ]; then
        dirname=$(basename "$dir")

        count=$(ls -1A "$dir" | wc -l)

        count=$(echo "$count" | tr -d ' ')
        echo "$count" > "$target/$dirname"
    fi
done

for dir in "$path"/*; do
    if [ -d "$dir" ] && [ ! -L "$dir" ]; then
        dirname=$(basename "$dir")

        if [ ! -f "$target/$dirname" ]; then
            count=$(ls -1A "$dir" | wc -l | tr -d ' ')
            echo "$count" > "$target/$dirname"
        fi
    fi
done
