#!/bin/bash

echo "🚀 Memulai Instalasi Dotfiles wrjunior (Versi Full Animasi)..."

# 1. Update sistem dan instal seluruh dependensi dari Repo Resmi
echo "📦 Menginstal dependensi dari repositori resmi..."
sudo pacman -Syu --needed ttf-firacode-nerd noto-fonts-emoji bspwm sxhkd polybar rofi kitty dunst feh \
thunar thunar-archive-plugin gvfs lxappearance papirus-icon-theme materia-gtk-theme \
polkit-gnome network-manager-applet xorg-xset pamixer brightnessctl \
ttf-jetbrains-mono-nerd ttf-font-awesome ttf-firacode-nerd ttf-hack-nerd \
curl git base-devel zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting

# 2. Instal AUR Helper (yay) jika belum ada
if ! command -v yay &> /dev/null; then
    echo "🛠️ Yay tidak ditemukan. Menginstal yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd -
fi

# 3. Instal Picom FT-Labs (untuk animasi bergeser)
echo "✨ Menginstal Picom FT-Labs dari AUR..."
yay -S --needed --noconfirm picom-ftlabs-git

# 4. Menyalin konfigurasi ke ~/.config dan Home
echo "📂 Menempatkan file konfigurasi ke tempatnya..."
mkdir -p ~/.config
cp -r .config/* ~/.config/
cp .zshrc ~/

# 5. Memastikan file script memiliki izin eksekusi
echo "🔧 Mengatur file permission..."
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/rofi/powermenu.sh
chmod +x ~/.config/rofi/wallpaper_menu.sh
chmod +x ~/.config/bspwm/random_wallpaper.sh

# 6. Mengubah Shell Default ke Zsh
echo "🐚 Mengubah shell default ke Zsh..."
sudo chsh -s $(which zsh) $USER

# 7. Mengaktifkan NetworkManager
echo "🌐 Mengaktifkan Network Manager..."
sudo systemctl enable NetworkManager

echo "✅ SEMUA SELESAI!"
echo "⚠️ Silakan Reboot sistem untuk menerapkan perubahan Shell dan NetworkManager."
