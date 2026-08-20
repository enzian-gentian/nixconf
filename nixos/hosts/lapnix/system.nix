# Header
{
  inputs,
  self,
  ...
}:

{
  # Create System
  flake.nixosConfigurations.lapnix = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux"; # System Architecture
    specialArgs = { inherit inputs self; }; # Inject Sets
    modules = [
      self.nixosModules.hardwareLapnix # Hardware Configuration for Lapnix
      self.nixosModules.hostLapnix # Software Configuration for Lapnix
    ];
  };
}
