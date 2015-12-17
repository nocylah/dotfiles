#!/bin/bash
if ! mountpoint -q /home/louis/sync; then
    pass me/syncthing/ssync | encfs --idle=5 --stdinpass /home/louis/.ssync /home/louis/sync
fi
