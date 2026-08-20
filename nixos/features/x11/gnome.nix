{ ... }:

{
  flake.nixosModules.x11gnome = { ... }: {
    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  };
}
