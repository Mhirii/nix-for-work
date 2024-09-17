{ username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.05";

  targets.genericLinux.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.home-manager.enable = true;

  imports = [
		./git.nix
		./shell.nix
		./package.nix
	];
}
