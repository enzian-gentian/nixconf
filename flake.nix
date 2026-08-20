{
  inputs = {
    # Package Repo from Nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Modular Nix
    flake-parts.url = "github:hercules-ci/flake-parts";
    # Homeless Package Configuration
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  # Merged Flake File
  outputs =
    inputs:
    let
      inherit (inputs.nixpkgs) lib;
      inherit (lib) hasPrefix;
      inherit (lib.fileset) toList fileFilter;

      # Filter
      isNixModule =
        file:
        # Check for the file extension "nix"
        file.hasExt "nix"
        &&
          # Check that it is not flake.nix
          # Importing flake.nix will cause an infinite loop
          file.name != "flake.nix"
        &&
          # Check for underscore prefix
          # Disabled importing for "_"
          # Allows for silent files
          !hasPrefix "_" file.name;

      # List (valid) nix files
      validNixModules =
        path:
        # Create List
        toList (
          # File filterer and filter against provided path
          fileFilter isNixModule path
        );

      # Merge flake files at run time
      # All imported files inherit inputs
      mkFlake = inputs.flake-parts.lib.mkFlake { inherit inputs; };
    in
    mkFlake { imports = validNixModules ./nixos/.; };
}
