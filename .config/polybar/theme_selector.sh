#!/bin/bash

# Folder lokasi tema
THEME_DIR="$HOME/.config/polybar/themes"
LAUNCH_SCRIPT="$HOME/.config/polybar/launch.sh"

# Ambil daftar file .ini di folder themes
THEMES=$(ls "$THEME_DIR" | grep ".ini" | sed 's/.ini//')

# Tampilkan menu Rofi
SELECTED=$(echo "$THEMES" | rofi -dmenu -i -p "Pilih Tema Polybar:")

if [ ! -z "$SELECTED" ]; then
    # Link-kan tema yang dipilih ke file config utama
    ln -sf "$THEME_DIR/$SELECTED.ini" "$HOME/.config/polybar/config.ini"
    
    # Jalankan ulang Polybar
    bash "$LAUNCH_SCRIPT"
    
    notify-send "Polybar" "Tema berhasil diganti ke $SELECTED"
fi
