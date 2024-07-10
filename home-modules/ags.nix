{ pkgs, inputs, ... }:
let

in {
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    #configDir = ./ags-widget;
    #extraPackages = with pkgs; [ gtksourceview webkitgtk accountsservice ];
  };
}
