{
  outputs = { self, nixpkgs }: {
    nixosConfigurations.kexec_installer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./nix/configuration.nix ];
    };
  };
}
