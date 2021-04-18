if xrandr | grep -q "HDMI2 disconnected"; then
        xrandr --output HDMI2 --off
	xrandr -s 14--primary
elif xrandr | grep -q "HDMI2 connected"; then
        xrandr --output HDMI2 --mode 1920x1080 --above eDP1 --primary
fi


