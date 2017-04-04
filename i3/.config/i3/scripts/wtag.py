#!/usr/bin/env python3

import json
from subprocess import check_output, call
import sys

# get passed command
if len(sys.argv) != 2:
    sys.exit(1)
cmd = sys.argv[1]

# get the current focused workspace
try:
    out = json.loads(check_output('i3-msg -t get_workspaces'.split()))
    cur = [w for w in out if w['focused']][0]
except:
    sys.exit(1)

# reset workspace tag to #
if cmd == 'reset':
    i3_exec = 'i3-msg rename workspace to {}'.format(cur['num']).split()
# get new workspace tag
elif cmd == 'rename':
    i3_pre = 'Tag: '
    i3_font = '-*-terminesspowerline-*-*-*-*-32-*'
    i3_cmd = 'rename workspace to {}:%s'.format(cur['num'])
    i3_exec = ['i3-input',
               '-F', i3_cmd,
               '-f', i3_font,
               '-P', i3_pre,
               '-l', '10'
    ]
# not called correctly?
else:
    sys.exit(1)

# call the command
call(i3_exec)
