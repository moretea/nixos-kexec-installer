{
  outputs = { self, nixpkgs }: {
    nixosConfigurations.kexec_installer.x86_64-linux = let
      pkgs = import nixpkgs { system = "x86_64"; };
      configuration = pkgs.callPackage ./nix/configuration.nix;
    in configuration;
  };
}
