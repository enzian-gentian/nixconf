{ ... }:

{
  flake.nixosModules.x11kmUS = { ... }: {
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
