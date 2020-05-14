#! /bin/zsh

class=$(playerctl metadata --player=spotify --format '{{lc(status)}}')

if [[ $class == "playing" ]]; then
  info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}} ')
  if [[ ${#info} > 35 ]]; then
    info=$(echo $info | cut -c1-35)"..."
  fi
  text=" $info"
elif [[ $class == "paused" ]]; then
  text=" Music Paused"
elif [[ $class == "stopped" ]]; then
  text=" $info"
fi

echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
