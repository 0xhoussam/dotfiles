#!/bin/bash

alias refreshenv="bash;exit"

sudo pacman -Syu --needed git vim neovim base-devel

# yay

if ! command -v yay &> /dev/null
then
	git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si && refreshenv
	cd -
fi

# window manager

sudo pacman -S --needed sway

# utility

yay -S --needed stow alacritty firefox unzip zsh exa bat neovide \
	python gtk4 gtk3 sassc glib2 gdk-pixbuf2 adwaita-dark darkman \
  man-pages man-db waybar ttf-font-awesome zathura zathura-pdf-mupdf \
  brightnessctl bluez bluez-utils mako libnotify remind imv mpv swaybg \
  gcc make valgrind g++ swayidle swaylock-effects intel-ucode mesa \
  vulkan-radeon openssh wl-clipboard wofi vulkan-intel xdg-utils \
  zathura-cb zathura-djvu grim slurp swappy xdg-desktop-portal

# rust

if ! command -v cargo &> /dev/null
then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi


# node

if ! command -v volta &> /dev/null
then
	curl https://get.volta.sh | bash && refrechenv && volta install node
fi

# Lunarvim

if ! command -v lvim &> /dev/null
then
yes | bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
fi

mkdir -p ~/.local/bin

ls -d */ | xargs stow
