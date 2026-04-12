#!/bin/bash
chosen=$(echo -e " Shutdown\n Reboot\n Logout\n Lock" | rofi -dmenu -i -p "Power Menu:")

case "$chosen" in
    *Shutdown) poweroff ;;
    *Reboot) reboot ;;
    *Logout) bspc quit ;;
    *Lock) i3lock ;; # Pastikan install i3lock jika ingin fitur ini
esac
