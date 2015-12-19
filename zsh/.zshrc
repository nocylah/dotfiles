# Source extra scripts
for f in ~/.scripts/*; do source $f; done

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=10

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(fbterm mosh tmux git git-extras systemd archlinux zsh-syntax-highlighting autojump vi-mode)

source $ZSH/oh-my-zsh.sh

alias dd="dcfldd"
alias sbcl="rlwrap sbcl"
alias tmux="tmux -2"
alias resource="source ~/.zshrc"
alias socks="mosh --ssh='ssh -v -TND 5115'"
alias ccat="pygmentize -f terminal -g"
alias e="nvim"
alias y="yaourt"

function supertex() {
while true; do
    inotifywait -e modify $1
    texexec --nonstopmode $1
    pdftotext -layout *.pdf -
done
}

function pdf() {
    pdftotext -nopgbrk -layout $1 - | less
}

export EDITOR=nvim

export PATH=$PATH:/home/louis/.gem/ruby/2.1.0/bin
export PATH=$PATH:/usr/local/bin:/usr/local/sbin
export PATH=$PATH:$HOME/.local/bin

# rust cargo path
export PATH=$PATH:$HOME/.cargo/bin

# GNUStep CLASSPATH fix
export CLASSPATH=".:$CLASSPATH"

# colored man output
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# don't nest tmux
if [ -z "$TMUX" ] && ! [ -n "$SSH_CLIENT" ]
then if [ -n "${DISPLAY+1}" ]
    then exec tmux -2
    else TERM="fbterm" tmux; exit
    fi
fi

