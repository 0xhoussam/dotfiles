{}:
{
  bindm = [
    "$mainMod, mouse_down, workspace, e+1"
    "$mainMod, mouse_up, workspace, e-1"
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
  bindl = [
    "XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
    "XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
    "XF86AudioRaiseVolume, exec,  swayosd-client --output-volume raise"
    "XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
    "XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
  ];
  bind = [
    "$mainMod, Return, exec, alacritty"
    "$mainMod, b, exec, brave"
    "$mainMod, W, killactive, "
    "$mainMod, M, exit, "
    "$mainMod, E, exec, nautilus"
    "$mainMod, V, togglefloating, "
    "$mainMod, R, exec, walker --theme libadwaita"
    "$mainMod, P, pseudo, # dwindle"
    "$mainMod SHIFT, J, togglesplit, # dwindl"
    "$mainMod, T, exec, flatpak run net.nokyan.Resources"

    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"

    "$mainMod, h, movefocus, l"
    "$mainMod, l, movefocus, r"
    "$mainMod, j, movefocus, u"
    "$mainMod, k, movefocus, d"

    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"
    "$mainMod, 6, workspace, 6"
    "$mainMod, 7, workspace, 7"
    "$mainMod, 8, workspace, 8"
    "$mainMod, 9, workspace, 9"
    "$mainMod, 0, workspace, 10"

    "$mainMod SHIFT, 1, movetoworkspace, 1"
    "$mainMod SHIFT, 2, movetoworkspace, 2"
    "$mainMod SHIFT, 3, movetoworkspace, 3"
    "$mainMod SHIFT, 4, movetoworkspace, 4"
    "$mainMod SHIFT, 5, movetoworkspace, 5"
    "$mainMod SHIFT, 6, movetoworkspace, 6"
    "$mainMod SHIFT, 7, movetoworkspace, 7"
    "$mainMod SHIFT, 8, movetoworkspace, 8"
    "$mainMod SHIFT, 9, movetoworkspace, 9"
    "$mainMod SHIFT, 0, movetoworkspace, 10"


    "$mainMod SHIFT, V, exec, walker --modules clipboard"
    "$mainMod CTRL, L, exec, hyprlock"
    "$mainMod SHIFT CTRL, L, exec, hyprlock && hyprctl dispatch dpms off"

    "$mainMod CTRL, P, exec, hyprshot -m window"
    "$mainMod SHIFT, P, exec, hyprshot -m region"

    "$mainMod, F, fullscreen"
  ];
}
