{
  description = "A minimalist collection of custom Nix overlay packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nvim.url = "path:./pkgs/neovim";
  };

  outputs = { self, ... } @inputs: {
    overlay = final: prev: {
      base64 = import ./pkgs/base64.nix { inherit (final) lib; };
    };
    toBase64 = (import ./pkgs/base64.nix { lib = inputs.nixpkgs.lib; }).toBase64;
    lib = {
      inherit (inputs.flake-utils.lib) eachDefaultSystem;
    };
    inherit (inputs.nvim) packages devShells overlays;
  };
}
