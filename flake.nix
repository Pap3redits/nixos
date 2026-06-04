{
  description = "A simple NixOS flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/v5";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nix-flatpak,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }:
    {

      nixosConfigurations = {
        itani-lo-sahn = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/itani-lo-sahn
            home-manager.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
            stylix.nixosModules.stylix

            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  xdg = {
                    mime.enable = true;
                    mimeApps = {
                      enable = true;
                      defaultApplications = {
                        "text/html" = "app.zen_browser.zen.desktop";
                        "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
                        "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
                        "x-scheme-handler/about" = "app.zen_browser.zen.desktop";
                        "x-scheme-handler/unknown" = "app.zen_browser.zen.desktop";
                      };
                    };
                  };
                };
                users.christian = import ./home;
              };

            }

          ];
        };
        nox-nostra = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/nox-nostra
            ./hosts/nox-nostra/noctalia.nix
            home-manager.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
            stylix.nixosModules.stylix
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  xdg = {
                    mime.enable = true;
                    mimeApps = {
                      enable = true;
                      defaultApplications = {
                        "text/html" = "app.zen_browser.zen.desktop";
                        "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
                        "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
                        "x-scheme-handler/about" = "app.zen_browser.zen.desktop";
                        "x-scheme-handler/unknown" = "app.zen_browser.zen.desktop";
                      };
                    };
                  };
                };
                users.christian = ./home;
              };

            }

          ];
        };
      };
    };
}
