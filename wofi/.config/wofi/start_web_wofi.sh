#!/bin/bash

if pgrep -x "wofi" >/dev/null; then
    echo "Wofi is already running."
    exit 1
fi

search=$(wofi --show dmenu --prompt "Search (g/d/w) <query>:")

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
