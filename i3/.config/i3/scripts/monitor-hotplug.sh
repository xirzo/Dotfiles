#!/bin/bash

LOG_FILE="$HOME/.monitor-hotplug.log"

log_msg() {
    echo "$(date): $1" >>"$LOG_FILE"
}

log_msg "Monitor hotplug script started"

INTERNAL_DISPLAY=$(xrandr | grep -E "(eDP|LVDS)" | cut -d " " -f1 | head -n 1)
if [ -z "$INTERNAL_DISPLAY" ]; then
    log_msg "Could not detect internal display, defaulting to eDP-1"
    INTERNAL_DISPLAY="eDP-1"
fi
log_msg "Internal display detected as: $INTERNAL_DISPLAY"

configure_displays() {
    log_msg "Configuring displays..."

    CONNECTED_OUTPUTS=$(xrandr | grep " connected" | awk '{print $1}')
    EXTERNAL_CONNECTED=$(echo "$CONNECTED_OUTPUTS" | grep -v "$INTERNAL_DISPLAY")

    log_msg "Connected outputs: $CONNECTED_OUTPUTS"
    log_msg "External monitors: $EXTERNAL_CONNECTED"

    EXTERNAL_COUNT=$(echo "$EXTERNAL_CONNECTED" | grep -v "^$" | wc -l)
    log_msg "External monitor count: $EXTERNAL_COUNT"

    if [ "$EXTERNAL_COUNT" -gt 0 ]; then
        log_msg "External monitor(s) detected"

        xrandr --output "$INTERNAL_DISPLAY" --off

        POSITION="--right-of $INTERNAL_DISPLAY"

        for OUTPUT in $EXTERNAL_CONNECTED; do
            log_msg "Enabling $OUTPUT"
            xrandr --output "$OUTPUT" --auto $POSITION
            POSITION="--right-of $OUTPUT"
        done

        i3-msg restart
    else
        log_msg "No external monitors detected"

        xrandr --output "$INTERNAL_DISPLAY" --auto

        ALL_OUTPUTS=$(xrandr | grep -v "$INTERNAL_DISPLAY" | grep "connected\|disconnected" | awk '{print $1}')
        for OUTPUT in $ALL_OUTPUTS; do
            if ! echo "$CONNECTED_OUTPUTS" | grep -q "$OUTPUT"; then
                log_msg "Disabling $OUTPUT"
                xrandr --output "$OUTPUT" --off
            fi
        done

        i3-msg restart
    fi

    log_msg "Display configuration complete"
}

configure_displays

log_msg "Setting up monitor for udev events"
exec 3< <(udevadm monitor --subsystem-match=drm)
while read -u 3 line; do
    if echo "$line" | grep -q "change"; then
        log_msg "Display change detected: $line"
        sleep 1
        configure_displays
    fi
done
