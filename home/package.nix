{ pkgs, ... }:
{
  home.packages = with pkgs;[
    neovim
		neovide
		tmux

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
    less

    nixpkgs-fmt

    cliphist

    (pkgs.nerdfonts.override { fonts = [ "Monaspace" "JetBrainsMono" ]; })
  ];

  programs = {
    bat.enable = true;
    fzf.enable = true;
    jq.enable = true;
    btop.enable = true;
  };
}
