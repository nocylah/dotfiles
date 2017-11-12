#!/bin/bash
if ! mountpoint -q /home/louis/sync && [ -d "~/.ssync" ]; then
    pass me/syncthing/ssync | encfs --stdinpass /home/louis/.ssync /home/louis/sync
fi
