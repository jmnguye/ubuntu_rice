#!/usr/bin/env bash

for m in $(xrandr | grep " connected" | awk '{print $1}' | xargs); do
	echo "---" | tee -a /tmp/polybar${m}.log /tmp/polybar${m}.log
	MONITOR=$m polybar --reload mybar >> /tmp/polybar${m}.log 2>&1 &
done

echo "Bars launched..."
