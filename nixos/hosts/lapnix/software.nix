# Header
{
  self,
  ...
}:

{
  flake.nixosModules.hostLapnix = { pkgs, ... }: {
    imports = [
      self.nixosModules.general
    ];

    networking.hostName = "lapnix";

    system.stateVersion = "26.05";
  };
}
