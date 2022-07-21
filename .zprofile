#!/bin/sh

# zsh profile file. Runs on login. Environmental variables are set here.

export ICON_THEME="Infinity_Dark_Icons"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export QT_QPA_PLATFORMTHEME="qt5ct"	# Have QT use qt5ct theme.
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ZSHCFG="$ZDOTDIR/zshcfg"
export ZSH="$ZSHCFG/OMZ"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

export LD_LIBRARY_PATH="/usr/local/lib"
export GOPATH="$HOME/.local/go"
export NPMBIN="$HOME/.local/npm/bin"
export NODE_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/node_modules"
# Adds `~/.local/bin` to $PATH
export SCRIPTS="$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export PATH="$PATH:$GOPATH/bin:$NPMBIN:$SCRIPTS"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pass-store"

# Other program settings:
export SUDO_ASKPASS="${pOS-pass}" # Ask password with dmenu if any command needs it
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
