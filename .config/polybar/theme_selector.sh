#!/bin/bash

# Folder lokasi file dan skrip
THEME_DIR="$HOME/.config/polybar/themes"
LAUNCH_SCRIPT="$HOME/.config/polybar/launch.sh"
CONFIG_FILE="$HOME/.config/polybar/config.ini"

# Ambil daftar file .ini di folder themes
THEMES=$(ls "$THEME_DIR" | grep "\.ini$" | sed 's/\.ini$//')

# Tampilkan menu Rofi
SELECTED=$(echo "$THEMES" | rofi -dmenu -i -p "Pilih Tema Polybar:")

if [ ! -z "$SELECTED" ]; then
    # 1. Timpa config.ini utama dengan symlink dari tema yang dipilih
    ln -sf "$THEME_DIR/$SELECTED.ini" "$CONFIG_FILE"
    
    # 2. Eksekusi skrip peluncur Polybar
    bash "$LAUNCH_SCRIPT"
    
    # 3. Munculkan notifikasi
    notify-send "Polybar" "Tema berhasil diganti ke $SELECTED"
fi
