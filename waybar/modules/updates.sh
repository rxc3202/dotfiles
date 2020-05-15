#! /bin/sh
# https://github.com/Bonnee/dotfiles/blob/home_as_root/.config/waybar/scripts/updates
title="pacman-update-confirm"
script="$HOME/.config/waybar/scripts/update-packages.sh"

if [ "$#" -eq "1" ] && [ "$1" = "--update" ]; then
    if [ "$(swaymsg -t get_tree | grep $title |wc -l)" -eq "0" ]; then
        alacritty -d 100 100 --title $title -e $script
        exit 0
    fi
fi

if [ "$#" -eq "1" ] && [ "$1" = "--fetch" ]; then
    updates=$(pacman -Qu | awk -F"->" '{print $1}' | cut -d" " -f1)
    num_updates=$(pacman -Qu | wc -l)
    out="{\"text\": \"$num_updates\", \"tooltip\": \"New Versions: $updates\"}"
    if [ "$num_updates" -gt "0" ]; then
        echo $out
    fi
fi
