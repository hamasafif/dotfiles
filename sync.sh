#!/bin/bash

echo "🔄 Memulai sinkronisasi dari sistem ke folder dotfiles..."

# Pastikan folder tujuan ada
mkdir -p .config/{bspwm,sxhkd,polybar,rofi,alacritty,picom}

# Menyalin konfigurasi dari ~/.config
echo "📂 Menyalin folder .config..."
cp -r ~/.config/bspwm/* .config/bspwm/
cp -r ~/.config/sxhkd/* .config/sxhkd/
cp -r ~/.config/polybar/* .config/polybar/
cp -r ~/.config/rofi/* .config/rofi/
cp -r ~/.config/alacritty/* .config/alacritty/
cp -r ~/.config/picom/* .config/picom/
cp -r ~/.config/fontconfig/* .config/fontconfig/
# Menyalin konfigurasi Zsh di home directory
echo "🐚 Menyalin .zshrc..."
cp ~/.zshrc ./

echo "✅ Sinkronisasi selesai! File di ~/dotfiles sudah paling up-to-date."
