#!/bin/bash

clear
echo" ██████  ██████   █████  ██    ██  █████  ██████   ██████ ██   ██"
echo"██       ██   ██ ██   ██  ██  ██  ██   ██ ██   ██ ██      ██   ██"
echo"██   ███ ██████  ███████   ████   ███████ ██████  ██      ███████"
echo"██    ██ ██   ██ ██   ██    ██    ██   ██ ██   ██ ██      ██   ██"
echo" ██████  ██   ██ ██   ██    ██    ██   ██ ██   ██  ██████ ██   ██" 
sleep 2

PS3='Please select your choice: '
options=("Install Wifi Driver" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Wifi Driver")
            echo "After Installation Complete Your Machine Will Reboot To Finish The Setup"
            sudo pacman -Syu
            sudo pacman -S linux-headers broadcom-wl-dkms
            sudo modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
            sudo modprobe wl
            sudo reboot
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
