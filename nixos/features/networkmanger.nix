# Header
{ ... }:

{
  flake.nixosModules.nm = { ... }: {
    networking.networkmanager.enable = true;
  };
}
