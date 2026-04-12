#!/bin/bash

# Arahkan ke folder yang sama
WALL_DIR="/home/wrjunior/Pictures/Wallpaper-Bank/wallpapers/"

# Ambil daftar nama file gambar saja (agar rapi di Rofi)
PICS=$(ls -1 "$WALL_DIR" | grep -E '\.(jpg|jpeg|png)$')

# Tampilkan di menu Rofi dan simpan pilihan user
CHOSEN=$(echo "$PICS" | rofi -dmenu -i -p " Wallpaper:")

# Jika user memilih sesuatu (tidak menekan ESC), terapkan gambarnya!
if [ -n "$CHOSEN" ]; then
    feh --bg-fill "$WALL_DIR/$CHOSEN"
fi
