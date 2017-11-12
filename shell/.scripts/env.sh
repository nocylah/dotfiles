#!/bin/sh

alias dd="dcfldd"
alias cp="rsync -P"

alias e="nvim"
alias p="yaourt"
alias g="git"

alias sbcl="rlwrap sbcl"
alias slime="tmux -L slime new-session"

alias atmux="tmux a || tmux"

alias resource="source ~/.scripts/env.sh"

alias ssh="env TERM=xterm-256color ssh"
alias socks="autossh -M 0 -v -TND 5115"
alias ccat="highlight --force -O truecolor -s autumn \<"

alias next="feh --randomize --recursive --no-fehbg --bg-fill ~/.wallpaper"

alias tree="tree -C"

export LESS='--raw-control-chars'
export LESSOPEN="| highlight --line-numbers --force -O truecolor -s autumn %s"

export EDITOR=nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

export PATH=$PATH:/home/louis/.gem/ruby/2.1.0/bin
export PATH=$PATH:/usr/local/bin:/usr/local/sbin
export PATH=$PATH:$HOME/.local/bin

# rust cargo path
export PATH=$PATH:$HOME/.cargo/bin

# GNUStep CLASSPATH fix
export CLASSPATH=".:$CLASSPATH"

# colored man output
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;166m'
