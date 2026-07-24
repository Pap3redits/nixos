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
      url = "github:noctalia-dev/noctalia/cachix";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
    
    deadlock-api-ingest.url = "github:deadlock-api/deadlock-api-ingest";

    superfile.url = "github:yorukot/superfile";
    superfile.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      nix-flatpak,
      nixpkgs,
      home-manager,
      stylix,
      nvf,
      deadlock-api-ingest,
      ...
    }:
    {

      nixosConfigurations = {
        itani-lo-sahn = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/itani-lo-sahn
            ./hosts/itani-lo-sahn/noctalia.nix
            home-manager.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
            stylix.nixosModules.stylix

            {
              nixpkgs.overlays = [
                (_: super: {
                  python314Packages = super.python314Packages.overrideScope (_: pysuper: {
                    patool = pysuper.patool.overridePythonAttrs (_: {
                      doCheck = false;
                    });
                  });
                })
              ];

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
            nvf.nixosModules.default
            {
              nixpkgs.overlays = [
                (_: super: {
                  python314Packages = super.python314Packages.overrideScope (_: pysuper: {
                    patool = pysuper.patool.overridePythonAttrs (_: {
                      doCheck = false;
                    });
                  });
                })
              ];
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
        ira-domini = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/ira-domini
            ./hosts/ira-domini/noctalia.nix
            home-manager.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
            stylix.nixosModules.stylix
            nvf.nixosModules.default
            deadlock-api-ingest.nixosModules.default
            {
              nixpkgs.overlays = [
                (_: super: {
                  python314Packages = super.python314Packages.overrideScope (_: pysuper: {
                    patool = pysuper.patool.overridePythonAttrs (_: {
                      doCheck = false;
                    });
                  });
                })
              ];

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
              services.deadlock-api-ingest = {
                enable = true;
                user = "christian";
                group = "users";
                package = deadlock-api-ingest.packages.x86_64-linux.default;
              };
            }

          ];
        };
      };
    };
}
