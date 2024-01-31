#!/bin/sh

player_status=$(playerctl --player=spotify status 2> /dev/null)
if [ "$player_status" = "Playing" ]; then
    echo "󰒭 "
elif [ "$player_status" = "Paused" ]; then
    echo "󰒭 "
fi
