#!/bin/bash

query() {
    echo $@ | nc localhost 6602 | tail -n +2
}

dec() {
    echo $1 | jshon -e $2 -u
}

line=""

status=`query status`
state=`dec "$status" status`

if [ "$state" == "stopped" ]; then
    line="spopd ◼"
else
    artist=`dec "$status" artist`
    title=`dec "$status" title`
    symbol="▸"

    if [ "$state" == "paused" ]; then
        symbol="⏸"
    fi

    line="$artist - $title $symbol"

    if [ $BLOCK_BUTTON ]; then
        uri="`dec \"$status\" uri`"
        image="`query uimage \"$uri\" 2`"
        data="`dec \"$image\" data | base64 -d | feh -F -`"
    fi
fi

echo $line

