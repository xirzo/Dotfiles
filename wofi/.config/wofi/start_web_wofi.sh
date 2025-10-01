#!/bin/bash

if pgrep -x "wofi" >/dev/null; then
    echo "Wofi is already running."
    pkill wofi
    sleep 0.2
fi

search=$(wofi --show=dmenu \
    --normal-window  \
    --prompt "Search (g/d/w/y) <query>:" \
    --style ~/.config/wofi/style.css \
    --width 800 \
    --location center \
    --monitor -1 \
    --lines 1 \
    --no-actions \
    --cache-file /dev/null \
    --insensitive)

[[ -z "$search" ]] && exit

prefix=$(echo "$search" | awk '{print $1}')
query=$(echo "$search" | cut -d' ' -f2-)

[[ -z "$query" ]] && exit

case "$prefix" in
    g)
        url="https://www.google.com/search?q=$query"
        ;;
    d)
        url="https://duckduckgo.com/?q=$query"
        ;;
    w)
        url="https://en.wikipedia.org/wiki/Special:Search?search=$query"
        ;;
    y)
        url="https://www.youtube.com/results?search_query=$query"
        ;;
    *)
        url="https://www.google.com/search?q=$search"
        ;;
esac

xdg-open "$url"
