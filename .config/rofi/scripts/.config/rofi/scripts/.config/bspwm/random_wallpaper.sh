#!/bin/bash

# Arahkan ke folder wallpaper-mu
WALL_DIR="/home/wrjunior/Pictures/Wallpaper-Bank/wallpapers/Anime-Girl1.png"

# Cari semua gambar (jpg, png) dan pilih satu secara acak menggunakan 'shuf'
RANDOM_PIC=$(find "$WALL_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | shuf -n 1)

# Terapkan menggunakan feh
if [ -n "$RANDOM_PIC" ]; then
    feh --bg-fill "$RANDOM_PIC"
fi
