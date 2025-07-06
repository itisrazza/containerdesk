#!/usr/bin/env bash

export DISPLAY=":0"

Xvnc :0               \
    -geometry 800x600 \
    -depth 24         \
&

sleep 5
icewmbg &
icewm &

while ps | grep "Xvnc" | grep ":0"; do
    sleep 5
done
