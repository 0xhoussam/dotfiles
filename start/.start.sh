#!/bin/bash

export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export HYPRLAND_LOG_WLR=1
export XDG_CONFIG_HOME=~/.config

exec Hyprland
