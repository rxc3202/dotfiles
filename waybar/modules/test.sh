#! /bin/sh
# https://github.com/Bonnee/dotfiles/blob/home_as_root/.config/waybar/scripts/updates
title="pacman-update-confirm"
class="test"
percentage="100"
if [ "$#" -eq "1" ] && [ "$1" = "--update" ]; then
    if [ "$(swaymsg -t get_tree | grep $title |wc -l)" -eq "0" ]; then
        alacritty -d 100 100 --title $title -e /usr/local/bin/update-packages.sh
        exit 0
    fi
fi

if [ "$#" -eq "1" ] && [ "$1" = "--fetch" ]; then
    updates=$(pacman -Qu | awk -F"->" '{print $1}' | cut -d" " -f1)
    num_updates=$(pacman -Qu | wc -l)
    out="{\"text\": \"$num_updates\", \"tooltip\": \"$updates\", \"percentage\":$percentage, \"class\":[\"$class\"]}"
    if [ "$num_updates" -gt "0" ]; then
        echo $out
    fi
fi
