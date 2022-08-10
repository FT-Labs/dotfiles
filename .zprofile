#!/bin/sh

# zsh profile file. Runs on login. Environmental variables are set here.

sync_theme() {
    dest=$(ls $1/*.sync)
    yes | cp -f $dest ${dest::-5}
    sed -i "s/ICON_THEME/$ICON_THEME/g" ${dest::-5}
}

export TERMINAL=alacritty


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export QT_QPA_PLATFORMTHEME="qt5ct"	# Have QT use qt5ct theme.
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ZSHCFG="$ZDOTDIR/zshcfg"
export ZSH="$ZSHCFG/OMZ"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export BM_DIR=""

export ICON_THEME="Papirus-Dark"
export SYNC_ROFI="${XDG_CONFIG_HOME:-$HOME/.config}/rofi" && sync_theme $SYNC_ROFI
export SYNC_GTK="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0" && sync_theme $SYNC_GTK
export SYNC_JGMENU="${XDG_CONFIG_HOME:-$HOME/.config}/jgmenu" && sync_theme $SYNC_JGMENU

export LD_LIBRARY_PATH="/usr/local/lib"
export GOPATH="$HOME/.local/go"
export NPMBIN="$HOME/.local/npm/bin"
export NODE_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/node_modules"
# Adds `~/.local/bin` to $PATH
export SCRIPTS="$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export PATH="$PATH:$GOPATH/bin:$NPMBIN:$SCRIPTS"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pass-store"

# Other program settings:
export SUDO_ASKPASS="$(which pOS-pass)" # Ask password with dmenu if any command needs it
export LESS_TERMCAP_mb=$(tput bold; tput setaf 39)
export LESS_TERMCAP_md=$(tput bold; tput setaf 45)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput setaf 75)
export LESS_TERMCAP_se=$(tput setaf 114)
export LESS_TERMCAP_us=$(tput setaf 114)
export LESS_TERMCAP_ue=$(tput setaf 114)
