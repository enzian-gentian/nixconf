{ ... }:

{
  flake.nixosModules.x11kmZA = { ... }: {
    services.xserver.xkb = {
      layout = "za";
      variant = "";
    };
  };
}
