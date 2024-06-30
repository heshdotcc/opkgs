{
  description = "A minimalist collection of custom Nix overlay packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    overlays = [
      (final: prev: {
        base64 = import ./pkgs/base64.nix { inherit (final) lib; };
      })
    ];

    toBase64 = (import ./pkgs/base64.nix { inherit (nixpkgs.lib); }).toBase64;
  };
}

