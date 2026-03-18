#!/bin/bash

for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "$file => not found"
    else
        lines=$(wc -l < "$file" | tr -d ' ')
        echo "$file => $lines"
    fi
done
