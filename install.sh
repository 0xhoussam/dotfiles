yay -S --needed stow hyprland alacritty neovim neovide \
  firefox wofi unzip brave-bin zsh fish gtk4 gtk3  \
  zathura zathura-djvu zathura-pdf-mupdf bluez bluez-utils yt-dlp waybar \
  hyprpaper-git ttf-font-awesome pacman-contrib android-file-transfer mpd github-cli eza man-db man-pages otf-font-awesome \
  udisks2 axel

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

sudo systemctl enable bluetooth.service

cd ~ && cd dotfiles && stow */
