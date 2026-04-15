# ==========================================
# PENGATURAN DASAR & HISTORY
# ==========================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups

# Mengaktifkan Autocomplete yang lebih pintar
autoload -Uz compinit
compinit

# ==========================================
# CUSTOM PROMPT (TEMA BUATAN SENDIRI)
# ==========================================
# Mengaktifkan deteksi warna
autoload -U colors && colors

# Mengaktifkan deteksi Git Branch
autoload -Uz vcs_info
precmd() { vcs_info }
# Format untuk Git: Menampilkan ikon cabang (branch) jika ada di dalam folder repo
zstyle ':vcs_info:git:*' formats ' %F{240} %b%f'
setopt PROMPT_SUBST
# Desain Prompt:
# Baris 1:  user at 󰒋 host in  folder [ branch]
# Baris 2: ❯❯❯
PROMPT=$'\n%F{green} %n%f %F{240}at%f %F{blue}󰒋 %m%f %F{240}in%f %F{yellow} %~%f${vcs_info_msg_0_}\n%F{red}❯%F{yellow}❯%F{green}❯%f '

# ==========================================
# MENGAKTIFKAN PLUGIN ARCH LINUX
# ==========================================
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ==========================================
# ALIAS (Jalan Pintas Perintah)
# ==========================================
alias ls='ls --color=auto'
alias ll='ls -la'
alias update='sudo pacman -Syu'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # Berguna kalau dotfiles pakai bare repo nanti
# ==========================================
# KEYBINDINGS (Navigasi Keyboard Terminal)
# ==========================================

# Memperbaiki tombol Home dan End
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line

# Memperbaiki tombol Delete (agar tidak malah mengetik karakter "~")
bindkey '^[[3~' delete-char

# Memperbaiki lompat kata dengan Ctrl + Panah Kiri/Kanan
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
