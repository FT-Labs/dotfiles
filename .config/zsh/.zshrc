# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Fetch all plugins in dir
plugins=(`echo $(ls $ZSH/plugins | sed -z 's/\n/ /g')`)


# # Basic auto/tab complete:
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
setopt extendedglob
_comp_options+=(globdots)		# Include hidden files.

phylog() {
    cat | curl -F 'f:1=<-' ix.io
}

qcow2img() {
    qemu-img create disk.qcow2 $1
}

quickemugenconf() {
    iso=$(ls $1/*.iso)
    src=$(cat << EOF
#!/bin/quickemu --vm
guest_os="linux"
disk_img="$1/disk.qcow2"
iso="$iso"
EOF
)
    echo -e "$src" > $1.conf
}

umountforce() {
    fuser -km $1
    umount $1
}

urltotar() {
    curl -L $1 | tar xvfz - -C $2
}

tarxz() {
    XZ_OPT=-$1 tar cJvf $2 .
}

mntqcow2() {
    lsmod | grep nbd || sudo modprobe nbd
    sudo qemu-nbd --format qcow2 $1 --connect $2
}

githttptossh() {
    git remote set-url origin git@github.com:$(git remote get-url origin | rev | cut -d '/' -f -2 | rev)
}

brickftp(){
# If target file/dir given download the contents to a case directory
if [[ -n $1 ]]; then
  for x in "$@"; do
    casenum=$(echo $x | awk -F/ '{print $4}'); dir=~/tickets/$casenum;
    # Create and/or switch to the download directory for the case
    if [[ ! -d $dir ]]; then mkdir -p $dir; cd $dir; else cd $dir; fi;
    # Mirror directory or download single file
    if [[ $x =~ (/customers/.*/$) ]]; then
      lftp -e "mirror --only-newer $x; quit" sftp://brick;
    elif [[ $x =~ (/customers/|/uploads/) ]]; then
      lftp -e "pget -n5 $x; quit" sftp://brick;
    fi;
  done;
# If no target given just log into Brick
else lftp sftp://brick; fi
}

# Use lf to switch directories and bind it to ctrl-r
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^r' 'lfcd\n'
# below opens a new terminal in current dir
bindkey -s '^t' 't\n'
setopt chaselinks
setopt autocd
# change below theme if using oh-my-zsh
#ZSH_THEME=""
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Load aliases
[ -f "$ZSHCFG/aliasrc" ] && source "$ZSHCFG/aliasrc"

# Note that in different distro or installation way below source files need to be changed, they are usually in ~/.zsh/
source "$ZSHCFG/OMZ/oh-my-zsh.sh"
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath' # remember to use single quote here!!!
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:phint:argument-rest' fzf-preview 'echo ${${(M)desc%-- *}:2}'
zstyle ':fzf-tab:complete:phint:argument-rest' fzf-flags --no-sort --preview-window=down:10%:wrap
zstyle ':fzf-tab:*' single-group color header
zstyle -d ':completion:*' format
zstyle ':completion:*:descriptions' format '[%d]'


# vi mode
bindkey -v
export KEYTIMEOUT=1
export GPG_TTY=$(tty)
if [ ! -z $BM_DIR ]; then
    cd -P $BM_DIR &&
    export BM_DIR=""
fi

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Below to change autosuggestion options
bindkey '^[[Z' autosuggest-accept   # shift tab to accept ghost text
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

powerline-daemon -q

case "$TERM" in (rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
    local term_title () { print -n "\e]0;${(j: :q)@}\a" }
    precmd () {
      local DIR="$(print -P '[%c]')"
      term_title "$DIR" "st"
    }
    preexec () {
      local DIR="$(print -P '[%c]%#')"
      local CMD="${(j:\n:)${(f)1}}"
      #term_title "$DIR" "$CMD" use this if you want directory in command, below only prints program name
	  term_title "$CMD"
    }
  ;;
esac
