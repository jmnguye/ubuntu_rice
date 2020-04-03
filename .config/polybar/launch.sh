#!/usr/bin/env bash

if [ "$1" == "" ] ; then
	echo "Missing parameter : hdmi , lvds, dual"
else
	killall -q polybar
	
	case $1 in
	hdmi)
		outputValues=HDMI-1
		;;
	lvds)
		outputValues=LVDS-1
		;;
	dual)
		outputValues="HDMI-1 LVDS-1"
		;;
	esac

	for m in $(echo ${outputValues}); do
		echo "---" | tee -a /tmp/polybar${m}.log /tmp/polybar${m}.log
		MONITOR=$m polybar --reload mybar >> /tmp/polybar${m}.log 2>&1 &
	done

	echo "Bars launched..."
fi
