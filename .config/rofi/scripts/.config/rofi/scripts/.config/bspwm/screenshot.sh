#!/bin/bash

# Tentukan lokasi penyimpanan (misal di folder Pictures)
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILE="$DIR/screenshot_$(date +%Y%m%d_%H%M%S).png"

# Pilihan menu sederhana menggunakan Rofi
CHOICE=$(echo -e "1. Fullscreen\n2. Area" | rofi -dmenu -i -p "Pilih Mode Screenshot:")

if [ "$CHOICE" == "1. Fullscreen" ]; then
    maim "$FILE"
    cat "$FILE" | xclip -selection clipboard -t image/png
    notify-send "📸 Screenshot" "Layar penuh telah disimpan dan disalin ke clipboard"
elif [ "$CHOICE" == "2. Area" ]; then
    notify-send "📸 Screenshot" "Pilih area menggunakan mouse"
    maim -s "$FILE"
    cat "$FILE" | xclip -selection clipboard -t image/png
    notify-send "📸 Screenshot" "Area terpilih telah disimpan dan disalin ke clipboard"
fi
