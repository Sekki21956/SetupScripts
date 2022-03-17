#!/bin/bash

# Remove Folder in home Directory and link to Correct Nextcloud Folders
function rm_and_link() {
    DIR="$HOME/$1"
    if [ $Folder = "Downloads" ]; then
        rm -rfv $DIR && ln -sv  /mnt/data/Nextcloud/$1 $DIR
        echo
    else
        rm -rfv $DIR && ln -sv  /mnt/data/Nextcloud/Nextcloud/$1 $DIR
        echo
    fi
}

cd /home/$name
for Folder in Bilder Uni Schule Musik Videos Dokumente Downloads; do
    # if it is empty if it is remove it and link the correct Folder
    if [ ! "$(ls -A $Folder)" ] && [ ! -L $Folder ]; then
        rm_and_link $Folder
    # If $DIR points to a Symlink prompt user (and Delete only the Symlink)
    elif [ -L $Folder ]; then
         read -p "$Folder directs to a symlink do you want to delete it? (y, n)" -n 1 -r -e
         if [ $REPLY == y ]; then
            rm_and_link $Folder
        elif [ $REPLY == n ]; then
            echo
        else
            echo "Invalid Input"
        fi
    # if it isnt empty prompt the user to confirm deletion
    else
        read -p "$Folder is not Empty do you want to delete it? (y, n)" -n 1 -r -e
        if [ $REPLY == y ]; then
            rm_and_link $Folder/
        elif [ $REPLY == n ]; then
            echo
        else
            echo "Invalid Input"
        fi
    fi
done
