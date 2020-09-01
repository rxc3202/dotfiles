#! /bin/bash

# Created by Ryan (https://github.com/rxc3202) with inspiration and base code from
# https://github.com/adi1090x

rofi_command="rofi -theme ~/.config/rofi/scripts/media/media.rasi"

# Gets the current status of mpd (for us to parse it later on)
playing_status="$(playerctl status)"
# Defines the Play / Pause option content
if [[ $playing_status == "Paused" ]]; then
    play_pause=" Play"
else
    play_pause=" Pause"
fi
active=""
urgent=""

# Display if repeat mode is Off / Track / Playlist
repeat_status="$(playerctl loop)"
tog_repeat=""
if [[ $repeat_status == "None" ]]; then
    urgent="-u 4"
else
    active="-a 4"
fi

# Display if shuffle mode is On / Off
tog_random=""
shuffle_status="$(playerctl status)"
if [[ $shuffle_status == "On" ]]; then
    [ -n "$active" ] && active+=",5" || active="-a 5"
else
    [ -n "$urgent" ] && urgent+=",5" || urgent="-u 5"
fi

stop=" Stop"
next=" Next"
previous=" Prev"

# Variable passed to rofi
#options="$previous\n$play_pause\n$stop\n$next\n$tog_repeat\n$tog_random"
options="$previous\n$play_pause\n$stop\n$next"

# Get the current playing song
current=$(playerctl metadata --format '{{title}} - {{artist}}')
# If mpd isn't running it will return an empty string, we don't want to display that
if [[ $current == "No Players found" ]]; then
    current="-"
fi

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -p "  $current" -dmenu $active $urgent)"
case $chosen in
    $previous)
        playerctl previous
        ;;
    $play_pause)
        playerctl play-pause
        ;;
    $stop)
        playerctl stop
        ;;
    $next)
        playerctl next
        ;;
#    $tog_repeat)
#        mpc -q repeat
#        ;;
#    $tog_random)
#        mpc -q random
#        ;;
esac
