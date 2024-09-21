{  ... }:
let
  monitor = {
    normal = [
      "Unknown-1, disable"
      ", preferred, auto, 1.00 "
      ", preferred, -1920x0, 1.00"
    ];
  };
in
{
  wayland.windowManager.hyprland.settings = {

    #monitor= eDP-1, 1920x1080@60.00000, 0x0, 1
    monitor = monitor.normal;
  };
}
