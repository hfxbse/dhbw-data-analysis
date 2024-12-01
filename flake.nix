{
  description = "R interpreter for this R notebook";

  inputs = {
    # Use R < 4.4
    # See https://youtrack.jetbrains.com/issue/R-1543/R-Console-function-calls-fail-complain-about-excessive-arguments
    nixpkgs.url = "github:nixos/nixpkgs?ref=9ca3f649614213b2aaf5f1e16ec06952fe4c2632";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.R = pkgs.rWrapper.override {
      packages = with pkgs.rPackages; [
        knitr
        readxl
        rmarkdown
        rstudioapi
      ];
    };

    packages.default = self.packages.${system}.R;
  });
}
