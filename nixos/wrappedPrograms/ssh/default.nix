{
  perSystem = { pkgs, ... }: {
    packages.ssh = pkgs.symlinkJoin {
      name = "ssh";
      paths = [ pkgs.openssh ];
      nativeBuildInputs = [ pkgs.makeWrapper ];

      postBuild = ''
        wrapProgram $out/bin/ssh \
          --add-flags "-F ${./ssh_config}"
      '';
    };
  };
}
