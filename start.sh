#!/usr/bin/env bash

if ! vncserver; then
    echo "Failed to start the VNC server"
    exit 1
fi

echo "Waiting for XFCE to start"

while ! ps | grep xfce4-session > /dev/null; do
    sleep 1
done

echo "XFCE started"

while ps | grep xfce4-session > /dev/null; do
    sleep 1
done

echo "Session ended"
exit 0
