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
abbr --add bctl bluetoothctl
abbr --add hx helix
abbr --add z zeditor

abbr --add gitconfig nvim ~/.gitconfig
abbr --add gst git status
abbr --add g git
abbr --add ga git add
abbr --add gaa git add -A

fish_add_path ~/.local/bin/
fish_add_path ~/.local/share/bob/nvim-bin/
fish_add_path ~/go/bin/
fish_add_path ~/projects/fish-lsp/bin

fish_vi_key_bindings

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
export GPG_TTY=$(tty)

function zellij_tab_name_update_pre --on-event fish_preexec
    if set -q ZELLIJ
        set title (string split ' ' $argv)[1]
        command nohup zellij action rename-tab $title >/dev/null 2>&1
    end
end

function zellij_tab_name_update_post --on-event fish_postexec
    if set -q ZELLIJ
        command nohup zellij action rename-tab (basename $SHELL) >/dev/null 2>&1
    end
end

set previous_cmd "fish"
function set_previous_command --on-event fish_postexec
    set previous_cmd $argv[1]
end

function run_pre_root
    echo "running: $previous_cmd"
    /usr/bin/sudo $previous_cmd
end

set fish_greeting
