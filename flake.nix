{
  description = "nix environment with vscode/gemini code assist";

  # Flake inputs
  inputs = {
    # until https://github.com/NixOS/nixpkgs/pull/507766 is merged
    nixpkgs.url = "github:ahappypie/nixpkgs/fix/vscode-with-extensions-macos-path"; 
  };

  # Flake outputs
  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      overlays = [
        (final: prev: {
          nodejs = prev.nodejs_24;
        })
      ];

      # Systems supported
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      # Helper to provide system-specific attributes
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs allSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system overlays; };
          }
        );
    in
    {
      # Development environment output
      devShells = forAllSystems (
        { pkgs }:
        let
          commonBuildInputs = with pkgs; [ ];
          commonPackages = with pkgs; [ nodejs pnpm ];
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ ] ++ commonBuildInputs;
            # The Nix packages provided in the environment
            packages = with pkgs; [ ] ++ commonPackages;
          };

          vscode = pkgs.mkShell {
            buildInputs = with pkgs; [ ] ++ commonBuildInputs;
            # The Nix packages provided in the environment
            packages =
              with pkgs;
              [
                (vscode-with-extensions.override {
                  vscode = vscodium;
                  vscodeExtensions =
                    with vscode-extensions;
                    [
                      astro-build.astro-vscode

                      jnoortheen.nix-ide
                      mkhl.direnv
                      Google.gemini-cli-vscode-ide-companion
                    ]
                    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [ ];
                })
              ]
              ++ commonPackages;
          };
        }
      );

      # Development environment output
      formatter = forAllSystems ({ pkgs }: pkgs.nixfmt-tree);
    };
}
