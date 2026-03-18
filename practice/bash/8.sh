#!/bin/bash

lc_value=""
lc_name=""

while IFS='=' read -r name value || [ -n "$name" ]; do
    if [[ $name == LC_* ]] && [ -n "$value" ]; then
        if [ -z "$lc_value" ]; then
            lc_value="$value"
            lc_name="$name"
        elif [ "$value" != "$lc_value" ]; then
            exit 1
        fi
    fi
done < <(env)

exit 0
