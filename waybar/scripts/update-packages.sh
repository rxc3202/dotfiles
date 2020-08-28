#! /bin/bash

# Update the Packages
echo "Packages Upgraded:"
yay -Qu
yay -Syu

# Recommend Restart
echo "Would you like to restart? [Y/n]"
read -n 1 -r response

if [ $response == "Y" ]; then
    echo "Shutting Down ..."
    sudo shutdown -r 0
fi

