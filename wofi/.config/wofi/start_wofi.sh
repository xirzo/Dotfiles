#!/bin/bash

if pgrep -x "wofi" >/dev/null; then
    echo "Wofi is already running."
    pkill wofi
    exit 1
fi

wofi -n
