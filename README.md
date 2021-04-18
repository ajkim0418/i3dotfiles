# i3dotfiles
Config files and scripts for my Arch Linux environment. Set up to provide a full desktop experience. Using i3wm, polybar, picom, rofi, betterlockscreen, multilockscreen 

## i3 configuration
i3-wm can be downloaded from the package manager. The i3 config file should be placed in $HOME/.config/i3
### Additional configurations and troubleshooting

#### Lock screens
I use two lockscreens, **betterlockscreen** for single display and **multilockscreen** for multiple displays.

[Betterlockscreen](https://aur.archlinux.org/packages/betterlockscreen-git/) can be downloaded from the AUR, but because betterlockscreen is a fork of i3-color, you first need to download [i3-color](https://aur.archlinux.org/packages/i3lock-color/) to get the dependencies

##### For FIRST TIME SETUP:
1) clone this [repository](https://github.com/pavanjadhaw/betterlockscreen) to get the .service configuration. 
2) copy the betterlockscreen@.service file to your ```/etc/systemd/system``` directory
3) Start the service: ```systemctl enable betterlockscreen@$USER```. This will ensure the lockscreen works when your machine is suspended and wakes from sleep.
The betterlockscreen configuration uses the configuration file in /usr/bin/betterlockscreen. Copy the contents from betterlockscreenCOPY to this file
4) To update your wallpaper, run ```betterlockscreen -u <path to wallpaper>```
This should run some updates, and will use this wallpaper each time it is locked

##### Fixing text and box misalignment

If the time and text is not aligned with the default box, it could be due to the DPI value.
Find your current DPI value using ```xdpyinfo | grep -B 2 resolution```
If it's not at 96, change it using xrandr: ```xrandr --dpi 96```

[multilockscreen](https://aur.archlinux.org/packages/multilockscreen/) is a fork of betterlockscreen, but will support multiple displays, and can be downloaded from the AUR. If using betterlockscreen on multiple displays causes scaling issues, multilockscreen will fix it.
multilockscreen uses the configuration file at /usr/bin/multilockscreen. Copy the contents from multilockscreenCOPY to this file. 
To update your wallpaper, run ```multilockscreen  -u <path to wallpaper>```

There is a custom script in the repo ("lockscreendisplays.sh") that switches to the appropriate lockscreen based on single or multi display, and the script can be called in the i3config keybinding

#### Enabling brightness keys in Arch i3
For some distros, the screen brightness keys do not work for i3 out of the box. You can fix this by using the  ```light``` tool, which can be downloaded from your package manager. The general commands to is  ```light -A <value>``` to increase brightness and ```light -U <value>``` to decrease brightness

You might notice that these commands won't run without sudo, to fix these try two things:
1) Add yourself to the ```video``` group to get access to devices: ```usermod -aG <user> video```
2) Allow sudo to access /usr/bin/light without a password. Change to ```%wheel ALL=(ALL) NOPASSWD: /usr/bin/light``` in ```/etc/sudoers```
3) Reboot after making these changes

In your i3 config file, add the change brightness command for the keys  ```XF86MonBrightnessUp``` and ```XF86MonBrightnessDown```

#### Multiple displays
When plugging a laptop running i3 to an external display, i3 may not recognize the display out of the box, even though xrandr shows the display as connected. To automatically enable the display, you need to set some configuration in the ```/etc/X11/xorg.conf.d``` directory.
1) Create a new file called ```11-monitor.conf``` in the directory (Or move the file from this repo to here)
2) Paste the following:
``` 
Section "Monitor"
        Identifier "HDMI-2"
        Option  "Enable"        "True"
EndSection
```
where Identifier is the name of the connected display(s) from ```xrandr```

3) This should now recognize the display once plugged in, and now you can continue configuring the resolution of the display using xrandr

There is a custom script in the repo ("switchdisplays.sh") that updates the resolution and primary display once a new display is plugged in, and additional keybindings that move workspaces to different displays. Reloading i3 should execute this script.

## Polybar configuration
Polybar for Arch Linux is available in the AUR. This is using the latest stable [polybar](https://aur.archlinux.org/packages/polybar/) 

## Rofi
Rofi can be downloaded using the package manager

Rofi now uses config.rasi as it's configuration file. If this file doesn't get downloaded, you can generate it by running ```rofi -upgrade-config```.
This will create the config file ~/.config/rofi/config.rasi. Replace it with the contents from my config.rasi file, and continue configuring from there.

Tip: to edit the colors of rofi, get the color codes from https://comfoxx.github.io/rofi-old-generator/p11-Generator.html 

## Picom
Picom is used as a compositor to enable transparency/opacity in windows. This one is using the [picom-tyrone fork](https://aur.archlinux.org/packages/picom-tryone-git/), which can be downloaded from the AUR. The regular picom does not support certain blur methods like dual_kawase.
To make windows/applications opaque, add them to the ```opacity-rule[]; ``` block
Tip, to find the class name, I use the  ```xprop``` tool, which can be downloaded from your package manager as xorg-xprop. When you run xprop, you can click on any window to get the application information. The class name should be in the "WM_CLASS(STRING)" variable. There's usually two values, use the second value if the first value doesn't work.


