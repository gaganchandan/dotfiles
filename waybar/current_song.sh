#! /bin/sh

PLAYER_STATUS=$(playerctl -s status | tail -n1)
# Replace &'s in artist name/song title with +'s to avoid parsing issues
ARTIST=$(playerctl metadata artist | sed 's/&/+/g') 
TITLE=$(playerctl metadata title | sed 's/&/+/g')

if [[ $PLAYER_STATUS == "Paused" || $PLAYER_STATUS == "Playing" ]]; then
    echo "${ARTIST} - ${TITLE}"
elif [[ $PLAYER_STATUS == "Stopped" ]]; then
    echo "No Music Playing"
else
   echo "Music Player Offline"
fi
