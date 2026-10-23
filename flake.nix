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
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";


    superfile.url = "github:yorukot/superfile";
    superfile.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

  };

  outputs =
    inputs@{
      nix-flatpak,
      nixpkgs,
      home-manager,
      stylix,
      nvf,
      ...
    }:
    {

      nixosConfigurations = {
        itani-lo-sahn = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/itani-lo-sahn
            ./hosts/itani-lo-sahn/noctalia.nix
            home-manager.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
            stylix.nixosModules.stylix
            nvf.nixosModules.default

            {
              nixpkgs.overlays = [
                (_: super: {
                  python314Packages = super.python314Packages.overrideScope (
                    _: pysuper: {
                      patool = pysuper.patool.overridePythonAttrs (_: {
                        doCheck = false;
                      });
                    }
                  );
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
                  python314Packages = super.python314Packages.overrideScope (
                    _: pysuper: {
                      patool = pysuper.patool.overridePythonAttrs (_: {
                        doCheck = false;
                      });
                    }
                  );
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
            {
              nixpkgs.overlays = [
                (_: super: {
                  python314Packages = super.python314Packages.overrideScope (
                    _: pysuper: {
                      patool = pysuper.patool.overridePythonAttrs (_: {
                        doCheck = false;
                      });
                    }
                  );
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
      };
    };
}
