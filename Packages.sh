#!/bin/sh

yay -Syu
# Install GUI Apps
sudo pacman -S --needed kdenlive blender thunderbird gimp krita inkscape obs-studio lutris xournalpp nextcloud-client mpv steam obsidian
# Install Depenedencies for Gaming stuff 
sudo pacman -S --needed vulkan-icd-loader lib32-vulkan-icd-loader amdvlk lib32-amdvlk vulkan-radeon lib32-vulkan-radeon wine-staging winetricks wine-mono lib32-mesa gnutls lib32-gnutls libldap lib32-libldap libgpg-error lib32-libgpg-error sqlite lib32-sqlite libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins giflib lib32-giflib libpng lib32-libpng mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama lib32-libgcrypt libgcrypt ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs python-magic cups samba dosbox
# Install CLI stuff
sudo pacman -S jq bluez bluez-utils bluedevil brightnessctl git playerctl cmake fish sshfs radeontop neovim ranger termdown python-ansbible spotifyd grim slurp pamixer neofetch onefetch cmus xwayland
yay -S qt5-styleplugins wlogout-git speedtest-cli wl-color-picker spotify-tui-bin processing4 aseprite onlyoffice-bin mangohud-git yt-dlp-drop-in ttf-meslo-nerd-font-powerlevel10k proton-ge-custom-bin schildichat-desktop-bin clipman-git 
# Install Theme stuff
sudo pacman -S qt5ct sway swaybg swayidle swaylock wofi mako waybar kitty gnome-themes-extra qt6-wayland qt5-wayland

# Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


while [ true ]; do
    read -p "Do you need CoreCtrl (y, n)?" -n 1 -re
    
    if [ $REPLY == y ]; then
        yay -S corectrl
        break
    elif [ $REPLY == n ]; then
        break
    else
        echo "Invalid Input"
    fi
done

while [ true ]; do 
    read -p "Do you need System stability testing tools (y, n)?" -n 1 -re

    if [ $REPLY == y ]; then
        yay -S --needed mprime systester linpack
        break
    elif [ $REPLY == n ]; then
        break
    else
        echo "Invalid Input"
    fi
done


while [ true ]; do 
    read -p "Do you need OpenRGB (y, n)?" -n 1 -re

    if [ $REPLY == y ]; then
        yay -S openrgb-bin
        break
    elif [ $REPLY == n ]; then
        break
    else
        echo "Invalid Input"
    fi
done
