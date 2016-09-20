#!/bin/bash
# get focused window PID
X_PID=$(xdotool getwindowfocus getwindowpid)

# check if focused window isn't term
X_CMD=$(cat /proc/"$X_PID"/cmdline)
if ! [[ "$X_PID" ]] || [[ "$X_CMD" != "termite" ]]; then
    # then open term normally
    termite
    exit
fi

# get current term cwd
SHELL_PID=/proc/$(cut -d ' ' -f 1 < /proc/"$X_PID"/task/"$X_PID"/children)/cwd
SHELL_CWD=$(readlink "$SHELL_PID")

# open new term with same cwd
termite -d "$SHELL_CWD"
