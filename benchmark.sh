#!/usr/bin/env bash

set -euo pipefail

if [[ ! -v IN_BENCHMARK_SHELL ]]; then
    cd "${BASH_SOURCE[0]%/*}"
    exec nix develop -c ./benchmark.sh
fi

# A simple NixOS system
read -d '' sys1 <<EOF || :
(import "$nixpkgs/nixos" {
  configuration = { pkgs, lib, ... }: with lib; {
    services.xserver.enable = true;
  };
}).vm.outPath
EOF

# A larger system
read -d '' sys2 <<EOF || :
  ((import "$nix_bitcoin/test/tests.nix" {}).default).vm.outPath
EOF

oldEvalMode() {
  "$1"/nix-instantiate --eval -E "$2" >/dev/null
}

newEvalMode() {
  "$1"/nix eval --experimental-features nix-command --impure --expr "$2" >/dev/null
}

export sys1 sys2
export -f oldEvalMode newEvalMode

benchmark() {
  hyperfine --warmup 1 --min-runs 3 "$@"
  echo
}

echo "Compare old and new eval mode for Nix 2.6, sys1"
echo "=============================================="
benchmark \
  'oldEvalMode $nix_2_6 "$sys1"' \
  'newEvalMode $nix_2_6 "$sys1"'

echo "Compare old and new eval mode for Nix 2.6, sys2"
echo "=============================================="
benchmark \
  'oldEvalMode $nix_2_6 "$sys2"' \
  'newEvalMode $nix_2_6 "$sys2"'

echo "Compare old eval mode for Nix 2.3, 2.4, 2.6, sys1"
echo "======================================"
benchmark \
    'oldEvalMode $nix_2_3 "$sys1"' \
    'oldEvalMode $nix_2_4 "$sys1"' \
    'oldEvalMode $nix_2_6 "$sys1"'
