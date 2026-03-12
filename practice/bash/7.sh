#!/bin/bash

IFS=':' read -ra directories <<< "$PATH"

for dir in "${directories[@]}"; do
    file_count=$(ls -l "$dir" | grep "^-" | wc -l)
    echo "$dir=>$file_count"
done
