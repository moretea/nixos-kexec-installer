{
  outputs = { self, nixpkgs }: {
    nixosConfigurations.x86_64-linux.kexec_installer = let
      pkgs = import nixpkgs { system = "x86_64"; };
      configuration = pkgs.callPackage ./nix/configuration.nix;
    in configuration;
  };
}
