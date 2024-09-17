{ pkgs, ... }:
{
  home.shellAliases = {
    lg = "lazygit";
  };
  programs = {
    git = {
      enable = true;
      extraConfig = {
        core = {
          editor = "nvim";
          pager = "${pkgs.delta}/bin/delta";
        };
      };
      delta = {
        enable = true;
        options = {
          features = "decorations";
          side-by-side = true;
          interactive.keep-plus-minus-markers = false;
        };
      };
    };
    lazygit.enable = true;
  };
  home.packages = with pkgs;[
    delta
    gh
    glab
  ];
}
