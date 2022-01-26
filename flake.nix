{
  # unstable (2022-01-26)
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/aebb99a823daabd2e7f549af41a9a1d10e14710f";
  inputs.nix_bitcoin = {
    url = "github:fort-nix/nix-bitcoin/v0.0.46";
    flake = false;
  };

  outputs = { ... }@inputs: let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs { inherit system; };

    shellEnvVars = {
      inherit (inputs) nixpkgs nix_bitcoin;

      nix_2_3 = "${pkgs.nix_2_3}/bin";
      nix_2_4 = "${pkgs.nix_2_4}/bin";
      nix_2_6 = "${pkgs.nix_2_6}/bin";

      IN_BENCHMARK_SHELL = true;
    };

    shellPkgs = with pkgs; [
      bash
      hyperfine
    ];

  in {
    devShell.${system} = derivation ({
      inherit system;
      name = "shell-env";
      outputs = [ "out" ];
      builder = pkgs.stdenv.shell;
      PATH = pkgs.lib.makeBinPath shellPkgs;
    } // shellEnvVars);
  };
}
