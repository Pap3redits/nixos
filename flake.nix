{
  description = "A simple NixOS flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #nix-doom-emacs-unstraightened.url = "github:marienz/nix-doom-emacs-unstraightened";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        nixos-thinkpad = let
        in 
          nixpkgs.lib.nixosSystem {
            modules = [
              #./configuration.nix
              ./hosts/nixos-thinkpad
              home-manager.nixosModules.home-manager
              nix-flatpak.nixosModules.nix-flatpak

              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {
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
                home-manager.users.christian = import ./home;


              }

              #  inputs.nix-doom-emacs-unstraightened.homeModule
            ];
          };
        nox-nostra = let
        in
          nixpkgs.lib.nixosSystem {
            modules = [
              #./configuration.nix
              ./hosts/nox-nostra
              home-manager.nixosModules.home-manager
              nix-flatpak.nixosModules.nix-flatpak
              stylix.nixosModules.stylix
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {
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
                home-manager.users.christian = import ./home;

              }

              #  inputs.nix-doom-emacs-unstraightened.homeModule
            ];
          }; 
        };
    };
}
