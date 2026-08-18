{ inputs, ... }: {
  flake.nixosModules.ssh = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.self.packages.${pkgs.system}.ssh
    ];
  };
}
