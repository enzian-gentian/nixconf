{
  perSystem = { pkgs, ... }: {
    packages.fastfetch = pkgs.symlinkJoin {
      name = "fastfetch";
      paths = [ pkgs.fastfetch ];
      nativeBuildInputs = [ pkgs.makeWrapper ];

      postBuild = ''
        wrapProgram $out/bin/fastfetch \
          --add-flags "-c ${./config.jsonc}"
      '';
    };
  };
}
