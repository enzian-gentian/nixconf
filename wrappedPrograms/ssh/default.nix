{
  flake.nixosModules.ssh =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.openssh ];

      programs.ssh.extraConfig = builtins.readFile ./ssh_config;

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
