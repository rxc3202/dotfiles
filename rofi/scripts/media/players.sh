#! /bin/bash

# Created by Ryan (https://github.com/rxc3202) with inspiration and base code from
# https://github.com/adi1090x
echo "IN PLAYER"
rofi_command="rofi -theme player.rasi"

# Variable passed to rofi
spotify=" Spotify"
options="$spotify\n"

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -p "  Available Players" -dmenu $active $urgent)"
case $chosen in
    $spotify)
        gtk-launch spotify
esac
