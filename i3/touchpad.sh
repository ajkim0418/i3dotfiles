#Download xorg-xinput using sudo pacman -S xorg-input
#Copy the default synaptics conf file 
# cp /usr/share/X11/70-synaptics.conf /etc/X11/xorg.conf.d

#See the current touchpad settings using xinput.
# Use xinput list to see if using libinput or synaptics. This script is for libinput
#xinput list-props "Synaptics TM3072-003"

#Tap to click
xinput set-prop "Synaptics TM3072-003" 'libinput Tapping Enabled' 1

#Natural reverse scroll 
xinput set-prop "Synaptics TM3072-003" 'libinput Natural Scrolling Enabled' 1

#Disable right click on right side of the area, enable two finger right click on touchpad
#xinput set-prop "Synaptics TM3072-003" 'libinput Click Method Enabled' 0, 1
synclient RightButtonAreaLeft=0
synclient RightButtonAreaTop=0
