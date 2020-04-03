#!/usr/bin/env bash

if [ "$1" == "" ] ; then
	echo "Missing parameter : hdmi , lvds, dual"
else
	killall -q polybar
	
	case $1 in
	hdmi)
		echo "---" | tee -a /tmp/polybarhdmi1.log
		polybar hdmi1 >>/tmp/polybarhdm1.log 2>&1 &
		;;
	lvds)
		echo "---" | tee -a /tmp/polybarlvds1.log
		polybar lvds1 >>/tmp/polybarlvds1.log 2>&1 &
		;;
	dual)
		echo "---" | tee -a /tmp/polybarlvds1.log /tmp/polybarhdmi1.log
		polybar lvds1 >>/tmp/polybarlvds1.log 2>&1 &
		polybar hdmi1 >>/tmp/polybarhdm1.log 2>&1 &
		;;
	esac
	
	echo "Bars launched..."
fi
