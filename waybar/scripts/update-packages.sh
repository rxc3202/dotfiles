#! /bin/zsh

# Update the Packages
echo "Packages Upgraded:"
pacman -Qu
sudo pacman -Syu  >> /dev/null

# Recommend Restart
echo "Would you like to restart? [Y/n]"
read response -n1 -r

if [ $response == "Y" ]; then
    sudo shutdown -r 0
fi

