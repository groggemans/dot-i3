#!/bin/bash
###############################################################################
# Settings
# USE 24-hour format times!

LIGHT_IMAGE="${LIGHT_IMAGE:-$HOME/.config/i3/i3lock/lock_light.png}"
LIGT_TIME="${LIGT_TIME:-08:00}"

DARK_IMAGE="${DARK_IMAGE:-$HOME/.config/i3/i3lock/lock_dark.png}"
DARK_TIME="${DARK_TIME:-20:00}"

###############################################################################
# Process vars

LIGT_TIME="$(tr -d ':' <<< "$LIGT_TIME")"
DARK_TIME="$(tr -d ':' <<< "$DARK_TIME")"
C_TIME="$(date  +"%H%M")"

if [ $LIGT_TIME -le $C_TIME -a $C_TIME -le $DARK_TIME ]; then
    IMAGE="$LIGHT_IMAGE"
else
    IMAGE="$DARK_IMAGE"
fi

###############################################################################
# Call i3lock

i3lock -u -i "$IMAGE"

###############################################################################
