{ self, ... }: {
  flake.nixosModules.general =
    {
      pkgs,
      config,
      ...
    }:
    {
      imports = [
        # Base
        # Gives defaults for configuration
        self.nixosModules.base

        # Bootloader
        self.nixosModules.systemd

        # Networking
        self.nixosModules.nm

        # Locale
        self.nixosModules.localeZA

        # Nix Configurations
        self.nixosModules.nix
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
