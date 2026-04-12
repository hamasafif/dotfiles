# SEMUA AKAN TERKENDALI JIKA DI LANDASI DENGAN BISMILLAH

Pastikan Anda menginstall archlinux menggunakan desktop profile bspwm


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
 

