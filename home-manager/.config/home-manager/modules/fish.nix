{ pkgs }:
{
  packages.fish = {
    enable = true;
    interactiveShellInit = /*fish*/ "
      set fish_greeting
      ";
    shellAbbrs = {
      # git
      g = "git";
      gcl = "git clone";
      gst = "git status";
      ga = "git add";
      gaa = "git add --all";
      gm = "git commit";
      gitconfig = "$EDITOR ~/.gitconfig";

      bctl = "bluetoothctl";
      m = "make -j (nproc)";
      v = "nvim";
      nv = "neovide";

      hm = "home-manager";
    };
    shellAliases = {
      ls = "eza --icons";
    };

    shellInit = /*fish*/ "
		fish_add_path ~/.local/bin/
		fish_add_path ~/.local/share/bob/nvim-bin/
		fish_add_path ~/go/bin/
		fish_add_path ~/projects/fish-lsp/bin

		fish_vi_key_bindings

		set fish_cursor_default block
		set fish_cursor_insert line
		set fish_cursor_replace_one underscore
		set fish_cursor_visual line
		set -g fish_vi_force_cursor 1

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

	  ";


  };
}
