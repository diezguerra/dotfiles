# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kennethreitz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

AUTO_CD=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(osx, git, python, history-substring-search, zsh-syntax-highlighting z)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/go/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

setopt APPEND_HISTORY

export EDITOR="vim"
export PAGER="less"

f() { find . -name "*"$1"*" ${(@)argv[2,$#]} }
search() { ack -nR $1 . }

gd() { git diff $* }
gs() { git status $* }
gl() { git la $* }
gpl() { git pull origin $* }
gps() { git push origin $* }

alias ls="ls -alhG"
alias ..="cd .."
alias ...="cd ..."
alias ....="cd ...."
alias .....="cd ....."
alias gittags="git fetch && git fetch --tags && git tag -l | gsort -V | tail -n 5"
alias tf="z pysplash && workon tf && source ../environment/env-vars.sh"

#bindkey -v
bindkey '^R' history-incremental-search-backward
export PGDATA=/usr/local/var/postgres
export WORKON_HOME=~/.envs
source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Added when node decided to be stupid and hide
export PATH=/usr/local/Cellar/node/0.10.29/bin:$PATH

autoload -U promptinit && promptinit
prompt pure
