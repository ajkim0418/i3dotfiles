# i3dotfiles
Config files and scripts for my Arch Linux environment. Set up to provide a full desktop experience. Using i3wm, polybar, picom, rofi. 

## i3 configuration
i3 can be downloaded from using the package manager. The i3 config file should be placed in $HOME/.config/i3

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
To make windows/applications opaque, add them to the ```opacity-rule[]; ```


