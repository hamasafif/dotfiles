#!/bin/bash

# Matikan semua bar yang sedang berjalan
killall -q polybar

# Tunggu sampai proses benar-benar berhenti
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Jalankan bar utama (mengarah ke config.ini yang sudah di-link)
polybar example &
