# i3dotfiles
Config files and scripts for my Arch Linux environment. Set up to provide a full desktop experience. Using i3wm, polybar, picom, rofi. 

## i3 configuration
i3 can be downloaded from using the package manager. The i3 config file should be placed in $HOME/.config/i3
### Additional configurations


#### Enabling brightness keys in Arch i3
For some distros, the screen brightness keys do not work for i3 out of the box. You can fix this by using the  ```light``` tool, which can be downloaded from your package manager. The general commands to is  ```light -A <value>``` to increase brightness and ```light -U <value>``` to decrease brightness
You might notice that these commands won't run without sudo, to fix these try two things:
1) Add yourself to the ```video``` group to get access to devices: usermod -aG <user> video
2) Allow sudo to access /usr/bin/light without a password. Change to ```%wheel ALL=(ALL) NOPASSWD: /usr/bin/light``` in ```/etc/sudoers```

## Polybar configuration
Polybar for Arch Linux is available in the AUR. This is using the latest stable [polybar](https://aur.archlinux.org/packages/polybar/) 

## Rofi
Rofi can be downloaded using the package manager
Rofi now uses config.rasi as it's configuration file. If this file doesn't get downloaded, you can generate it by running
```
rofi -upgrade-config
```
This will create the config file ~/.config/rofi/config.rasi. Replace it with the contents from my config.rasi file, and continue configuring from there.

## Picom
Picom is used as a compositor, to enable transparency/opacity in windows. This one is using the [picom-tyrone fork](https://aur.archlinux.org/packages/picom-tryone-git/), which can be downloaded from the AUR. The regular picom does not support blue methods like dual_kawase.
To make windows/applications opaque, add them to the ```opacity-rule[]; ``` block
Tip, to find the class name, I use the  ```xprop``` tool, which can be downloaded from your package manager as xorg-xprop. When you run xprop, you can click on any window to get the application information. The class name should be in the "WM_CLASS(STRING)" variable. There's usually two values, use the second value if the first value doesn't work.


