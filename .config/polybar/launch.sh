#!/usr/bin/env bash
killall -q polybar

echo "---" | tee -a /tmp/polybarexample.log
polybar example >>/tmp/polybarexample.log 2>&1 &

echo "Bars launched..."
