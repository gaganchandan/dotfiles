#!/bin/sh
player_status=$(playerctl --player=spotify status 2> /dev/null)
if [ "$player_status" = "Playing" ]; then
    playerctl metadata --format "{{(duration(position))}}/{{(duration(mpris:length))}}"
elif [ "$player_status" = "Paused" ]; then
    playerctl metadata --format "{{(duration(position))}}/{{(duration(mpris:length))}}"
fi

