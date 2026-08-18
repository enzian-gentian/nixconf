{ inputs, ... }:
{
  flake.nixosModules.fastfetch = { pkgs, ... }: {
    environment.systemPackages = with inputs.self.packages.${pkgs.system}; [
      fastfetch
    ];
  };
}
