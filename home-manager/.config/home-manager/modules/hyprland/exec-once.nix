{ pkgs }:
{
  exec-once = [
    "swww-daemon"
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "waybar & mako"
    "blueman-applet"
    "nm-applet --indicator"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
    "swayosd-server"
    "hypridle"
    "walker --gapplication-service"
    "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/wallpapers/tanjiro.jpg"
    "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    "hyprdim --no-dim-when-only --persist --ignore-leaving-special --dialog-dim"
  ];
}
