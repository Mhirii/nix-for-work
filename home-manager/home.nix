{ username, config, pkgs, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
		neovim

    (pkgs.nerdfonts.override { fonts = [ "Monaspace" "JetBrainsMono" ]; })

  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.home-manager.enable = true;
}
