{
  nixConfig = {
    substituters = [
      "https://nixoscache.clorine.ru"
    ];
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    yandex-browser = { 
      url = "github:miuirussia/yandex-browser.nix"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixos-modules = {
    #   url = "file:/home/nd1/nixos-modules";
    #   flake = false;
    # };

    nixos-modules = {
      url = "github:slawacats/nixos-modules";
      flake = false;
    };
  };

  outputs = { self, nixos-modules, nixpkgs, nixpkgs-unstable, home-manager, yandex-browser, ... }@inputs: {
    nixosConfigurations = {
      nixos-nd1-mobile = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          (nixos-modules + "/modules/node.nix")
          (nixos-modules + "/specific/nixos-nd1-mobile.nix")

  	      { nixpkgs.config.allowUnfree = true; }

  	      home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nd1 = import (nixos-modules + "/home.nix");
          }
        ];
        specialArgs = { inherit inputs;
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
      };
      nixos-nd1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          (nixos-modules + "/modules/node.nix")
          (nixos-modules + "/specific/nixos-nd1.nix")

  	      { nixpkgs.config.allowUnfree = true; }

  	      home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nd1 = import (nixos-modules + "/home.nix");
          }
        ];
        specialArgs = { inherit inputs;
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
      };
    };
  };
}
