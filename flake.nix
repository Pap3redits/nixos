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
  };

  noctalia = {
    url = "github:noctalia-dev/noctalia-shell";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
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
            #./configuration.nix
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
          modules = [
            #./configuration.nix
            ./hosts/nox-nostra
            #./hosts/nox-nostra/wayle.nix
            home-manager.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
            stylix.nixosModules.stylix
            ./home/ui/noctalia.nix

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
