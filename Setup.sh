#!/bin/sh

while [ true ]; do
    read -p "Do you want to replace Linux with Linux-Zen (y, n)?" -n 1 -re
    
    if [ $REPLY == y ]; then
        echo "Upgrading System"
        sudo pacman -Syu
        echo "Installing Linux-Zen"
        sudo pacman -S linux-zen linux-zen-headers
        echo "Removing Linux"
        sudo pacman -R linux linux-headers
        break
    elif [ $REPLY == n ]; then
        echo
        break
    else
        echo "Invalid Input"
    fi
done

while [ true ]; do
    read -p "Install all packages (y, n)?" -n 1 -re

    if [ $REPLY == y ]; then
        echo "Installing all packages"
        bash ./Packages.sh
        break
    elif [ $REPLY == n ]; then
        echo
        break
    else
        echo "Invalid Input"
    fi
done

while [ true ]; do
    read -p "Mount additional Partitions (y, n)?" -n 1 -re
    
    if [ $REPLY == y ]; then
       bash ./MountDrives.sh
       break
    elif [ $REPLY == n ]; then 
        break
    else
        echo "Invalid Input"
    fi
done

while [ true ]; do
    read -p "Do you want to Symlink Homefolders (y, n)?" -n 1 -re

    if [ $REPLY == y ]; then
        bash ./LinkFolders.sh
    elif [ $REPLY == n ]; then
        break
    else
        echo "Invalid Input"
    fi
done

while [ true ]; do
    read -p "Do you want to Pull dotfiles from cloud?" -n 1 -re

    if [ $REPLY == y ]; then
        echo "Cloning git repo"
    elif [ $REPLY == n ]; then
        break
    else
        echo "Invalid Input"
    fi
done

