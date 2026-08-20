{ inputs, ... }:

{
  imports = [
    # Homeless Config
    inputs.wrapper-modules.flakeModules.default
    # Global Configs
    inputs.flake-parts.flakeModules.modules
  ];

  options = {
    # Makes flakes.wrappers.xxx usable

    # flake has an array of options that point to more options
    flake = inputs.flake-parts.lib.mkSubmoduleOptions {
      # The pointed too options
      wrappers = inputs.nixpkgs.lib.mkOption {
        # Creates empty array
        default = { };
      };
    };
  };

  config = {
    # List of supported system architectures
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    # Per system architecture
    perSystem = { system, ... }: {
      # Overwrite system.pkgs with nixpkgs
      _module.args.pkgs = import inputs.nixpkgs {
        # Inherit the architecture
        inherit system;
        # Allow unfree pkgs globally
        config.allowUnfree = true;
      };
    };
  };
}
