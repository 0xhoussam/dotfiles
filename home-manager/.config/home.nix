{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pride";
  home.homeDirectory = "/home/pride";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.btop
    pkgs.bat

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = "
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

      shellInit = "
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
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/pride/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
