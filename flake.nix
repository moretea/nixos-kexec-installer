{
  outputs = { self, nixpkgs }: {
    nixosConfigurations.kexec_installer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      extraAttrs = { inherit nixpkgs; };
      modules = [ ./nix/configuration.nix ];
    };
  };
}
