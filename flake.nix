{
  description = "A minimalist collection of custom Nix overlay packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: {
    overlay = final: prev: {
      base64 = import ./pkgs/base64.nix { inherit (final) lib; };
    };
    toBase64 = (import ./pkgs/base64.nix { lib = nixpkgs.lib; }).toBase64;
    lib = {
      inherit (flake-utils.lib) eachDefaultSystem;
    };
  };
}
