sudo pacman -Syu --needed git intel-ucode base-devel

if ! command -v yay &> /dev/null
then
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay && makepkg -si && exec bash && yay -Syu && cd ~ && rm -rf /tmp/yay
fi

yay -S --needed stow hyprland alacritty pipewire  pipewire-alsa pipewire-audio wireplumber neovim neovide \
  gcc kitty firefox wofi unzip brave-bin zsh gtk4 gtk3 vulkan-icd-loader lib32-vulkan-icd-loader vulkan-tools \
  vulkan-intel zathura zathura-djvu zathura-pdf-mupdf radeontop light bluez bluez-utils yt-dlp waybar-hyprland-git \
  hyprpaper-git ttf-font-awesome

# disable touch screen
FILE=/etc/mkinitcpio.d/hid_multitouch.conf
if [ ! -f "$FILE" ]; then
	sudo touch "$FILE"
	sudo echo 'blacklist hid_multitouch' > "$FILE"
fi

if ! command -v volta &> /dev/null
then
	curl https://get.volta.sh | bash
	source ~/.zshrc
	volta install node
fi

sudo systemctl enable bluetooth.service

cd ~ && cd dotfiles && stow */
