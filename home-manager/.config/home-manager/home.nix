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
  home.packages = with pkgs; [
    btop
    bat
    go
    # anyrun

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

    # anyrun = {
    #   enable = true;
    #   config = {
    #     plugins = [
    #       # An array of all the plugins you want, which either can be paths to the .so files, or their packages
    #       #inputs.anyrun.packages.${pkgs.system}.applications
    #       # ./some_plugin.so
    #       #"${inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins}/lib/kidex"
    #     ];
    #     x = { fraction = 0.5; };
    #     y = { fraction = 0.3; };
    #     width = { fraction = 0.3; };
    #     hideIcons = false;
    #     ignoreExclusiveZones = false;
    #     layer = "overlay";
    #     hidePluginInfo = false;
    #     closeOnClick = false;
    #     showResultsImmediately = false;
    #     maxEntries = null;
    #   };
    #   extraCss = /*css*/''
    #   '';
    #
    #   # extraConfigFiles."some-plugin.ron".text = ''
    #   #   Config(
    #   #     // for any other plugin
    #   #     // this file will be put in ~/.config/anyrun/some-plugin.ron
    #   #     // refer to docs of xdg.configFile for available options
    #   #   )
    #   # '';
    # };

    waybar = {
      enable = true;
      systemd.enable = true;
      settings = [{
        height = 35; # Waybar height (to be removed for auto height)
        spacing = 4; # Gaps between modules (4px)
        modules-left = [ "custom/logo" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "backlight" "pulseaudio" "tray" ];
        tray = {
          spacing = 16;
        };

        clock = {
          format = "{:%d %b   %H:%M}";
          tooltip = false;
        };


        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-icons = {
            car = "";
            default = [ "" "" "" ];
            handsfree = "";
            headphones = "";
            headset = "";
            phone = "";
            portable = "";
          };
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          on-click = "pavucontrol";

        };

        backlight = {
          device = "intel_backlight";
          format = "{percent}%  {icon}";
          format-icons = [ "" ];
        };

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
          on-click = "flatpak run net.nokyan.Resources";
        };

        "custom/logo" = {
          format = "󰣇";
          tooltip = false;
        };
      }];

      style = /*css*/ ''
        * {
          font-family:
            IBM Plex Sans Condensed,
            FontAwesome,
            Noto Sans,
            sans-serif;
          font-size: 14px;
        }

        window#waybar {
          background-color: #1e1e1e;
          color: #f4f4f4;
          transition-property: background-color;
          transition-duration: 0.5s;
        }

        window#waybar.hidden {
          opacity: 0.2;
        }

        #workspaces {
          margin: 0;
          padding: 0;
          background-color: #383838;
          margin: 4px 0;
          border-radius: 10px;
        }

        #workspaces button.active {
          background-color: #3584e4;
          color: #f4f4f4;
          border-radius: 10px;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
        }

        .modules-right {
          background-color: #383838;
          border-radius: 10px;
          margin: 4px 0;
          padding: 0px 10px;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
        }

        @keyframes blink {
          to {
            background-color: #ffffff;
            color: #000000;
          }
        }

        #tray > .passive {
          -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #c01c28;
        }

        #clock {
          padding-right: 10px;
          margin-right: 10px;
          font-weight: bold;
        }

        #pulseaudio {
          padding-right: 10px;
          margin-right: 10px;
        }

        #backlight {
          padding-right: 10px;
          margin-right: 10px;
        }

        #cpu {
          padding-right: 10px;
          margin-right: 10px;
        }

        #custom-logo {
          font-size: 25px;
          margin-right: 25px;
          padding-left: 10px;
        }

        #tray {
          padding-right: 5px;
        }
      '';
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
