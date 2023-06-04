#!/usr/bin/env bash
set -euo pipefail

if command -v nix > /dev/null; then
  echo "Nix already installed"
else
  sh <(curl -L https://nixos.org/nix/install) --daemon --yes
fi

# Load nix
. /etc/bash.bashrc

nix build --extra-experimental-features 'nix-command flakes' .#nixosConfigurations.kexec_installer.config.system.build.kexec_tarball
tar -xf ./result/tarball/nixos-system-x86_64-linux.tar.xz
./kexec_nixos
