#! /bin/sh
# https://github.com/Bonnee/dotfiles/blob/home_as_root/.config/waybar/scripts/updates

while :
do
  updates=$(pacman -Qu | wc -l)

  if [ "$updates" -gt "0" ]; then
    echo "$updates/$(pacman -Q | wc -l)"
  fi
  sleep 1800
done
