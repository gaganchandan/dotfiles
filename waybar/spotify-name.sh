CURRENT_SONG="/home/gagan/.config/waybar/current_song.sh"

unbuffer zscroll -p " | " --delay 0.2 \
    --length 40 \
    --match-command "playerctl status" \
    --match-text "Playing" "--scroll 1" \
    --match-text "Paused" "--scroll 0" \
    --update-interval 1 \
    --update-check true $CURRENT_SONG &
wait
