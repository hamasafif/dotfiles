#!/bin/bash

# Arahkan ke folder gambar
WALL_DIR="/home/wrjunior/Pictures"

# Variabel untuk menampung daftar menu
MENU_OPTIONS=""

# Looping membaca semua file gambar di dalam folder
for pic in "$WALL_DIR"/*.{jpg,jpeg,png}; do
    # Lewati jika tidak ada file (mencegah error jika folder kosong)
    [ -e "$pic" ] || continue
    
    # Ambil nama filenya saja (contoh: pic.png)
    filename=$(basename "$pic")
    
    # Format khusus Rofi: TeksYangTampil\0icon\x1f/Jalur/Lengkap/Gambar.png
    MENU_OPTIONS+="${filename}\0icon\x1f${pic}\n"
done

# Panggil Rofi dengan opsi -show-icons dan injeksi CSS (theme-str) untuk membuat tampilan Grid
CHOSEN=$(echo -e -n "$MENU_OPTIONS" | rofi -dmenu -i -show-icons -p " Wallpaper:" \
    -theme-str '
        window { width: 50%; }
        listview { columns: 4; lines: 3; flow: horizontal; spacing: 15px; }
        element { orientation: vertical; padding: 10px; }
        element-icon { size: 120px; horizontal-align: 0.5; }
        element-text { horizontal-align: 0.5; }
    ')

# Jika user memilih sesuatu (tidak menekan ESC), terapkan gambarnya!
if [ -n "$CHOSEN" ]; then
    feh --bg-fill "$WALL_DIR/$CHOSEN"
fi
