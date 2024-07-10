{ ... }: {
  imports = [ # Include the results of the hardware scan.
    ./boot
    ./files.nix
    ./udev.nix
    ./utils.nix
    ./stylix.nix
  ];
}
