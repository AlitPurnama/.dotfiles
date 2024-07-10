{ pkgs, ... }: {
  gtk.enable = true;
  gtk.iconTheme = {
    package = pkgs.nordzy-icon-theme;
    name = "Nordzy-pink-dark";
  };
}
