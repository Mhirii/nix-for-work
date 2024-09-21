{pkgs, ...}: 
{
	home.packages = with pkgs;[
    xdg-desktop-portal-hyprland
    hyprpicker
    hyprcursor
    hyprshot
    hyprlock
    hypridle
    hyprpaper
    fuzzel
	];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
  };


  imports = [
    ./scripts
    ./startup.nix
    ./binds.nix
    ./decoration.nix
    ./monitors.nix
    ./inputs.nix
    ./rules.nix
    ./variables.nix
  ];
}
