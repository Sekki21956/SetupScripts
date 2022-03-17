#! /bin/bash

function test_and_append() {
    if ! grep -Fq -- "$1" "$2"; then
        echo "$1" | sudo tee -a "$2" > /dev/null
        echo -n "$1 Flag was added to $2"
    else
        echo -n "$1 Flag was already in $2"
    fi
}

function MountDrive() {
    if [[ $(lsblk /dev/$2 -o fstype -n) == "ext4" ||  $(lsblk /dev/$2 -o fstype -n) == "btrfs" ]]; then
        echo "ext4"
        test_and_append "UUID=$(lsblk /dev/$2-o uuid -n) $1 $(lsblk /dev/$2 -o fstype -n) defaults,noatime,uid=$(id -u),gid=$(id -g) 0 2" "/etc/fstab" 
    else 
        echo "not ext4"
        test_and_append "UUID=$(lsblk /dev/$2 -o uuid -n) $1 $(lsblk /dev/$2 -o fstype -n) defaults,noatime,uid=$(id -u),gid=$(id -g) 0 0" "/etc/fstab"
    fi
    read -p "Mount more Drives?" -n 1 -re
}

while [ true ]; do

    # Show the user all available Partitions
    lsblk -f
    read -p "Enter a Drive-Name to mount: " -re DriveName

    # Check if the Drive name is in the lsblk output
    if [[ $(lsblk -l | grep "$DriveName ") ]]; then
        read -p "Select mount path: " -re MountPath
        
        if [ -d $MountPath ]; then
            echo "Valid Path"
            MountDrive $MountPath $DriveName

            if [ $REPLY == y ]; then
                continue
            elif [ $REPLY == n ]; then
                break
            else 
                echo "Invalid Input"
                sleep 2
            fi

        else
            read -p "Invalid Path, do you want to create it (y, n)?" -re
            
            if [ $REPLY == y ]; then
                sudo mkdir $MountPath
                MountDrive $MountPath $DriveName

                if [ $REPLY == y ]; then
                    continue
                elif [ $REPLY == n ]; then
                    break
                else 
                    echo "Invalid Input"
                    sleep 2
                fi
 
            elif [ $REPLY == n ]; then
                break
            else
                echo "Invalid Input"
                sleep 2
            fi
        fi

        break
    else
        echo "Invalid Partition Name!"
        sleep 2
    fi
done

mount -a
