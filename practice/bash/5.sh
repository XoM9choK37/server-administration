#!/bin/bash
> logs.log
for logfile in /var/log/*.log; do
    if [ -r "$logfile" ]; then
        tail -n 1 "$logfile" >> logs.log
    fi
done