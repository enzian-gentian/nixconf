{
  flake.nixosModules.nix = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      nil
      nixd
      statix
      alejandra
      manix
      nix-inspect
      nixfmt
    ];

    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      pure-eval = false;
    };
  };
}
