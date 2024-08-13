{ pkgs }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      "$mainMod" = "SUPER";
      imports = [
        ./bind.nix
        ./env.nix
        ./exec-once.nix
        ./devices.nix
        ./input.nix
        ./exec.nix
        ./general.nix
        ./decoration.nix
        ./animation.nix
        ./other.nix
        ./window-rules.nix
      ];

      monitor = [
        ",preferred,auto,1"
      ];

      gestures = {
        workspace_swipe = true;
      };
      dwindle = {
        preserve_split = true;
        special_scale_factor = 1;
      };

      layerrule = [
        "blur,waybar"
        "blur,anyrun"
        "blur,notifications"
      ];

    };
  };
}
