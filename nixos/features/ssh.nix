{ inputs, ... }:
{
  flake.nixosModules.ssh = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.self.packages.${pkgs.system}.ssh
    ];

    services.openssh = {
      enable = true;
      ports = [ 22 ];

      openFirewall = true;

      settings = {
        PermitRootLogin = "no";

        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        X11Forwarding = false;
      };
    };
  };
}
