{ self, ... }: {
  flake.nixosModules.dev =
    {
      pkgs,
      config,
      ...
    }:
    {
      imports = [
        # Desktop Applications
        self.nixosModules.ide
        self.nixosModules.google-chrome

        # Terminal Applications
        self.nixosModules.fastfetch
        self.nixosModules.git
        self.nixosModules.ssh
      ];
    };
}
