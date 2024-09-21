{
  description = "Flake for Ubuntu at Work";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
		hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }:
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

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
					.home/home.nix
					hyprland.homeManagerModules.default
				];
				extraSpecialArgs = { inherit username; };
      };
    };
}
