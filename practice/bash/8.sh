#!/bin/bash
lc_value=""
while IFS='=' read -r name value || [ -n "$name" ]; do
    if [[ $name == LC_* ]] && [ -n "$value" ]; then
        if [ -z "$lc_value" ]; then
            lc_value="$value"
        elif [ "$value" != "$lc_value" ]; then
            exit 1
        fi
    fi
done < <(env)
exit 0