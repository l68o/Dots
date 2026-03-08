{ config, pkgs, ... }:

{
  home.username = "lenny";
  home.homeDirectory = "/home/lenny";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  home.sessionVariables = {
  };

  imports = [
];

  
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    papirus-icon-theme
    nil
    lua-language-server
    bash-language-server
    marksman
    typescript-language-server
    vscode-langservers-extracted
    emmet-ls
  ];
}
