{
  description = "Neovim derivation exposing lunarvim from nixpkgs-unstable";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = rec {
          default = lunarvim;
          lunarvim = pkgs.lunarvim;
        };

        devShells.default = pkgs.mkShell {
          name = "lunarvim-devShell";
          buildInputs = with pkgs; [
            lunarvim
            lua-language-server
            nil
            stylua
            luajitPackages.luacheck
          ];
        };
      }
    );
}
