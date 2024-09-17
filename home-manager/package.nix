{ pkgs, ... }:
{
  home.packages = with pkgs;[
    neovim
		tmux
		neovide

		lazydocker
		docker
		docker-compose
		docker-buildx

    nodePackages.pnpm
    nodejs_22
    go
    prettierd
    yarn
    esbuild
    typescript

    ripgrep
    fd

    nixpkgs-fmt

    less

    (pkgs.nerdfonts.override { fonts = [ "Monaspace" "JetBrainsMono" ]; })
  ];

  programs = {
    bat.enable = true;
    fzf.enable = true;
    jq.enable = true;
    btop.enable = true;
  };
}
