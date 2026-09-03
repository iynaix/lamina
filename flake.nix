{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      lib = import ./lib.nix { inherit (nixpkgs) lib; };

      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
          nixd
          nixfmt
        ];
      };
    };
}
