{
  perSystem = { pkgs, ... }: {
    packages.google-chrome = pkgs.symlinkJoin {
      name = "google-chrome";
      paths = [ pkgs.google-chrome ];
      nativeBuildInputs = [ pkgs.makeWrapper ];

      postBuild = ''
        wrapProgram $out/bin/google-chrome-stable \
          --add-flags "--ozone-platform-hint=auto" \
          --add-flags "--enable-features=TouchOverscrollHistoryNavigation" \
          --run "mkdir -p ~/.config/google-chrome/Policies/managed \
          && ln -sf ${./policy.json} ~/.config/google-chrome/Policies/managed/policy.json"
      '';
    };
  };
}
