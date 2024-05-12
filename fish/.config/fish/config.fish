alias ls="eza --icons"
alias v="nvim"
alias nv="neovide"

abbr --add gcl git clone
abbr --add vconfig nvim ~/.config/nvim/
abbr --add fishconfig nvim ~/.config/fish/config.fish
abbr --add hyprconfig nvim ~/.config/hypr/hyprland.conf
abbr --add wayconfig nvim ~/.config/waybar/config.jsonc
abbr --add alacrittyconfig nvim ~/.config/alacritty/alacritty.toml
abbr --add m make -j 4

abbr --add gitconfig nvim ~/.gitconfig
abbr --add gst git status
abbr --add g git
abbr --add ga git add
abbr --add gaa git add -A

fish_add_path ~/.local/bin/
fish_add_path ~/.local/share/bob/nvim-bin/
fish_add_path  ~/go/bin/

 fish_vi_key_bindings

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
export GPG_TTY=$(tty)
