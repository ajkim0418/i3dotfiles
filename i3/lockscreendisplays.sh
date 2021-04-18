#!/bin/bash

if xrandr | grep -q "HDMI2 connected" ; then
	multilockscreen -l --off 60
else
	/usr/bin/betterlockscreen -l
fi



