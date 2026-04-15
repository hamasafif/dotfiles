#!/bin/bash

# Folder repositori dotfiles
DOTFILES_DIR="$HOME/dotfiles"

echo "🔄 Memulai sinkronisasi dari sistem ke folder dotfiles..."

# Pastikan folder tujuan ada
mkdir -p "$DOTFILES_DIR/.config"

# --- SINKRONISASI FOLDER .CONFIG ---
echo "📂 Menyalin folder .config..."

# Menggunakan rsync lebih aman daripada cp untuk sinkronisasi folder
# -a: archive mode (mempertahankan izin file)
# -v: verbose (menampilkan apa yang dikerjakan)
# --delete: menghapus file di tujuan jika di sumber sudah tidak ada (opsional, tapi bersih)
rsync -av --exclude='google-chrome' --exclude='discord' --exclude='microsoft-edge' \
      "$HOME/.config/bspwm" \
      "$HOME/.config/sxhkd" \
      "$HOME/.config/polybar" \
      "$HOME/.config/rofi" \
      "$HOME/.config/kitty" \
      "$HOME/.config/dunst" \
      "$DOTFILES_DIR/.config/"

# --- SINKRONISASI FILE SATUAN ---
echo "🐚 Menyalin file sistem..."
cp "$HOME/.zshrc" "$DOTFILES_DIR/"
cp "$HOME/.xinitrc" "$DOTFILES_DIR/"

# Menyalin aset gambar
if [ -f "$HOME/Pictures/pic.png" ]; then
    cp "$HOME/Pictures/pic.png" "$DOTFILES_DIR/"
fi

# --- CLEANUP ERROR FONTCONFIG ---
# Jika masih ada sisa file fontconfig yang salah di repo, kita hapus
if [ -f "$DOTFILES_DIR/.config/fontconfig" ]; then
    rm "$DOTFILES_DIR/.config/fontconfig"
fi

echo "✅ Sinkronisasi selesai! File di ~/dotfiles sudah paling up-to-date."
