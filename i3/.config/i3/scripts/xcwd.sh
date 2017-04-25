#!/bin/bash
# get focused window PID
X_PID=$(xdotool getwindowfocus getwindowpid)

# check if focused window isn't term
SHELL_GREP=$(grep "$0" /proc/"$X_PID"/cmdline)
if ! [[ "$X_PID" ]] || ! $SHELL_GREP; then
    # then open term normally
    termite "$@"
    exit
fi

# get current term cwd
SHELL_PID=$(pgrep -P "$X_PID")
SHELL_CWD=$(readlink "/proc/$SHELL_PID/cwd")

# open new term with same cwd
termite -d "$SHELL_CWD" "$@"
