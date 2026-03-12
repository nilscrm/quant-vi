{
  description = "Vine Quant";

  inputs = {
    nixpkgs.follows = "vine/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    vine.url = "github:VineLang/vine/dev";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      vine,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        vineCli = vine.packages.${system}.vine;
      in
      {
        checks = {
          tests =
            pkgs.runCommand "tests"
              {
                nativeBuildInputs = [ vineCli ];
                src = ./.;
              }
              ''
                cd "$src"
                vine run test/test.vi --lib quant/
                mkdir -p "$out"
              '';
        };

        devShells.default = pkgs.mkShell {
          packages = [
            vineCli
          ];
        };
      }
    );
}
