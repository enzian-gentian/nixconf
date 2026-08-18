{
  perSystem =
    { pkgs, ... }:
    let
      gitDependencies = with pkgs; [
        git-lfs
        openssh
      ];
    in
    {
      packages.git = pkgs.symlinkJoin {
        name = "git";
        paths = [ pkgs.git ];
        nativeBuildInputs = [ pkgs.makeWrapper ];

        postBuild = ''
          wrapProgram $out/bin/git \
            --set GIT_CONFIG_GLOBAL "${./gitconfig}" \
            --prefix PATH : ${pkgs.lib.makeBinPath gitDependencies}
        '';
      };
    };
}
