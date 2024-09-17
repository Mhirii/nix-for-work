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
				credential = {
					"https://github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
					"https://gist.github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
					"https://gitlab.com".helper = "!${pkgs.glab}/bin/glab auth git-credential";
					helper = "store";
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
