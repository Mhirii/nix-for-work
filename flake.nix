{
  description = "Flake for Ubuntu at Work";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "dell";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
			nix = {
				settings = {
					auto-optimise-store = true;
					experimental-features = [ "nix-command" "flakes" ];
					substituters = [ "https://nix-gaming.cachix.org" ];
				};
			};
			nixpkgs.config.allowUnfree = true;

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ (.home-manager/home.nix // { extraSpecialArgs = { inherit username; }; }) ];
      };
    };
}
