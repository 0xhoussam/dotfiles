alias ls="eza --icons"
alias v="nvim"
alias nv="neovide"

abbr --add gcl git clone
abbr --add vconfig nvim ~/.config/nvim/
abbr --add fishconfig nvim ~/.config/fish/config.fish
abbr --add hyprconfig nvim ~/.config/hypr/hyprland.conf
abbr --add wayconfig nvim ~/.config/waybar/config

fish_add_path ~/.local/bin/
fish_add_path ~/.local/share/bob/nvim-bin

 fish_vi_key_bindings

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
