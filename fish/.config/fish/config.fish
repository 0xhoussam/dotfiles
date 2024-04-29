alias ls="eza --icons"

abbr --add gcl git clone

fish_add_path ~/.local/bin/

 fish_vi_key_bindings
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
