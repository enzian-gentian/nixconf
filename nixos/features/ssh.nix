{ inputs, ... }:
{
  flake.nixosModules.ssh = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.self.packages.${pkgs.system}.ssh
    ];

    programs.ssh.extraConfig = builtins.readFile ../../wrappedPrograms/ssh/ssh_config;

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
