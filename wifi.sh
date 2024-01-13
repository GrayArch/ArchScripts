#!/bin/bash

clear
echo "##############################################################"
echo " __________                          .___                     "
echo " \______   \_______  _________     __| _/____  ____   _____   "
echo "  |    |  _/\_  __ \/  _ \__  \   / __ |/ ___\/  _ \ /     \  "
echo "  |    |   \ |  | \(  <_> ) __ \_/ /_/ \  \__(  <_> )  Y Y  \ "
echo "  |______  / |__|   \____(____  /\____ |\___  >____/|__|_|  / "
echo "         \/                   \/      \/    \/            \/  "
echo "                                                              "
echo "##############################################################"
sleep 2

PS3='Please select your choice: '
options=("Install Wifi Driver" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Wifi Driver")
            echo "After Installation Complete Your Machine Will Reboot"
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
