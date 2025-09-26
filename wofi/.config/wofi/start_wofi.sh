#!/bin/bash

if pgrep -x "wofi" >/dev/null; then
    echo "Wofi is already running."
    pkill wofi
    sleep 0.2
fi

wofi -n
