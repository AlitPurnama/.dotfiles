{
  description = "A very basic flake";

  nixConfig = {
    extra-subtituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://ezkea.cachix.org" ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    ags.url = "github:Aylur/ags";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixvim, stylix, aagl, ags }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      userSettings = { wallpaper = ./wallpapers/zzz.jpeg; };
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs userSettings; };
          modules = [
            stylix.nixosModules.stylix
            nixvim.nixosModules.nixvim
            ./configuration.nix
            #home-manager.nixosModules.home-manager
            #{
            #  home-manager = {
            #    useGlobalPkgs = true;
            #    useUserPackages = true;
            #    extraSpecialArgs = { inherit inputs userSettings; };
            #  };
            #  home-manager.users.tenslime = import ./home.nix;

            #}
          ];
        };
      };

    };
}
