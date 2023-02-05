sudo pacman -Syu --needed git intel-ucode base-devel

if ! command -v yay &> /dev/null
then
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay && makepkg -si && exec bash && yay -Syu && cd ~ && rm -rf /tmp/yay
fi

yay -S --needed stow hyprland alacritty pipewire  pipewire-alsa pipewire-audio wireplumber neovim neovide \
  gcc kitty firefox wofi unzip brave-bin zsh gtk4 gtk3 vulkan-icd-loader lib32-vulkan-icd-loader vulkan-tools \
  vulkan-intel zathura zathura-djvu zathura-pdf-mupdf radeontop light bluez bluez-utils yt-dlp waybar-hyprland-git \
  hyprpaper-git ttf-font-awesome pacman-contrib android-file-transfer mpd github-cli exa man-db man-pages otf-font-awesome \
  ranger udisks2 axel

# disable touch screen
FILETOUCH=/etc/mkinitcpio.d/hid_multitouch.conf
if [ ! -f "$FILETOUCH" ]; then
	sudo touch "$FILETOUCH"
	sudo echo 'blacklist hid_multitouch' > "$FILETOUCH"
else
    echo "${FILETOUCH} already exists"
fi


DIRPACKER=/home/$USER/.local/share/nvim/site/pack/packer/start/packer.nvim
if [ ! -d "$DIRPACKER" ]; then
	sudo touch "$DIRPACKER"
	sudo echo 'blacklist hid_multitouch' > "$DIRPACKER"
else
    echo "packer already installed"
fi

if ! command -v volta &> /dev/null
then
	curl https://get.volta.sh | bash
	source ~/.zshrc
	volta install node
else
  echo "volta already installed"
fi

sudo systemctl enable bluetooth.service

cd ~ && cd dotfiles && stow */
