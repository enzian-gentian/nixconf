{ inputs, ... }:
{
  flake.nixosModules.ide = { pkgs, ... }: {
    environment.systemPackages = with inputs.self.packages.${pkgs.system}; [
      vscodium
    ];
  };
}
