{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    systems.url = "github:nix-systems/default";
    devenv.url = "github:cachix/devenv";
    dapptools.url = "github:dapphub/dapptools";
  };

  outputs = { self, nixpkgs, devenv, systems, dapptools, ... } @ inputs:
    let
      forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      devShells = forEachSystem
        (system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
            dappkgs = dapptools.packages.${system};
          in
          {
            default = devenv.lib.mkShell {
              inherit inputs pkgs;
              modules = [
                {
                  packages = [
                    dappkgs.solc_0_6_12
                  ];

                  enterShell = ''
                    export PATH="$PWD/.devenv/profile/bin:$PATH"
                  '';
                }
              ];
            };
          });
    };
}
