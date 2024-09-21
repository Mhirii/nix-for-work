{pkgs, ...}:{

	home.packages = with pkgs;[
    nwg-look
    nwg-displays
    swaynotificationcenter
    swappy
    wl-clipboard
    waybar
    rofi-wayland
	];
}
