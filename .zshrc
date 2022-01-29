# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

AUTO_CD=true

setopt APPEND_HISTORY

export EDITOR="vim"
export PAGER="less"

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# Cargo binaries

export PATH=/Users/saul/.cargo/bin/:$PATH

f() { find . -name "*"$1"*" ${(@)argv[2,$#]} }
search() { ack -nR $1 . }

gd() { git diff $* }
gs() { git st $* }
gl() { git la $* }

alias ls="ls -alhG"
alias ..="cd .."
alias ...="cd ..."
alias ....="cd ...."
alias .....="cd ....."
alias tf="z pysplash && workon tf && source ../environment/env-vars.sh"

# Turn Vi mode on, and a right prompt marker for normal mode
bindkey -v
INITIAL_RPS1=$RPS1
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg[yellow]%} ◙ %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $INITIAL_RPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# "CtrlP"
bindkey '^R' history-incremental-search-backward

autoload -U promptinit && promptinit

# Poor man's dynamic motd
uname -a
uptime
date

export PYTHONDONTWRITEBYTECODE=yesplease


alias usboff="cd /System/Library/Extensions/ && sudo kextunload IOUSBMassStorageClass.kext && cd -"
alias usbon="cd /System/Library/Extensions/ && sudo kextload IOUSBMassStorageClass.kext && cd -"

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"

eval "$(starship init zsh)"

function echo_color() {
      local color="$1"
      printf "${color}$2\033[0m\n"
    }

echo_color "\033[0;90m" "c-f  Move forward"
echo_color "\033[0;90m" "c-b  Move backward"
echo_color "\033[0;90m" "c-p  Move up"
echo_color "\033[0;90m" "c-n  Move down"
echo_color "\033[0;90m" "c-a  Jump to beginning of line"
echo_color "\033[0;90m" "c-e  Jump to end of line"
echo_color "\033[0;90m" "c-d  Delete forward"
echo_color "\033[0;90m" "c-h  Delete backward"
echo_color "\033[0;90m" "c-k  Delete forward to end of line"
echo_color "\033[0;90m" "c-u  Delete entire line"
