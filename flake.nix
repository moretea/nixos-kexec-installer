{
  outputs = { self, nixpkgs }: {
    nixosConfigurations.kexec_installer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialAttrs = { inherit nixpkgs; };
      modules = [ ./nix/configuration.nix ];
    };
  };
}
