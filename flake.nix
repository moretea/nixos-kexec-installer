{
  outputs = { self, nixpkgs }: {
    nixosConfigurations.kexec_installer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit nixpkgs; };
      modules = [ ./nix/configuration.nix ];
    };
  };
}
