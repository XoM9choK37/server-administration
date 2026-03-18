#!/bin/bash

> logs.log

for logfile in /var/log/*.log; do
    if [ -f "$logfile" ] && [ -r "$logfile" ]; then
        tail -n 1 "$logfile" 2>/dev/null >> logs.log
    fi
done
