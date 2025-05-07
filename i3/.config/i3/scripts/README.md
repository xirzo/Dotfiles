## The Script


```bash name=monitor-hotplug.sh
#!/bin/bash

# Log file for debugging
LOG_FILE="$HOME/.monitor-hotplug.log"

# Function to log messages
log_msg() {
    echo "$(date): $1" >> "$LOG_FILE"
}

log_msg "Monitor hotplug script started"

# Detect internal display (usually starts with eDP or LVDS)
INTERNAL_DISPLAY=$(xrandr | grep -E "(eDP|LVDS)" | cut -d " " -f1 | head -n 1)
if [ -z "$INTERNAL_DISPLAY" ]; then
    log_msg "Could not detect internal display, defaulting to eDP-1"
    INTERNAL_DISPLAY="eDP-1"
fi
log_msg "Internal display detected as: $INTERNAL_DISPLAY"

# Function to configure displays
configure_displays() {
    log_msg "Configuring displays..."
    
    # Get list of connected outputs
    CONNECTED_OUTPUTS=$(xrandr | grep " connected" | awk '{print $1}')
    EXTERNAL_CONNECTED=$(echo "$CONNECTED_OUTPUTS" | grep -v "$INTERNAL_DISPLAY")
    
    log_msg "Connected outputs: $CONNECTED_OUTPUTS"
    log_msg "External monitors: $EXTERNAL_CONNECTED"
    
    # Count external monitors
    EXTERNAL_COUNT=$(echo "$EXTERNAL_CONNECTED" | grep -v "^$" | wc -l)
    log_msg "External monitor count: $EXTERNAL_COUNT"
    
    if [ "$EXTERNAL_COUNT" -gt 0 ]; then
        log_msg "External monitor(s) detected"
        
        # Disable internal display and enable external monitors
        xrandr --output "$INTERNAL_DISPLAY" --off
        
        # Position for multiple monitors
        POSITION="--right-of $INTERNAL_DISPLAY"
        
        # Enable each external monitor
        for OUTPUT in $EXTERNAL_CONNECTED; do
            log_msg "Enabling $OUTPUT"
            xrandr --output "$OUTPUT" --auto $POSITION
            POSITION="--right-of $OUTPUT"
        done
        
        # Restart i3 to reconfigure workspaces
        i3-msg restart
    else
        log_msg "No external monitors detected"
        
        # Enable internal display and disable any disconnected monitors
        xrandr --output "$INTERNAL_DISPLAY" --auto
        
        # Get all possible outputs and disable those not connected
        ALL_OUTPUTS=$(xrandr | grep -v "$INTERNAL_DISPLAY" | grep "connected\|disconnected" | awk '{print $1}')
        for OUTPUT in $ALL_OUTPUTS; do
            if ! echo "$CONNECTED_OUTPUTS" | grep -q "$OUTPUT"; then
                log_msg "Disabling $OUTPUT"
                xrandr --output "$OUTPUT" --off
            fi
        done
        
        # Restart i3 to reconfigure workspaces
        i3-msg restart
    fi
    
    log_msg "Display configuration complete"
}

# Initial configuration
configure_displays

# Monitor for changes using inotify
log_msg "Setting up monitor for udev events"
exec 3< <(udevadm monitor --subsystem-match=drm)
while read -u 3 line; do
    if echo "$line" | grep -q "change"; then
        log_msg "Display change detected: $line"
        sleep 1  # Give the system time to process the change
        configure_displays
    fi
done
```

## Setup Instructions

1. **Save the script**:
   Save the script to a location such as `~/.config/i3/scripts/monitor-hotplug.sh`

   ```bash
   mkdir -p ~/.config/i3/scripts
   nano ~/.config/i3/scripts/monitor-hotplug.sh  # Paste the script here
   ```

2. **Make the script executable**:
   ```bash
   chmod +x ~/.config/i3/scripts/monitor-hotplug.sh
   ```

3. **Create a udev rule** to trigger the script when monitor events occur:
   ```bash
   sudo nano /etc/udev/rules.d/95-monitor-hotplug.rules
   ```

   Add this content:
   ```text
   ACTION=="change", SUBSYSTEM=="drm", RUN+="/bin/bash -c 'export DISPLAY=:0; export XAUTHORITY=/home/YOUR_USERNAME/.Xauthority; /home/YOUR_USERNAME/.config/i3/scripts/monitor-hotplug.sh'"
   ```
   
   Replace `YOUR_USERNAME` with your actual username (in this case, `xirzo`).

4. **Update your i3 config** to run the script at startup:
   ```bash
   nano ~/.config/i3/config
   ```
   
   Add this line:
   ```text
   exec --no-startup-id ~/.config/i3/scripts/monitor-hotplug.sh
   ```

5. **Reload udev rules**:
   ```bash
   sudo udevadm control --reload-rules
   ```

6. **Install required dependencies** if not already installed:
   ```bash
   sudo apt-get update
   sudo apt-get install x11-xserver-utils udev
   ```

## Troubleshooting

- Check the log file at `~/.monitor-hotplug.log` if you have issues
- If the script doesn't work automatically, you can run it manually to test
- You might need to adjust the display names (like `eDP-1`) to match your system

For more advanced configurations (like specific resolutions or orientations), you can modify the `configure_displays` function in the script to suit your needs.
