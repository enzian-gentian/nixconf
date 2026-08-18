{ inputs, ... }:
{
  flake.nixosModules.git = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.self.packages.${pkgs.system}.git
    ];
  };
}
