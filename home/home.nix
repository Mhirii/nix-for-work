{ config, pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.05";

  targets.genericLinux.enable = true;

	nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  imports = [
		./git.nix
		./shell.nix
		./package.nix
		./kitty.nix
		./desktop
	];

  programs.home-manager.enable = true;

	# will update font cache when needed
	fonts.fontconfig.enable = true;
}
