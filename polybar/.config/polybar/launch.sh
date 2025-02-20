#!/usr/bin/env bash

killall -q polybar

while pgrep -x polybar >/dev/null; do
  sleep 0.1
done

echo "---" | tee -a /tmp/polybar.log

for monitor in $(xrandr --query | grep " connected" | awk '{print $1}'); do
  echo "Launching polybar on monitor: $monitor" | tee -a /tmp/polybar.log
  MONITOR=$monitor polybar top -r >>/tmp/polybar.log 2>&1 &
  disown
done

echo "Polybar launched on all monitors."
