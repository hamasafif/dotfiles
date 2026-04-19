#!/bin/bash

# 1. Hentikan Polybar yang sedang berjalan secara diam-diam
killall -q polybar

# 2. Tunggu sampai proses Polybar benar-benar mati di background
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. Jalankan Polybar dengan memanggil bar bernama "example"
# Ia akan membaca file config.ini yang baru saja di-symlink oleh rofi
polybar example -c "$HOME/.config/polybar/config.ini" &

echo "Polybar berhasil diluncurkan!"
