#! /bin/zsh

running=$(systemctl status bluetooth | grep running | wc -l | xargs)
# If not active display nothing
if [ "$running" -eq "1" ]; then
    connection=$(echo "info" | bluetoothctl | grep "Name" | awk -F": " '{print $2}')
    count=$(echo "info" | bluetoothctl | grep "Name" | awk -F": " '{print $2}' |wc -l)

    # If active then check if there are any connections
    echo $count
    if [ "$count" -gt "0" ]; then
        echo $connection
    else
        echo 'Disconnected'
    fi
else
    # If isn't running then dont display the icon
    echo
fi


