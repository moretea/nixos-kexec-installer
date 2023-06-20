#!/usr/bin/env bash
set -euo pipefail

if command -v nix > /dev/null; then
  echo "Nix already installed"
else
  echo "Install nix, by running: sh <(curl -L https://nixos.org/nix/install) --daemon --yes"
  echo "Then re-run your shell via EXEC \$SHELL"
  exit 1
fi

nix build --extra-experimental-features 'nix-command flakes' .#nixosConfigurations.kexec_installer.config.system.build.kexec_tarball
tar -xf ./result/tarball/nixos-system-x86_64-linux.tar.xz
./kexec_nixos
