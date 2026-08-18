{ self, ... }: {
  flake.nixosModules.general =
    {
      pkgs,
      config,
      ...
    }:
    {
      imports = [
        self.nixosModules.nix
        self.nixosModules.ssh
        self.nixosModules.git
      ];

      users.users.${config.preferences.user.name} = {
        isNormalUser = true;
        description = "${config.preferences.user.name}";
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
      };
    };
}
