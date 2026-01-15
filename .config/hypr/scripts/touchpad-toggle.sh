#!/bin/bash

TOUCHPAD="elan07fb:00-04f3:321a-touchpad"
STATE_FILE="$HOME/.config/hypr/touchpad_state"

# Read current state from file (default to "enabled" if file doesn't exist)
if [ -f "$STATE_FILE" ] && [ "$(cat "$STATE_FILE")" = "disabled" ]; then
    CURRENT_STATE="disabled"
else
    CURRENT_STATE="enabled"
fi

# Toggle based on stored state
if [ "$CURRENT_STATE" = "enabled" ]; then
    # Disable touchpad
    hyprctl keyword "device[$TOUCHPAD]:enabled" false
    echo "disabled" > "$STATE_FILE"
    notify-send "Touchpad" "Disabled"
else
    # Enable touchpad
    hyprctl keyword "device[$TOUCHPAD]:enabled" true
    echo "enabled" > "$STATE_FILE"
    notify-send "Touchpad" "Enabled"
fi
