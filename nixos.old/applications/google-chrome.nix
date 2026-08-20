{ inputs, ... }:
{
  flake.nixosModules.google-chrome = { pkgs, ... }: {
    environment.systemPackages = with inputs.self.packages.${pkgs.system}; [
      google-chrome
    ];
  };
}
