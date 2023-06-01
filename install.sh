#!/usr/bin/env bash
set -euo pipefail

if command -v nix > /dev/null; then
  echo "Nix already installed"
else
  sh <(curl -L https://nixos.org/nix/install) --daemon --yes
fi

nix build --extra-experimental-features 'nix-command flakes' .#nixosConfigurations.kexec_installer.config.system.build.kexec_tarball 

