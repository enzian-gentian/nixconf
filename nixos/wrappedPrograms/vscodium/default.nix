{
  perSystem =
    { pkgs, ... }:
    let
      vscodiumWithExtensions = pkgs.vscode-with-extensions.override {
        vscode = pkgs.vscodium;
        vscodeExtensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          pkief.material-icon-theme
          catppuccin.catppuccin-vsc
        ];
      };
    in
    {
      packages.vscodium = pkgs.symlinkJoin {
        name = "vscodium";
        paths = [ vscodiumWithExtensions ];
        nativeBuildInputs = [ pkgs.makeWrapper ];

        postBuild = ''
          	  wrapProgram $out/bin/codium \
          	    --run "mkdir -p ~/.config/VSCodium/User \
                && ln -sf ${./settings.json} ~/.config/VSCodium/User/settings.json"
          	'';
      };
    };
}
