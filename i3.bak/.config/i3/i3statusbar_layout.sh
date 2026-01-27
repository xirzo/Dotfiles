#!/bin/sh

i3status | while :
do
    read line
    layout=$(xkblayout-state print "%s")
    echo ",[{\"full_text\":\"$layout\"},${line#?}" || exit 1
done
