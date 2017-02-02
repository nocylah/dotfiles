#!/bin/sh

alias dd="dcfldd"
alias cp="rsync -P"

alias e="nvim"
alias p="pacaur"
alias g="git"

alias sbcl="rlwrap sbcl"
alias slime="tmux -L slime new-session"

alias resource="source ~/.scripts/env.sh"

#alias ssh="TERM=xterm-color ssh"
alias socks="autossh -M 0 -v -TND 5115"
alias ccat="pygmentize -f terminal16m -O style=monokai -g"

alias next="feh --randomize --recursive --no-fehbg --bg-fill ~/.wallpaper"

alias tree="tree -C"
export LESSOPEN="| pygmentize -f terminal16m -O style=monokai -g %s"

fwait() {
    inotifywait -e modify "$1"
}

fwdo() {
    FILE="$1"; shift
    if [ ! -f "$FILE" ]; then return 1; fi

    while true; do
        fwait "$*"
        $CMD
    done
}

ctx2pdf() {
    if [ ! -f "$1" ]; then return 1; fi

    while true; do
        fwait "$1"
        context --nonstopmode "$1"
        pdftotext -layout ./.*pdf -
    done
}

md2pdf() {
    FILE="$1"; shift
    if [ ! -f "$FILE" ]; then return 1; fi

    BDIR="build"
    BPDF="build.pdf"

    if [ ! -z "$1" ]; then BDIR="$1"; shift; fi
    if [ ! -z "$1" ]; then BPDF="$1"; shift; fi

    mkdir -p "$BDIR"
    while true; do
        fwait "$FILE"
        #pandoc -V geometry:margin=1in \
        pandoc --filter pandoc-citeproc "$FILE" -o "$BDIR/$BPDF"
        clear
        pdftotext -layout "$BDIR/$BPDF" -
    done
}

md2ctx2pdf() {
    FILE="$1"; shift
    if [ ! -f "$FILE" ]; then return 1; fi

    BDIR="build"
    BPDF="build.pdf"

    if [ ! -z "$1" ]; then BDIR="$1"; shift; fi
    if [ ! -z "$1" ]; then BPDF="$1"; shift; fi

    mkdir -p "$BDIR"
    while true; do
        fwait "$FILE"
        pandoc -s \
               -t context \
               "$@" \
               "$FILE" -o "$BDIR/con.tex"
        context --nonstopmode \
                --noconsole \
                --result="$BDIR/$BPDF" \
                "$BDIR/con.tex"
        clear
        pdftotext -layout "$BDIR/$BPDF" -
    done
}

showpdf() {
    pdftotext -nopgbrk -layout "$1" - | less
}

# reverse sshfs
rsshfs() {
    dpipe /usr/lib/ssh/sftp-server = ssh "$1" sshfs ":$2" "$3" -o slave,idmap=user
}

# plan9 cpu, lol
cpu() {
    # make a temp mount dir
    mnt=$(ssh "$1" mktemp -d)
    # rsshfs mount
    rsshfs "$1" "$(pwd)" "$mnt" &
    bpid=$!
    # wait a second for rsshfs to finish mounting
    sleep 1;
    # ssh in, premptively lazy unmount (in case session is lost)
    ssh -t "$1" "cd $mnt; fusermount -uz $mnt; \$SHELL"
    # cleanly kill rsshfs
    kill -15 "$bpid"
}

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
