
# SEMUA AKAN TERKENDALI JIKA DI LANDASI DENGAN BISMILLAH

Pastikan Anda menginstall archlinux menggunakan desktop profile bspwm
Dan Settingan ini Hanya Aku yang tau, Kalo mau oprek ya sak karep mu

## Documentation

[Rofi](https://github.com/dctxmei/rofi-themes)

## Penyesuaian Wallapaper (Default saat startx)
Ganti lokasi file wallpaper di bagian 3

 ```bash
nano ~/.config/bspwm/bspwmrc
```
```bash
#! /bin/sh

pgrep -x sxhkd > /dev/null || sxhkd &

bspc monitor -d 1 2 3 4 5 6 7 8 9 10

bspc config border_width         2
bspc config window_gap          12

bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off

# Setup Resolusi 1080p Mode Mirror
xrandr --output eDP-1 --mode 1920x1080 --output HDMI-1 --mode 1920x1080 --same-as eDP-1 &

# Mematikan screen blanking dan DPMS (Power Management X11)
xset s off -dpms &

# -- AUTOSTART Ricing --

# 1. Menjalankan Picom untuk transparansi, shadow, dan animasi
picom &

# 2. Menjalankan Dunst untuk sistem notifikasi
dunst &

# 3. Menjalankan Feh untuk Wallpaper (Nanti sesuaikan nama filenya)
feh --bg-fill <Lokasi File Wallpaper> &

# 4. Menjalankan Polybar (Panel atas)
polybar example &

# Menjalankan agen autentikasi GUI (Polkit) untuk pop-up password
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Menjalankan ikon Network/Wi-Fi di System Tray Polybar
nm-applet &

# Menjalankan daemon notifikasi
dunst &
 ```

## Penyesuaian Wallapaper (Pilih Wallpaper)
Arahkan `WALL_DIR` ke lokasi Wallpaper anda

```bash
nano ~/.config/rofi/wallpaper_menu.sh
```
```bash
#!/bin/bash

# Arahkan ke folder yang sama
WALL_DIR="/home/user/Pictures/Wallpaper-Bank/wallpapers/"

# Ambil daftar nama file gambar saja (agar rapi di Rofi)
PICS=$(ls -1 "$WALL_DIR" | grep -E '\.(jpg|jpeg|png)$')

# Tampilkan di menu Rofi dan simpan pilihan user
CHOSEN=$(echo "$PICS" | rofi -dmenu -i -p " Wallpaper:")

# Jika user memilih sesuatu (tidak menekan ESC), terapkan gambarnya!
if [ -n "$CHOSEN" ]; then
    feh --bg-fill "$WALL_DIR/$CHOSEN"
fi


```


## Shortcut Keyboard
pastikan Keyboard mu versi US

 ```bash
# ==========================================
# HOTKEY UMUM (APLIKASI)
# ==========================================

# Membuka terminal (Alacritty)
super + p
	/home/user/.config/rofi/powermenu/type-5/powermenu.sh	

# Membuka terminal (Alacritty)
super + Return
	kitty

# Membuka Web Browser (Firefox)
super + b
	firefox &

# Membuka Web Browser (Firefox)
super + e
	nautilus &

# Membuka Menu Aplikasi (Rofi)
super + @space
	/home/user/.config/rofi/launchers/type-2/launcher.sh

# Ambil Screenshot (Pilihan Full atau Area)
super + Print
    ~/.config/bspwm/screenshot.sh

# Memuat ulang (reload) konfigurasi sxhkd (Berguna jika kamu baru mengedit file ini)
super + Escape
	pkill -USR1 -x sxhkd

# ==========================================
# KONTROL BSPWM (SISTEM)
# ==========================================

# Keluar bspwm (Logout) / Restart bspwm tanpa menutup aplikasi
super + alt + Escape
	bspc {quit,wm -r}

# Menutup paksa aplikasi (Kill / Close)
super + q
	bspc node -c

# Berganti antara mode layout tiled (biasa) dan monocle (fokus 1 aplikasi penuh)
super + m
	bspc desktop -l next

# ==========================================
# MANAJEMEN JENDELA (STATE & FLAGS)
# ==========================================

# Mengatur mode jendela: tiled (t), pseudo_tiled (shift + t), atau floating (s)
super + {t,shift + t,s}
	bspc node -t {tiled,pseudo_tiled,floating}

# Toggle Fullscreen (Penuh layar / Kembali semula)
super + f
	bspc node -t \~fullscreen

# Mengatur flag jendela tambahan: marked (m), locked (x), sticky (y), private (z)
super + ctrl + {m,x,y,z}
	bspc node -g {marked,locked,sticky,private}

# ==========================================
# FOKUS & PINDAH POSISI (WINDOW MANAGEMENT)
# ==========================================

# Fokus berpindah antar jendela secara spesifik (Kiri / Kanan)
super + {h,l}
	bspc node -f {west,east}

# Menukar posisi jendela secara dinamis (Kiri/Kanan)
super + j
	bspc node -s next.local.leaf.!hidden.window

# Mengubah orientasi layout dari Kiri-Kanan menjadi Atas-Bawah (Rotasi 90 derajat)
super + k
	bspc node -R 90

# Pindah fokus mengikuti alur hierarki bspwm
super + {p,b,comma,period}
	bspc node -f @{parent,brother,first,second}

# Fokus jendela berikutnya (Alt + Tab style native bspwm)
alt + Tab
	bspc node -f next.local.!hidden.window

# Fokus jendela sebelumnya (Alt + Shift + Tab berjalan mundur)
alt + shift + Tab
	bspc node -f prev.local.!hidden.window

# Pindah fokus antar desktop (workspace) ke Kiri/Kanan
super + bracket{left,right}
	bspc desktop -f {prev,next}.local

# Kembali ke aplikasi / desktop yang terakhir dibuka (history switch)
super + {grave,Tab}
	bspc {node,desktop} -f last

# Memindahkan aplikasi ke desktop (workspace) angka 1-9
# (Tekan Super + Angka untuk pindah workspace, Shift + Super + Angka untuk melempar aplikasi)
super + {_,shift + }{1-9,0}
	bspc {desktop -f,node -d} '^{1-9,10}'

# ==========================================
# PRESELECT (MENYIAPKAN AREA SEBELUM APLIKASI DIBUKA)
# ==========================================

# Menyiapkan arah area kosong sebelum membuka terminal baru
super + ctrl + {h,j,k,l}
	bspc node -p {west,south,north,east}

# Menentukan rasio ukuran pembagian jendela (1-9)
super + ctrl + {1-9}
	bspc node -o 0.{1-9}

# Batal preselect pada jendela yang sedang aktif
super + ctrl + space
	bspc node -p cancel

# Batal preselect pada semua jendela di desktop saat ini
super + ctrl + shift + space
	bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

# ==========================================
# MENGUBAH UKURAN (RESIZE) & PINDAH JENDELA FLOATING
# ==========================================

# Memperbesar ukuran jendela (Expand)
super + alt + {h,j,k,l}
	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

# Memperkecil ukuran jendela (Contract)
super + alt + shift + {h,j,k,l}
	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

# Memindahkan posisi jendela yang sedang dalam mode "Floating"
super + {Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}

# ==========================================
# MULTIMEDIA & MENU TAMBAHAN
# ==========================================

# Kontrol Suara (Volume)
XF86AudioRaiseVolume
	pamixer -i 5

XF86AudioLowerVolume
	pamixer -d 5

XF86AudioMute
	pamixer -t

# Kontrol Kecerahan Layar (Brightness)
XF86MonBrightnessUp
	brightnessctl set +5%

XF86MonBrightnessDown
	brightnessctl set 5%-

# Menu Power (Shutdown/Reboot)
super + x
	~/.config/rofi/powermenu.sh

# Menu Pemilih Wallpaper
super + w
	~/.config/rofi/wallpaper_menu.sh
 ```


# Pebaikan
## Jika Terjadi masalah pada rofi atau rofi tidak mau di jalankan Lakukan langkah ini

Hapus Isi config rofi
```bash
rm -rf ~/.config/rofi/*
```

Copy config rofi dari archdotfiles
```bash
cp -rf ~/archdotfiles/.config/rofi/* ~/.config/rofi/
```

Resart bspwm
```bash
windows + alt + esc
```
