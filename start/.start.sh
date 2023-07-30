#!/bin/bash

export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export HYPRLAND_LOG_WLR=1
export GTK_THEME=Adwaita:dark
export XDG_CONFIG_HOME=~/.config
export WLR_DRM_DEVICES=/dev/dri/card0

exec Hyprland
