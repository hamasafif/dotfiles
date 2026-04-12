#!/bin/bash

echo "🚀 Memulai Instalasi Dotfiles wrjunior..."

# 1. Update sistem dan instal seluruh dependensi (Window Manager, Panel, Rofi, Tema, Applet, Font)
echo "📦 Menginstal dependensi dari repositori resmi..."
sudo pacman -Syu --needed bspwm sxhkd polybar rofi alacritty picom dunst feh \
thunar thunar-archive-plugin gvfs lxappearance papirus-icon-theme materia-gtk-theme \
polkit-gnome network-manager-applet xorg-xset pamixer brightnessctl \
ttf-jetbrains-mono-nerd ttf-font-awesome curl

# 2. Menyalin konfigurasi ke ~/.config
echo "📂 Menempatkan file konfigurasi ke ~/.config/ ..."
mkdir -p ~/.config
cp -r .config/* ~/.config/

# 3. Memastikan file script memiliki izin eksekusi
echo "🔧 Mengatur file permission..."
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/rofi/powermenu.sh
chmod +x ~/.config/rofi/wallpaper_menu.sh
chmod +x ~/.config/bspwm/random_wallpaper.sh

echo "✅ Selesai! Silakan restart bspwm (Super + Alt + Escape) atau Reboot sistem."
